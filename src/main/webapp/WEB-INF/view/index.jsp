<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>축하해요</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="/resources/css/pageFrame/common.css"/>
    <link rel="stylesheet" href="/resources/css/pageFrame/main.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<main class="main">
    <div class="sticker1"></div>
    <div style="width: 100%;">
        <div class="container">
            <!-- 이미지 슬라이드 영역 -->
            <div class="slideshow-container">
                <c:forEach var="card" items="${top3Cards}">
                    <div class="slides fade">
                        <div class="main-card" data-template="${card.templateThumbnail}" data-date="${card.cardDate}" data-url="card/completedCard/${card.cardID}">
                            <div class="card-image" onclick="redirectToUrl(this)">
                                <img src="resources/img/main/main0${card.categoryID}.png" alt="" style="width:100%">
                                <div class="main-overlay">
                                    <div class="">${card.cardName}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <a class="prev-slide" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next-slide" onclick="plusSlides(1)">&#10095;</a>
            </div>

            <!-- 내생일, 반려동물 생일, 단체 행사 링크 -->
            <div class="navigator">
                <img src="resources/img/main/mainbear1.png" alt="" class="main-bear" onclick="redirectToUrl(this)" data-url="card/edit/myCard">
                <img src="resources/img/main/mainbear2.png" alt="" class="main-bear" onclick="redirectToUrl(this)" data-url="card/edit/myPet">
                <img src="resources/img/main/mainbear3.png" alt="" class="main-bear" onclick="redirectToUrl(this)" data-url="card/edit/invitation">
            </div>

            <div class="card-gallery">
                <div class="list-gallery">
                    <c:forEach var="card" items="${latest3Cards}">
                        <div class="card" data-url="card/completedCard/${card.cardID}" onclick="redirectToUrl(this)">
                            <div class="card-image">
                                <img src="${card.templateThumbnail}" alt="Card Image">
                                <div class="card-overlay">
                                    <div class="text">${card.cardName}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="show-gallery">
                    더 많은 카드가 궁금하다면? >
                    <a href="gallery"><input type="button" class="move-gallery" value="명예의 전당 이동"/></a>
                </div>
            </div>
        </div>
    </div>
    <div class="sticker2"></div>
</main>
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

<!-- 슬라이드 쇼 스크립트 -->
<script>
    var slideIndex = 0;
    showSlides();

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("slides");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 3000); // 6초마다 슬라이드 전환
    }

    function redirectToUrl(element) {
        var card = element.closest('.card');
        var url = card ? card.getAttribute('data-url') : element.getAttribute('data-url');
        if (url) {
            window.location.href = url;
        }
    }
</script>
</body>
</html>
