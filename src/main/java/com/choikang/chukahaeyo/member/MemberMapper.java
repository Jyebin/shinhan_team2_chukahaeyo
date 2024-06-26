package com.choikang.chukahaeyo.member;

import com.choikang.chukahaeyo.board.model.InquiryVO;
import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.member.model.AdminVO;
import com.choikang.chukahaeyo.member.model.MemberVO;
import com.choikang.chukahaeyo.payment.model.PaymentVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface MemberMapper {
    // 로그인
    MemberVO login(MemberVO memberVO);

    // 이메일을 통해 회원 정보 조회
    MemberVO getUserInfoByEmail(String memberEmail);

    // 아이디를 통해서 회원 정보 조회
    MemberVO getUserInfoById(int memberID);

    // 회원 가입
    void register(MemberVO memberVO);

    // 중복 확인
    int checkEmailDuplicate(String memberEmail);

    // 가입 인증
    void memberVerify(int memberID);

    // 회원 탈퇴
    int unsign(MemberVO memberVO);

    // 아이디 패스워드 맞는지 확인, null일 가능성이 있어서 integer
    Integer validatePwd(MemberVO memberVO);

    // 회원 정보 수정
    int changeMemberInfo(
            @Param("memberID") int memberID,
            @Param("changeInfo") MemberVO changeInfo);

    // 카드 목록 가져오기
    List<CardVO> getCardList(int memberID);

    // 카드 전체 목록 가져오기
    List<CardVO> getCardAllList();

    // 필터링된 결제 내역 가져오기
    List<PaymentVO> getFilteredPaymentList(
            // map type으로 넘겨주기 때문에 param 타입을 명시해줘야함
            @Param("startDate") String startDate,
            @Param("endDate") String endDate,
            @Param("status") String status,
            @Param("search") String search);

    // 사용자 결제 내역 가져오기
    List<PaymentVO> getMemberPaymentAllList(int memberID);

    // 관리자 페이지 결제 내역 가져오기
    List<PaymentVO> getPaymentAllList();

    // 관리자 로그인
    AdminVO adminLogin(AdminVO adminVO);

    // 관리지 페이지 답변해야할 목록 가져오기
    List<InquiryVO> getNotAnsweredInquiryList();

    // 관리자 페이지 멤버 목록 가져오기
    List<MemberVO> getMemberAllList();

    // 회원 탈퇴
    void withdrawMember(MemberVO memberVO);

    // 관리자 페이지 가입자 수
    int selectTodayRegisterMember(String date);
}
