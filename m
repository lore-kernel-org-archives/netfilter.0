From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Can iptables manager source mac address?
Date: 16 Apr 2003 16:39:26 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050491396.2953.11.camel@india>
References: <1050747660.10928.6.camel@ntc9.local>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-c9uQsdNGpyvF/AeV5Gp8"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050747660.10928.6.camel@ntc9.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetSnake <netsnake@963.net>
Cc: netfilter@lists.netfilter.org


--=-c9uQsdNGpyvF/AeV5Gp8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2003-04-19 at 15:51, NetSnake wrote:

      I use iptables to nat to internet, but I found some user use a proxy
    on intranet, like, 192.168.0.5 can access to internet, 192.168.0.10 can
    not access to internet, now 10 access a proxy on 192.168.0.5, then he
    can access now, I thought in package from 192.168.0.5 must contant some
    information about proxy, like source mac address, this can help me to
    identified users, can iptables do this?
    
      Thanks.
    

You can block based on the mac address. But you should check whether
192.168.0.10 contains the same mac addres or it is getting modified in
proxy server.
-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-c9uQsdNGpyvF/AeV5Gp8
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Sat, 2003-04-19 at 15:51, NetSnake wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>  I use iptables to nat to internet, but I found some user use a proxy</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>on intranet, like, 192.168.0.5 can access to internet, 192.168.0.10 can</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>not access to internet, now 10 access a proxy on 192.168.0.5, then he</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>can access now, I thought in package from 192.168.0.5 must contant some</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>information about proxy, like source mac address, this can help me to</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>identified users, can iptables do this?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>  Thanks.</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">You can block based on the mac address. But you should check whether 192.168.0.10 contains the same mac addres or it is getting modified in proxy server.</FONT>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain privileged or Confidential information. If you have received this message in error,please notify the sender and destroy the message immediately.Unauthorised use or reproduction of this message is strictly prohibited.</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-c9uQsdNGpyvF/AeV5Gp8--


