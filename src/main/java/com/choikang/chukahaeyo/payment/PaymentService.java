package com.choikang.chukahaeyo.payment;

import com.choikang.chukahaeyo.common.DecodeUniCode;

import com.choikang.chukahaeyo.exception.ErrorCode;
import com.choikang.chukahaeyo.exception.model.CustomException;
import com.choikang.chukahaeyo.payment.model.PaymentVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class PaymentService {
    @Autowired
    private PaymentMapper paymentMapper;

    @Value("${imp.key}")
    private String key;

    @Value("${imp.secret}")
    private String secretKey;

    //@Transactional
    public int processPayment(PaymentDTO paymentDTO) {
        PaymentVO paymentVO = PaymentDTO.of(paymentDTO);
        paymentMapper.insertPayment(paymentVO);
        return paymentVO.getPayID();
    }

    public String getToken() {
        try {
            String apiUrl = "https://api.iamport.kr/users/getToken"; // 요청을 보낼 api 주소
            RestTemplate restTemplate = new RestTemplate(); // body 설정

            HttpHeaders headers = new HttpHeaders(); // header 설정
            headers.setContentType(MediaType.APPLICATION_JSON); // 콘텐츠 타입을 JSON으로 설정

            Map<String, String> keyMap = new HashMap<>();
            keyMap.put("imp_key", key);
            keyMap.put("imp_secret", secretKey);
            ObjectMapper objectMapper = new ObjectMapper();
            String keyJson = objectMapper.writeValueAsString(keyMap);

            HttpEntity<String> requestEntity = new HttpEntity<>(keyJson, headers); // HttpEntity 객체 생성
            ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);

            if (responseEntity.getStatusCode() == HttpStatus.OK) {
                String responseBody = responseEntity.getBody(); //응답값의 body를 가져옴
                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
                JSONObject resultObject = (JSONObject) jsonObject.get("response");
                String accessToken = (String) resultObject.get("access_token");
                return accessToken;
            } else {
                throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "ACCESS_TOKEN을 가져오는 데 실패했습니다.");
            }
        } catch (ParseException e) {
            throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "JSON 응답 파싱에 실패했습니다.");
        } catch (Exception e) {
            throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, ErrorCode.INTERNAL_SERVER_ERROR.getMessage());
        }
    }

    @Transactional
    public void cancelPayment(int payID, String payNo) {
        try {
            String apiUrl = "https://api.iamport.kr/payments/cancel";

            HttpHeaders headers = new HttpHeaders();
            String accessToken = getToken();
            headers.set("Authorization", "Bearer " + accessToken);
            headers.setContentType(MediaType.APPLICATION_JSON);

            RestTemplate restTemplate = new RestTemplate();

            Map<String, String> keyMap = new HashMap<>();
            keyMap.put("imp_uid", payNo);
            keyMap.put("reason", "단순 고객 변심");

            ObjectMapper objectMapper = new ObjectMapper();
            String keyJson = objectMapper.writeValueAsString(keyMap);

            HttpEntity<String> requestEntity = new HttpEntity<>(keyJson, headers);
            ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);

            if (responseEntity.getStatusCode() == HttpStatus.OK) {
                String responseBody = responseEntity.getBody();
                JSONParser jsonParser = new JSONParser();
                JSONObject jsonObject = (JSONObject) jsonParser.parse(responseBody);
                JSONObject resultObject = (JSONObject) jsonObject.get("response"); //response값만 추출

                long canceledAt = (Long) resultObject.get("cancelled_at"); //취소 시각. 결제 취소가 아니면 0
                String failReason = (String) resultObject.get("fail_reason"); //결제 실패 사유. 결제 성공 시 null값.
                String cancelReceiptURL = (String) resultObject.get("receipt_url"); //결제건의 매출전표

                CancelDTO cancelDTO = new CancelDTO();
                cancelDTO.setCanceledAt(canceledAt);
                if (failReason == null) {
                    cancelDTO.setFailReason(failReason);
                } else {
                    cancelDTO.setFailReason(DecodeUniCode.unicodeDecode(failReason));
                }
                cancelDTO.setCancelReceiptURL(cancelReceiptURL);

                PaymentVO paymentVO = cancelDTO.of(cancelDTO);
                paymentVO.setPayID(payID);
                paymentVO.setPayNo(payNo);

                paymentMapper.cancelPayment(paymentVO);
                paymentMapper.deletePayment(paymentVO);
            } else {
                throw new CustomException(ErrorCode.INTERNAL_SERVER_ERROR, "결제 취소에 실패하였습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Integer> selectPaymentSum(String date) {
        List<Integer> list = new ArrayList<>();
        list.add(paymentMapper.selectPaymentDaySum(date));
        list.add(paymentMapper.selectPaymentMonthSum(date));
        list.add(paymentMapper.selectPaymentYearSum(date));
        return list;
    }

    public List<Integer> selectSixMonthsSum(String date) {
        return paymentMapper.selectSixMonthsSum(date);
    }
}