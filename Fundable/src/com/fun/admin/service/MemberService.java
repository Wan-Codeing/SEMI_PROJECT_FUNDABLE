package com.fun.admin.service;

import com.fun.common.model.vo.PageInfo;
import com.fun.member.model.dao.MemberDao;
import com.fun.member.model.vo.Member;
import com.fun.member.model.vo.Pay;

import java.sql.Connection;
import java.util.ArrayList;

import static com.fun.common.JDBCTemplate.*;

public class MemberService {

    public int selectListCount() {

        Connection conn = getConnection();

        int listCount = new MemberDao().selectListCount(conn);

        close(conn);

        return listCount;

    }

    public ArrayList<Member> selectList(PageInfo pi) {
        Connection conn = getConnection();

        ArrayList<Member> list = new MemberDao().selectList(conn, pi);

        close(conn);

        return list;

    }

    public int searchListCount(int category, String keyword, String seller, String banned) {

        Connection conn = getConnection();

        int listCount = new MemberDao().searchListCount(conn, category, keyword, seller, banned);

        close(conn);

        return listCount;

    }

    public ArrayList<Member> searchList(PageInfo pi, int category, String keyword, String seller, String banned) {

        Connection conn = getConnection();

        ArrayList<Member> list = new MemberDao().searchList(conn, pi, category, keyword, seller, banned);

        close(conn);

        return list;

    }

    public int deleteMember(int userNo) {

        Connection conn = getConnection();

        int result = new MemberDao().deleteMember(conn, userNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
    }

    public int banMember(int userNo) {

        Connection conn = getConnection();

        int result = new MemberDao().banMember(conn, userNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
    }

    public int releaseMember(int userNo) {

        Connection conn = getConnection();

        int result = new MemberDao().releaseMember(conn, userNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
    }

    public int selectPayListCount() {

        Connection conn = getConnection();

        int listCount = new MemberDao().selectPayListCount(conn);

        close(conn);

        return listCount;

    }

    public ArrayList<Pay> selectPayList(PageInfo pi) {
        Connection conn = getConnection();

        ArrayList<Pay> list = new MemberDao().selectPayList(conn, pi);

        close(conn);

        return list;

    }

    public int searchPayListCount(int category, String keyword, String delivery) {

        Connection conn = getConnection();

        int listCount = new MemberDao().searchPayListCount(conn, category, keyword, delivery);

        close(conn);

        return listCount;

    }

    public ArrayList<Pay> searchPayList(PageInfo pi, int category, String keyword, String delivery) {

        Connection conn = getConnection();

        ArrayList<Pay> list = new MemberDao().searchPayList(conn, pi, category, keyword, delivery);

        close(conn);

        return list;

    }

    public int selectRefundListCount(String rStatus) {

        Connection conn = getConnection();

        int listCount = new MemberDao().selectRefundListCount(conn, rStatus);

        close(conn);

        return listCount;

    }

    public ArrayList<Pay> selectRefundList(PageInfo pi, String rStatus) {
        Connection conn = getConnection();

        ArrayList<Pay> list = new MemberDao().selectRefundList(conn, pi, rStatus);

        close(conn);

        return list;

    }

    public Pay selectPay(int orderNo) {
        Connection conn = getConnection();

        Pay pay = new MemberDao().selectPay(conn, orderNo);

        close(conn);

        return pay;
    }

    public Member selectMember(int userNo) {
        Connection conn = getConnection();

        Member mem = new MemberDao().selectMember(conn, userNo);

        close(conn);

        return mem;
    }

    public int deletePay(int orderNo) {
        Connection conn = getConnection();

        int result = new MemberDao().deletePay(conn, orderNo);

        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);

        return result;
    }

    public Member selectMemberById(String userId) {
        Connection conn = getConnection();

        Member mem = new MemberDao().selectMemberById(conn, userId);

        close(conn);

        return mem;
    }



}



