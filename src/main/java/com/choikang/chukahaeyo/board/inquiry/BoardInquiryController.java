package com.choikang.chukahaeyo.board.inquiry;

import com.choikang.chukahaeyo.board.model.InquiryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
@RequestMapping("/board")
public class BoardInquiryController {
    @Autowired
    BoardInquiryService boardInquiryService;

    @GetMapping("/inquiry/list")
    public String inquiryList(HttpSession session, Model model, InquiryVO vo) {
        if (session.getAttribute("memberName") == null) {
            model.addAttribute("msg", "로그인 후 이용해 주세요.");
            model.addAttribute("url", "/");
            return "include/alert";
        } else {
            if (!vo.getQuery().equals(session.getAttribute("memberName"))) {
                model.addAttribute("msg", "다른 사용자의 1:1 문의는 검색할 수 없습니다.");
                model.addAttribute("url", "/");
                return "include/alert";
            }
        }
        model.addAttribute("map", boardInquiryService.getInquiryList(vo));
        return "mypage/inquiry/inquiryList";
    }

    @GetMapping("/inquiry/write")
    public String inquiryWrite() {
        return "mypage/inquiry/inquiryPost";
    }

    @PostMapping("/inquiry/write")
    public String inquiryWriteInsert(InquiryVO vo, HttpSession session) throws UnsupportedEncodingException {
        vo.setMemberID((int) session.getAttribute("memberID"));
        vo.setQuery(URLEncoder.encode((String) session.getAttribute("memberName"), "UTF-8"));
        boardInquiryService.insertInquiry(vo);
        return "redirect:detail?inquiryID=" + vo.getInquiryID() + "&query=" + vo.getQuery() + "&querytype=writer";
    }

    @GetMapping("/inquiry/detail")
    public String inquiryDetail(InquiryVO vo, HttpSession session, Model model) {
        if (session.getAttribute("memberID") == null) {
            vo.setMemberID(0);
        } else {
            vo.setMemberID((int) session.getAttribute("memberID"));
        }
        if (session.getAttribute("memberName") == null) {
            vo.setMemberName("");
        } else {
            vo.setMemberName(String.valueOf(session.getAttribute("memberName")));
        }
        model.addAttribute("object", boardInquiryService.getInquiryDetail(vo));
        return "mypage/inquiry/inquiryDetail";
    }
}