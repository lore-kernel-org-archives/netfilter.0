From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Dropping RST of SYN
Date: 08 Sep 2003 11:21:28 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063000297.827.26.camel@india.nsecure.net>
References: <20030904183027.9CC5.ATNAK@chejz.com> 
	<1062666800.1615.23.camel@kermit>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MDiUSsqXAUJTmdeCA4b5"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062666800.1615.23.camel@kermit>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Atsushi Nakagawa <atnak@chejz.com>, Netfilter <netfilter@lists.netfilter.org>


--=-MDiUSsqXAUJTmdeCA4b5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-04 at 14:43, Ralf Spenneberg wrote:

    Am Don, 2003-09-04 um 10.50 schrieb Atsushi Nakagawa:
    > What iptables table/rule can I use to drop RST (TCP) packets that're =
in
    > reply to SYN?
    > This is what I want it to do:
    >=20
    > -SYN->    [NEW]        -SYN->
    >           [CLOSED]     <-RST-
    >             ^
    >           IF TCP & [NEW]: DROP '<-RST-' & SET [CLOSED]
    Using the current state implementation, AFAIK this is not possible.
    The RST is already an established packet. There is no way to
    differentiate between this RST and a later valid and needed RST packet.
    You can only drop all RST packets
    -m state --state ESTABLISHED -p tcp --tcp-flags RST,ACK RST,ACK -j DROP
   =20
    Cheers,
   =20
    Ralf
    --=20
    Ralf Spenneberg
    RHCE, RHCX
   =20
    Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.co=
m
    IPsec-Howto				     http://www.ipsec-howto.org
    Honeynet Project Mirror:                     http://honeynet.spenneberg=
.org
   =20

Hi,

Blocking the RST packets on the firewall is not recommended. If the
attacker comes to know that the server is dropping RST packets then he
can flood the servers by initiating lacks of connections, which inturn
result closewait state.

--=20
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin

--=-MDiUSsqXAUJTmdeCA4b5
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Thu, 2003-09-04 at 14:43, Ralf Spenneberg wrote:
    <BLOCKQUOTE>
<PRE><FONT COLOR="#73273a"><FONT SIZE="3"><I>Am Don, 2003-09-04 um 10.50 schrieb Atsushi Nakagawa:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; What iptables table/rule can I use to drop RST (TCP) packets that're in</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; reply to SYN?</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; This is what I want it to do:</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt; -SYN-&gt;    [NEW]        -SYN-&gt;</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;           [CLOSED]     &lt;-RST-</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;             ^</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>&gt;           IF TCP &amp; [NEW]: DROP '&lt;-RST-' &amp; SET [CLOSED]</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Using the current state implementation, AFAIK this is not possible.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>The RST is already an established packet. There is no way to</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>differentiate between this RST and a later valid and needed RST packet.</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>You can only drop all RST packets</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>-m state --state ESTABLISHED -p tcp --tcp-flags RST,ACK RST,ACK -j DROP</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Cheers,</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Ralf</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>-- </FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Ralf Spenneberg</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>RHCE, RHCX</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Book: Intrusion Detection f&#252;r Linux Server   http://www.spenneberg.com</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>IPsec-Howto				     http://www.ipsec-howto.org</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I>Honeynet Project Mirror:                     http://honeynet.spenneberg.org</FONT></FONT></I>
<FONT COLOR="#73273a"><FONT SIZE="3"><I></FONT></FONT></I></PRE>
    </BLOCKQUOTE>
<FONT SIZE="3">Hi,</FONT>
<BR>
<FONT SIZE="3"></FONT>
<BR>
<FONT SIZE="3">Blocking the RST packets on the firewall is not recommended. If the attacker comes to know that the server is dropping RST packets then he can flood the servers by initiating lacks of connections, which inturn result closewait state.</FONT>
<BR>
<FONT SIZE="3"></FONT>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>-- 
Regards
Dharmendra.T
dharmu@nsecure.net
Linux Security and Admin</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-MDiUSsqXAUJTmdeCA4b5--


