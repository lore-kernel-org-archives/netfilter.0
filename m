From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Re: ICMP Connections ...
Date: Tue, 24 Aug 2004 17:56:42 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <021301c48a25$3f985f30$031ea8c0@floydian>
References: <20040824133610.80037.qmail@web14926.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0210_01C48A03.B67A2650"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Chetan Nagaraja <chetanmn_in@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0210_01C48A03.B67A2650
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Chetan,

You do not need to have a DNAT rule for the packets to reach the host in =
Network A. SNAT & DNAT are 2 different NATing policies used for =
different purposes and at different chains.

Let's see if I can explain what is happening:

- An ICMP packet from host A destined to host B reaches the Linux box. =
Linux box does the SNATing (that is, the source IP is changed to that of =
the Linux box's outgoing interface IP) and an entry is made of the same =
in the ip_conntrack file.

NOTE: When the first packet in a new connection matches a NAT rule, the =
entire stream is automatically NATted henceforth. That is, every packet =
belonging to this connection does not need to go through the same rule =
but the action will be taken on all. Check this out -
http://iptables-tutorial.frozentux.net/chunkyhtml/tables.html

- The ICMP packet reaches the host b which in turn replies back to the =
Linux box.

- Using connection tracking & NATing, the Linux box then changes the =
destination IP to that of host A and sends out the ICMP reply to host A.

I do not understand why you would just want to ping the hosts in network =
B and not get the replies back to the host in network A. Nevertheless, =
you can add a rule in your MANGLE POSTROUTING chain to drop the icmp =
packets from reaching network A.

I hope this helps.
Best Regards,

Deepak
  ----- Original Message -----=20
  From: Chetan Nagaraja=20
  To: netfilter@lists.netfilter.org=20
  Sent: Tuesday, August 24, 2004 9:36 AM
  Subject: ICMP Connections ...


  Dear All,
  First of all, let me introduce as a total newbie in filtering and =
iptables.

  To ping a host in a different network, I have configured a dual homed[ =
two network interfaces] linux system to act as NAT router.
  I have add a rule in the NAT table of iptables, to achieve the =
following.
  If the Linux system recieves a icmp packet from a particular host in =
NETWORK A addressed to a particular HOST in NETWORK B , perform SNAT of =
the ICMP packet to that of the Linux System, so that the icmp replies =
reaches the Linux system.

  The above is working very fine. The ICMP requests are reaching the =
expected destination.=20
  But I'am unable to understand the fact that the ICMP replies are =
reaching the host in NETWORK A which had generated the requests, without =
adding a DNAT rule for the same.
  How is this possible, does iptables automatically redirect ICMP =
replies ?
  And How to avoid the same.

  Thanking you,
  Chetan M N


-------------------------------------------------------------------------=
-----
  Do you Yahoo!?
  Yahoo! Mail is new and improved - Check it out!
------=_NextPart_000_0210_01C48A03.B67A2650
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2180" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Hi Chetan,</DIV>
<DIV>&nbsp;</DIV>
<DIV>You do not need to have a DNAT rule for the packets to reach the =
host in=20
Network A. SNAT &amp; DNAT are 2 different NATing policies used for =
different=20
purposes and at different chains.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Let's see if I can explain what is happening:</DIV>
<DIV>&nbsp;</DIV>
<DIV>- An ICMP packet from host A destined to host B reaches the Linux =
box.=20
Linux box does the SNATing&nbsp;(that is, the source IP is changed to =
that of=20
the Linux box's outgoing interface IP) and an entry is made of the same =
in the=20
ip_conntrack file.</DIV>
<DIV>&nbsp;</DIV>
<DIV>NOTE: When the first packet in a new connection matches a NAT rule, =
the=20
entire stream is automatically NATted henceforth. That is, every packet=20
belonging to this connection does not need to go through the same rule =
but the=20
action will be taken on all.&nbsp;Check this out&nbsp;-</DIV>
<DIV><A=20
href=3D"http://iptables-tutorial.frozentux.net/chunkyhtml/tables.html">ht=
tp://iptables-tutorial.frozentux.net/chunkyhtml/tables.html</A></DIV>
<DIV>&nbsp;</DIV>
<DIV>- The ICMP packet reaches the host b which in turn replies back to =
the=20
Linux box.</DIV>
<DIV>&nbsp;</DIV>
<DIV>- Using connection tracking &amp; NATing, the Linux box then =
changes the=20
destination IP to that of host A and sends out the ICMP reply to host =
A.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I do not understand why you would just want to ping the hosts in =
network B=20
and not get the replies back to the host in network A. Nevertheless, you =
can add=20
a rule in your MANGLE POSTROUTING chain to drop the icmp packets from =
reaching=20
network A.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I hope this helps.</DIV>
<DIV>Best Regards,</DIV>
<DIV>&nbsp;</DIV>
<DIV>Deepak</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dchetanmn_in@yahoo.com =
href=3D"mailto:chetanmn_in@yahoo.com">Chetan=20
  Nagaraja</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, August 24, 2004 =
9:36=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> ICMP Connections =
...</DIV>
  <DIV><BR></DIV>
  <DIV>Dear All,</DIV>
  <DIV>First of all, let me introduce as a total newbie in filtering and =

  iptables.</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>To ping a host in a different network, I have configured a dual =
homed[=20
  two network interfaces]&nbsp;linux system to act as NAT router.</DIV>
  <DIV>
  <DIV>I have add a rule in the NAT table of iptables, to achieve the=20
  following.</DIV>
  <DIV>If the Linux system recieves a icmp packet from a particular host =
in=20
  NETWORK A addressed to a particular HOST in&nbsp;NETWORK B , perform =
SNAT of=20
  the ICMP packet to that of the Linux System, so that the icmp replies =
reaches=20
  the Linux system.</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>The above is working very fine. The ICMP requests are reaching =
the=20
  expected destination. </DIV>
  <DIV>But I'am unable to understand the fact that the ICMP replies are =
reaching=20
  the host in NETWORK A which had generated the requests, without adding =
a DNAT=20
  rule for the same.</DIV>
  <DIV>How is this possible, does iptables automatically redirect ICMP =
replies=20
  ?</DIV>
  <DIV>And How to avoid the same.</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>Thanking you,</DIV>
  <DIV>Chetan M N</DIV></DIV>
  <P>
  <HR SIZE=3D1>
  Do you Yahoo!?<BR>Yahoo! Mail is new and improved - <A=20
  =
href=3D"http://us.rd.yahoo.com/mail_us/taglines/new/*http://promotions.ya=
hoo.com/new_mail">Check=20
  it out!</A></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0210_01C48A03.B67A2650--


