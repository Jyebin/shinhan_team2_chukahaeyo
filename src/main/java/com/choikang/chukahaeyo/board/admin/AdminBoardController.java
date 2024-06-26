package com.choikang.chukahaeyo.board.admin;

import com.choikang.chukahaeyo.board.inquiry.BoardInquiryService;
import com.choikang.chukahaeyo.board.model.InquiryVO;
import com.choikang.chukahaeyo.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/admin/inquiry")
public class AdminBoardController {
    @Autowired
    BoardInquiryService boardInquiryService;

    @Autowired
    MemberService memberService;

    @GetMapping("/allInquiryList")
    public String inquiryList(Model model, InquiryVO vo, HttpSession session) {
        List<InquiryVO> inquiryList = memberService.getNotAnsweredInquiryList();
        session.setAttribute("inquiryList", inquiryList);
        model.addAttribute("map", boardInquiryService.getInquiryList(vo));
        return "admin/inquiry/allInquiryList";
    }

    @GetMapping("/write")
    public String inquiryWrite(InquiryVO vo, Model model,HttpSession session) {
        List<InquiryVO> inquiryList = memberService.getNotAnsweredInquiryList();
        session.setAttribute("inquiryList", inquiryList);

        model.addAttribute("object", boardInquiryService.getInquiryDetail(vo));
        return "admin/inquiry/inquiryPostReply";
    }

    @PostMapping("/write")
    public String inquiryWriteInsert(InquiryVO vo, HttpSession session) throws UnsupportedEncodingException {
        vo.setAdminID((int) session.getAttribute("adminID"));

        boardInquiryService.insertAnswer(vo);
        return "redirect:write?inquiryID=" + vo.getInquiryID();
    }
}