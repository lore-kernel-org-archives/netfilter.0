From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: bug? blocked packets get shadowed to internal network
Date: 04 Sep 2003 12:23:42 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062658448.2760.12.camel@india.nsecure.net>
References: <20030814113448.A21598@rcs.ei.tum.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-v6jLkTBe0SwMAsOPFeqo"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030814113448.A21598@rcs.ei.tum.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Juergen Stohr <stohr@lpr.e-technik.tu-muenchen.de>
Cc: netfilter@lists.netfilter.org


--=-v6jLkTBe0SwMAsOPFeqo
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

When I saw your logs it is sending a rst packet to destination. Are you
running any ids inside your network? 


Regards
Dharmendra.T
dharmu@nsecure.net


On Thu, 2003-08-14 at 15:04, Juergen Stohr wrote:

    Hi to all,
    
    we are using a firewall with RedHat kernel 2.4.20-19.7. The firewall is 
    configured to block every packet with DPT 199 into our network. When doing
    a "telnet server.in.our.network 199" from outside, the firewall correctly 
    drops that packet, logging
    
    IN=eth1 OUT=eth0 SRC=xxx.xxx.11.231 DST=xxx.xxx.151.184 LEN=44 TOS=0x00 PREC=0x00 TTL=252 ID=12615 DF PROTO=TCP SPT=34869 DPT=199 WINDOW=8760 RES=0x00 SYN URGP=0
    
    to syslog. The external interface is eth1, internal is eth0.
    However, at the same time, the firewall generates a packet, which is droped
    by the output chain of the firewall. It fakes the SRC and DST and wants to send
    that packet to the internal server:
    
    IN= OUT=eth0 SRC=xxx.xxx.151.184 DST=xxx.xxx.11.231 LEN=40 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=TCP SPT=199 DPT=34869 WINDOW=0 RES=0x00 ACK RST URGP=0
    
    When setting the output chain to accept policy, the above packet is delivered
    xxx.xxx.151.184!
    
    How can we prohibit those packets to be generated? Kernel RH 2.4.18-x didn't
    show that behaviour.
    
    Please CC me as I'm not subscribed.
    
    regards,
    	juergen
    
    

-- 

This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-v6jLkTBe0SwMAsOPFeqo
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
hi,
<BR>

<BR>
When I saw your logs it is sending a rst packet to destination. Are you running any ids inside your network? 
<BR>

<PRE>Regards
Dharmendra.T
dharmu@nsecure.net</PRE>

<BR>
On Thu, 2003-08-14 at 15:04, Juergen Stohr wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Hi to all,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>we are using a firewall with RedHat kernel 2.4.20-19.7. The firewall is </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>configured to block every packet with DPT 199 into our network. When doing</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>a &quot;telnet server.in.our.network 199&quot; from outside, the firewall correctly </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>drops that packet, logging</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>IN=eth1 OUT=eth0 SRC=xxx.xxx.11.231 DST=xxx.xxx.151.184 LEN=44 TOS=0x00 PREC=0x00 TTL=252 ID=12615 DF PROTO=TCP SPT=34869 DPT=199 WINDOW=8760 RES=0x00 SYN URGP=0</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>to syslog. The external interface is eth1, internal is eth0.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>However, at the same time, the firewall generates a packet, which is droped</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>by the output chain of the firewall. It fakes the SRC and DST and wants to send</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>that packet to the internal server:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>IN= OUT=eth0 SRC=xxx.xxx.151.184 DST=xxx.xxx.11.231 LEN=40 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=TCP SPT=199 DPT=34869 WINDOW=0 RES=0x00 ACK RST URGP=0</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>When setting the output chain to accept policy, the above packet is delivered</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>xxx.xxx.151.184!</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>How can we prohibit those packets to be generated? Kernel RH 2.4.18-x didn't</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>show that behaviour.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Please CC me as I'm not subscribed.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>regards,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>	juergen</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 

This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-v6jLkTBe0SwMAsOPFeqo--


