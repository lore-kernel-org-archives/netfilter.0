From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Small problem -> Prerouting
Date: 16 Apr 2003 18:09:32 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050496812.1001.2.camel@india>
References: <4.3.2.7.2.20030416150214.02748848@10.0.0.99>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-N4I5JQPT/0fRE0WRSmOm"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4.3.2.7.2.20030416150214.02748848@10.0.0.99>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Matti Luoma <matti.luoma@bitboys.com>
Cc: netfilter@lists.netfilter.org


--=-N4I5JQPT/0fRE0WRSmOm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:

    Hiya!
    
    Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest 
    iptables 1.2.8
    
    now i got this weird problem with
    
    example this line:
    
    iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to IP:Port
    
    It should works, and it works, but not anymore, SSH forwarding like this 
    works thou
    
    also im gettin some stuff in syslog:
    
    kernel: NAT: 0 dropping untracked packet c66ab6c0
    
    i think these things are related, and probably some module is causing this, 
    any ideas?
    
    Cheers,
    Matti
    
    I guess this is because of conntrack module. Just check do you need this if not remove it. 

-- 
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain
privileged or Confidential information. If you have received this
message in error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.

--=-N4I5JQPT/0fRE0WRSmOm
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>Hiya!</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables 1.2.8</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>now i got this weird problem with</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>example this line:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to IP:Port</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>It should works, and it works, but not anymore, SSH forwarding like this </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>works thou</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>also im gettin some stuff in syslog:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>kernel: NAT: 0 dropping untracked packet c66ab6c0</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>i think these things are related, and probably some module is causing this, </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>any ideas?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Cheers,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Matti</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT SIZE="3">I guess this is because of conntrack module. Just check do you need this if not remove it. </FONT></PRE>
    </BLOCKQUOTE>
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

--=-N4I5JQPT/0fRE0WRSmOm--


