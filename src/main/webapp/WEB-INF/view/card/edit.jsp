<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html style="text-align: justify;">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>축하해요</title>
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <link rel="stylesheet" href="/resources/css/edit.css?after">
    <link rel="stylesheet" href="/resources/css/template/green.css">

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main" style="height: 50%;">
    <div class="sticker1" style="margin-right: 50px"></div>
    <div style="width: 100%; height: 100%;">
        <h2>< 카드 종류 > 가 만들어지는 중</h2>
        <div class="edit-main-div">
            <div class="edit-div" style="overflow: scroll;">
                <div class="edit-div-components">
                    <span class="head-text">이름</span>
                    <span class="warn-text">필수 항목입니다.</span>
                    <input type="text" class="edit-text" id="edit-name"/>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">날짜</span>
                    <span class="warn-text">필수 항목입니다.</span> <br>
                    <input type="radio" checked id="edit-dayRadio" name="day">하루 선택 <br>
                    <input type="radio" id="edit-daysRadio" name="day"/>여러날 선택
                    <input type="text" id="edit-day" class="edit-text" placeholder="날짜 선택"/>
                    <input type="text" id="edit-days" class="edit-text" placeholder="날짜 선택"/>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">사진</span>
                    <span class="edit-warn-text">필수 항목입니다.</span> <br>
                    <%-- 사진 첨부하는 버튼 --%>
                    <form method="post" enctype="multipart/form-data">
                        <input class="edit-inputFile" id="edit-file" type="file" value="첨부하기" onchange="loadFile(this)" accept="image/*"/>
                        <label class="edit-file-label" for="edit-file">첨부하기</label>
                    </form>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">문구</span>
                    <span class="edit-warn-text">필수 항목입니다.</span> <br>
                    <textarea id="edit-text" maxlength="255" placeholder="문구를 입력하세요"></textarea>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">이모티콘</span>
                    <span class="edit-warn-text">필수 항목입니다.</span> <br>
                    <input class="edit-emoji" type="text" name="emoji1"/>
                    <input class="edit-emoji" type="text" name="emoji2"/>
                    <input class="edit-emoji" type="text" name="emoji3"/>
                    <input class="edit-emoji" type="text" name="emoji4"/>
                    <p style="font-size:14px; color:#686868; width:90%;">
                        원하는 이모티콘을 <b>한 칸당 하나씩</b>
                        작성해주세요! <br>
                        양식을 지키지 않으면 이모티콘이 제대로 나오지 않을 수 있어요 😥 <br>
                        ‘윈도우 키 + .’을 이용하면 이모티콘을 입력할 수 있어요!
                    </p>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">시간</span>
                    <!-- 온오프 버튼 -->
                    <span class="edit-select-button">
                        <input type="checkbox" id="edit-time-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-time-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                    </span>
                    <div class="edit-showTime">
                        <input type="radio" checked id="edit-timeRadio" name="edit-time">시각 선택 <br>
                        <input type="radio" id="edit-timesRadio" name="edit-time"/>범위 시간 선택<br>
                        <input type="time" id="edit-time" placeholder="시간 선택"/>
                        <input type="time" id="edit-times" placeholder="시간 선택"/>
                    </div>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">장소</span>
                    <!-- 온오프 버튼 -->
                    <span class="edit-select-button">
                        <input type="checkbox" id="edit-place-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-place-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                    </span>
                    <div class="edit-place">
                        <input type="submit" value="주소 찾기"/>
                        <input type="text" class="edit-edit-text" placeholder="상세 주소 입력" name="edit-place">
                    </div>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">준비물</span>
                    <!-- 온오프 버튼 -->
                    <span class="edit-select-button">
                        <input type="checkbox" id="edit-prepare-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-prepare-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                    </span>
                    <textarea class="edit-prepare" maxlength="255" placeholder="준비물을 입력하세요"></textarea>
                </div>
                <hr>
                <div class="edit-div-components">
                    <span class="head-text">계좌 번호</span>
                    <!-- 온오프 버튼 -->
                    <span class="edit-select-button">
                        <input type="checkbox" id="edit-account-select" class="edit-check"/>
                        <label class="edit-btn-label" for="edit-account-select">
                            <span class="edit-onf_btn"></span>
                        </label>
                    </span>
                    <div class="edit-account">
                        <p style="margin-bottom:0;">은행</p>
                        <input type="text" id="edit-bank" name="edit-bank" class="edit-text"/>
                        <p style="margin-bottom:0;">계좌 번호</p>
                        <input type="text" id="edit-account-number" name="edit-accountNumber" class="edit-text"/>
                    </div>
                </div>
                <hr>
            </div>
            <div class="edit-middle-div">
                <div class="edit-preview-div" style="overflow:scroll"></div>
                <div class="edit-button-div">
                    <input class="edit-grey-btn" type="button" value="장바구니 담기"/>
                    <form id="edit-payment-form" action="/payments/process" method="post">
                        <input class="edit-grey-btn" type="button" id="edit-pay-button" value="결제하기">
                    </form>
                    <input class="edit-grey-btn" type="button" value="공개/비공개"/>
                </div>
            </div>
            <div class="edit-frame-div">
                <c:forEach items="${list}" var="t">
                    <img src="${t.thumbnail}" class="edit-frame" id="${t.template_id}"> <br>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="sticker2" style="margin-left: 50px"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<script type="text/javascript">
    // 이미지 업로드 기능
    function loadFile(input) {
        var file = input.files[0];
        // 파일 이름 표시
        $('.edit-file-label').text(file.name);
        var newImage = document.createElement("img");
        newImage.setAttribute("class", "uploadedImage");
        newImage.src = URL.createObjectURL(file);
        console.log(newImage)
        // conponent 추가
        $('.uploadedImage').replaceWith(newImage);
    }

    // 실시간 반영!
    $('.all-content').ready(function () {
        var text;
        // 이름
        $('#edit-name').on('input', function () {
            text = $(this).val();
            $('.card-name').text(text + originText);
        });
        // 설명
        $('#edit-text').on('input', function () {
            text = $(this).val();
            $('.text').text(text);
        });
        // 시간

        // 장소
        // 준비물
        // 계좌 번호
    });

    $(function () {
        $('#edit-days').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });
        $('#edit-days').on('apply.daterangepicker', function (ev, picker) {
            var selectDates = picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD');
            $(this).val(selectDates);
            $('.date').text(selectDates)
        });

        $('#edit-days').on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
        });

        $('#edit-day').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            autoUpdateInput: false,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10)
        });
        $('#edit-day').on('apply.daterangepicker', function(ev, picker) {
            var selectDate = picker.startDate.format('YYYY/MM/DD');
            $(this).val(selectDate);
            $('.date').text(selectDate);
        })
        // 각각 library를 이용해 초기값 세팅

        // 처음 선택 => 시각과 날짜 하나기 때문에 여러 개 선택은 숨김
        $('#edit-days').hide();
        $('#edit-times').hide();
        $('.edit-showTime').hide();
        $('.edit-place').hide();
        $('.edit-prepare').hide();
        $('.edit-account').hide();

        // 어떤 버튼을 클릭하냐에 따라 hide and show - 날짜
        $('#edit-dayRadio').click(function () {
            $('#edit-days').hide();
            $('#edit-day').show();
        })
        $('#edit-daysRadio').click(function () {
            $('#edit-day').hide();
            $('#edit-days').show();
        })

        // 어떤 버튼을 클릭하냐에 따라 hide and show - 시간
        $('#edit-timeRadio').click(function () {
            $('#edit-times').hide();
            $('#edit-time').show();
        })
        $('#edit-timesRadio').click(function () {
            $('#edit-times').show();
        })

        // 체크박스 제어
        $('#edit-time-select').click(function () {
            $('.edit-showTime').toggle();
        })
        $('#edit-place-select').click(function () {
            $('.edit-place').toggle();
        })
        $('#edit-prepare-select').click(function () {
            $('.edit-prepare').toggle();
        })
        $('#edit-account-select').click(function () {
            $('.edit-account').toggle();
        })
    });

    var IMP = window.IMP;
    IMP.init("imp72336673");

    function requestPay() {
        var today = new Date();
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours + minutes + seconds + milliseconds;

        console.log("Payment requested");

        IMP.request_pay({
            pg: 'uplus', // 토스페이
            pay_method: 'card',
            merchant_uid: "IMP" + makeMerchantUid,
            name: '당근 10kg',
            amount: 510000,
            buyer_email: 'Iamport@chai.finance',
            buyer_name: '아임포트',
            buyer_tel: '010-1234-5678',
            buyer_addr: '서울특별시 강남구 삼성동',
            buyer_postcode: '123-456',
            display: {
                card_quota: [3]  // 할부개월 3개월까지 활성화
            }
        }, function (rsp) {
            if (rsp.success) {
                console.log("결제 성공", rsp);
                console.log("응답 객체 구조:", JSON.stringify(rsp, null, 2));
                $.ajax({
                    url: '/payments/process',
                    type: 'POST',
                    contentType: 'application/json; charset=UTF-8',
                    data: JSON.stringify({
                        applyNum: rsp.apply_num,
                        buyer_email: rsp.buyer_email,
                        impUid: rsp.imp_uid,
                        merchantUid: rsp.merchant_uid,
                        paidAmount: rsp.paid_amount,
                        paidAt: rsp.paid_at,
                        status: rsp.status,
                        receiptUrl: rsp.receipt_url
                    }),
                    success: function(response) {
                        console.log("response" + response)
                        if(response.indexOf("결제") > -1){
                            location.href = "/payments/success";
                            console.log("결제 후 DB 저장 성공", response);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log("결제 후 DB 저장 실패", error);
                    }
                });
            } else {
                console.log("결제 실패", rsp);
                alert('Payment failed: ' + rsp.error_msg);
            }
        });
    }

    document.getElementById('edit-pay-button').addEventListener('click', function () {
        requestPay();
    });

    var originText;

    $('.edit-frame').click(function () {
        var template_id = $(this).attr("id");
        $.ajax({
            type: "GET",
            url: "/payments/edit/template.do",
            data: {id: template_id},
            contentType: "text/html; charset:UTF-8",
            success: function (data) {
                $('.edit-preview-div').html(data);
                originText = $('.card-name').text();
                $('.date').text($('#edit-day').val()); // 템플릿 선택 시 날짜 초기값 세팅
            }
        })
    })
</script>
</body>
</html>