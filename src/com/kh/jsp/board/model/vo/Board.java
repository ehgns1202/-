package com.kh.jsp.board.model.vo;

import java.sql.Date;

public class Board {
	private int bid;
	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private int bcount;
	private Date bdate;
	private Date mdate;
	private String bstatus;
	
	public Board() {
		super();
	}

	public Board(int bid, int bno, String btitle, String bcontent, String bwriter, int bcount, Date bdate, Date mdate,
			String bstatus) {
		super();
		this.bid = bid;
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.bdate = bdate;
		this.mdate = mdate;
		this.bstatus = bstatus;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getBstatus() {
		return bstatus;
	}
	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter="
				+ bwriter + ", bcount=" + bcount + ", bdate=" + bdate + ", mdate=" + mdate + ", bstatus=" + bstatus
				+ "]";
	}
	
}
