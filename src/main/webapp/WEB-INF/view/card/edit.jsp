<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>축하해요</title>
    <link rel="stylesheet" href="/resources/css/common.css"/>
    <style>
        /*카드 종류 나오는 부분*/
        h2 {
            margin-top: 50px;
        }

        /*edit, preview, frame이 들어가는 공간*/
        .main-div {
            justify-content: center;
            width: 100%;
            height: 100%;
            display: flex;
        }

        /*각각의 공간과 버튼이 들어가는 공간*/
        .edit-div {
            width: 20%;
            height: 100%;
            margin-right: 20px;
            background-color: #EEEEEE;
            text-align: center;
        }
        .middle-div {
            width: 60%;
            height: 100%;
        }
        .preview-div {
            width: 100%;
            height: 90%;
            background-color: #E4E4E4;
        }
        .button-div {
            text-align: center;
            height: 10%;
        }

        /*버튼 스타일*/
        input[type="button"] {
            position:relative;
            width: 30%;
            height: 90%;
            margin-top: 1%;
            border: 0;
            box-shadow: 0px 4px 0px #b6b6b6;
            background-color: #E2E2E2;
            font-size: 24px;
        }

        /*버튼 눌렸을 때*/
        input[type="button"]:active{
            box-shadow: 0 0 #adadad;
            background-color: #acacac;
        }

        input[type="submit"] {
            width : 90%;
            margin-top: 10px;
            background-color: #4171EA;
            color: #FFFFFF;
            border: 0;
            height: 35px;
        }

        .frame-div {
            width: 20%;
            height: 100%;
            margin-left: 20px;
            background-color: #EEEEEE;
        }

        /*edit div에 들어가는 각 항목들*/
        .comp {
            margin-top: 30px;
            text-align: left;
            margin-left: 20px
        }

        /*edit div에 들어가는 항목의 이름과 '필수 항목입니다' 경고*/
        .head-text {
            font-size:20px;
            font-weight:bold;
        }
        .warn-text {
            font-size:11px;
            color:#FF0000;
        }

        .emoji {
            width: 15% !important;
        }

        /*edit div 내의 text box*/
        input[type="text"] {
            margin-top: 10px;
            width: 85%;
            height: 30px;
            font-size: 15px;
        }

        /*구분선*/
        hr {
            width: 90%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /*radio 버튼*/
        input[type="radio"] {
            margin: 20px 10px 10px 10px;
        }

        textarea {
            margin-top: 10px;
            width: 90%;
            height: 100px;
            border: 0;
            resize: none;
        }

        input[type="time"] {
            margin-top: 10px;
        }
        /* 버튼 숨기기 */
        .check {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }
        label {
            position: relative;
            cursor: pointer;
            display: inline-block;
            width: 40px;
            height: 20px;
            background: #fff;
            border: 2px solid #888888;
            border-radius: 20px;
            transition: 0.2s;
        }
        label:hover {
            background: #efefef;
        }
        .onf_btn {
            position: absolute;
            top: 5px;
            left: 5px;
            display: inline-block;
            width: 11px;
            height: 11px;
            border-radius: 20px;
            background: #a8a8a8;
            transition: 0.2s;
        }
        /* checking style */
        .check:checked+label {
            background: #463030;
            border: 2px solid #453030;
        }

        /* move */
        .check:checked+label .onf_btn {
            left: 23px;
            background: #fff;
            box-shadow: 1px 2px 3px #00000020;
        }

        .select-button {
            float: right;
            margin-right: 15px;
        }

    </style>


    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1" style="margin-right: 50px"></div>
    <div style="width: 100%; height: 85%;">
        <h2>< 카드 종류 > 가 만들어지는 중</h2>
        <div class="main-div">
            <div class="edit-div" style="overflow: auto;">
                <div class="comp">
                    <span class="head-text">이름</span>
                    <span class="warn-text">필수 항목입니다.</span>
                    <input type="text"/>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">날짜</span>
                    <span class="warn-text">필수 항목입니다.</span> <br>
                    <input type="radio" checked id="dayRadio" name="day">하루 선택 <br>
                    <input type="radio" id="daysRadio" name="day"/>여러날 선택
                    <input type="text" id="day" value="" placeholder="날짜 선택"/>
                    <input type="text" id="days" value="" placeholder="날짜 선택"/>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">사진</span>
                    <span class="warn-text">필수 항목입니다.</span> <br>
<%--                    사진 ㅊㅁ부하는 버튼--%>
                    <input class="file" type="submit" value="첨부하기"/>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">문구</span>
                    <span class="warn-text">필수 항목입니다.</span> <br>
                    <textarea maxlength="255" placeholder="문구를 입력하세요"></textarea>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">이모티콘</span>
                    <span class="warn-text">필수 항목입니다.</span> <br>
                    <input class="emoji" type="text" name="emoji1"/>
                    <input class="emoji" type="text" name="emoji2"/>
                    <input class="emoji" type="text" name="emoji3"/>
                    <input class="emoji" type="text" name="emoji4"/>
                    <p style="font-size:14px; color:#686868; width:90%;">
                        원하는 이모티콘을 <b>한 칸당 하나씩</b>
                        작성해주세요! <br>
                        양식을 지키지 않으면 이모티콘이 제대로 나오지 않을 수 있어요 😥 <br>
                        ‘윈도우 키 + .’을 이용하면 이모티콘을 입력할 수 있어요!
                    </p>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">시간</span>
                    <!-- 온오프 버튼 -->
                    <span class="select-button">
                        <input type="checkbox"  id="time-select" class="check"/>
                        <label for="time-select">
                            <span class="onf_btn"></span>
                        </label>
                    </span>
                    <div class="showTime">
                        <input type="radio" checked id="timeRadio" name="time">시각 선택 <br>
                        <input type="radio" id="timesRadio" name="time"/>범위 시간 선택<br>
                        <input type="time" id="time" value="" placeholder="시간 선택"/>
                        <input type="time" id="times" value="" placeholder="시간 선택"/>
                    </div>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">장소</span>
                    <!-- 온오프 버튼 -->
                    <span class="select-button">
                        <input type="checkbox"  id="place-select" class="check"/>
                        <label for="place-select">
                            <span class="onf_btn"></span>
                        </label>
                    </span>
                    <div class="place">
                        <input type="submit" value="주소 찾기"/>
                        <input type="text" placeholder="상세 주소 입력" name="place">
                    </div>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">준비물</span>
                    <!-- 온오프 버튼 -->
                    <span class="select-button">
                        <input type="checkbox"  id="prepare-select" class="check"/>
                        <label for="prepare-select">
                            <span class="onf_btn"></span>
                        </label>
                    </span>
                    <textarea class="prepare" maxlength="255" placeholder="준비물을 입력하세요"></textarea>
                </div>
                <hr>
                <div class="comp">
                    <span class="head-text">계좌 번호</span>
                    <!-- 온오프 버튼 -->
                    <span class="select-button">
                        <input type="checkbox"  id="account-select" class="check"/>
                        <label for="account-select">
                            <span class="onf_btn"></span>
                        </label>
                    </span>
                    <div class="account">
                        <p style="margin-bottom:0;">은행</p>
                        <input type="text" id="bank" name="bank"/>
                        <p style="margin-bottom:0;">계좌 번호</p>
                        <input type="text" id="account-number" name="accountNumber"/>
                    </div>
                </div>
                <hr>
            </div>
            <div class="middle-div">
                <div class="preview-div">

                </div>
                <div class="button-div">
                    <input type="button" value="장바구니 담기"/>
                    <input type="button" value="결제하기"/>
                    <input type="button" value="공개/비공개"/>
                </div>
            </div>
            <div class="frame-div">

            </div>
        </div>
    </div>
    <div class="sticker2" style="margin-left: 50px"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<script type="text/javascript">
    $(function() {
        $('#days').daterangepicker({
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });
        $('#days').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
        });

        $('#days').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });

        $('#day').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'),10)
        });
        // 각각 library를 이용해 초기값 세팅

        // 처음 선택 => 시각과 날짜 하나기 때문에 여러 개 선택은 숨김
        $('#days').hide();
        $('#times').hide();
        $('.showTime').hide();
        $('.place').hide();
        $('.prepare').hide();
        $('.account').hide();

        // 어떤 버튼을 클릭하냐에 따라 hide and show - 날짜
        $('#dayRadio').click(function() {
            $('#days').hide();
            $('#day').show();
        })
        $('#daysRadio').click(function() {
            $('#day').hide();
            $('#days').show();
        })

        // 어떤 버튼을 클릭하냐에 따라 hide and show - 시간
        $('#timeRadio').click(function() {
            $('#times').hide();
            $('#time').show();
        })
        $('#timesRadio').click(function() {
            $('#times').show();
        })

        // 체크박스 제어
        $('#time-select').click(function() {
            $('.showTime').toggle();
        })
        $('#place-select').click(function() {
            $('.place').toggle();
        })
        $('#prepare-select').click(function() {
            $('.prepare').toggle();
        })
        $('#account-select').click(function() {
            $('.account').toggle();
        })
    });

</script>
</body>
</html>