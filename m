From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Liaise with port forwarding proxies?
Date: 08 Sep 2003 11:38:41 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063001331.831.35.camel@india.nsecure.net>
References: <20030905194710.A375.ATNAK@chejz.com>
	<1062762797.1164.8.camel@india.nsecure.net> 
	<20030906003513.A37B.ATNAK@chejz.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-djDYm1m3IGB1LPZ3z4gt"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030906003513.A37B.ATNAK@chejz.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Atsushi Nakagawa <atnak@chejz.com>
Cc: netfilter@lists.netfilter.org


--=-djDYm1m3IGB1LPZ3z4gt
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2003-09-05 at 20:35, Atsushi Nakagawa wrote:

    "Dharmendra.T" <dharmu@nsecure.net> wrote:
    > Can you say more clearly what you are trying?
    
    I have a linux server with services and an iptables configuration set to
    discard any NEW incoming packets that aren't for these services.  I do
    this based on protocol and port.  (e.g. Accept: TCP/80, TCP/21)
    
    I want to add a SOCKS5 server (Dante) to the list of services.  The
    problem with this is that this server can listen to any arbitary port
    above 1024 for port tunneling, but I don't want to automatically allow
    all ports > 1024 in iptables.
    
    I'm wondering if there is a way for iptables to determine which ports
    are in use by the SOCKS5 server and selectively allow those.


You can allow related packets.

    
    Regards,
    
    
    -- 
    Atsushi Nakagawa
    <atnak@chejz.com>
    Changes are made when there is inconvenience.
    
    

-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-djDYm1m3IGB1LPZ3z4gt
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Fri, 2003-09-05 at 20:35, Atsushi Nakagawa wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>&quot;Dharmendra.T&quot; &lt;dharmu@nsecure.net&gt; wrote:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; Can you say more clearly what you are trying?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I have a linux server with services and an iptables configuration set to</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>discard any NEW incoming packets that aren't for these services.  I do</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>this based on protocol and port.  (e.g. Accept: TCP/80, TCP/21)</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I want to add a SOCKS5 server (Dante) to the list of services.  The</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>problem with this is that this server can listen to any arbitary port</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>above 1024 for port tunneling, but I don't want to automatically allow</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>all ports &gt; 1024 in iptables.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>I'm wondering if there is a way for iptables to determine which ports</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>are in use by the SOCKS5 server and selectively allow those.</FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">You can allow related packets.</FONT>
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Regards,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>-- </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Atsushi Nakagawa</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&lt;atnak@chejz.com&gt;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Changes are made when there is inconvenience.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net

This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-djDYm1m3IGB1LPZ3z4gt--


