package com.choikang.chukahaeyo.card;

import com.choikang.chukahaeyo.card.model.CardVO;
import com.choikang.chukahaeyo.card.model.GuestBookVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CardMapper {
    void insertUrl(CardVO cardVO);
    void deleteCard(int cardID);
    void insertCardInCart(CardVO cardVO);
  
    String getCardDesign(int cardID);
    List<CardVO> getPersonalCart(int memberID);
    List<CardVO> getPublicCardList();
    List<CardVO> getTop3CardList();
    List<CardVO> getLatest3CardList();
    void updateCardPaymentStatus(int cardID);
    CardVO getCompletedCardPage(int cardID);
    void updateCardLike(int cardID);
    void insertCardGuestBook(GuestBookVO guestBookVO);
    List<GuestBookVO> selectGuestBooks(int cardID);
}
