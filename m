From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: Re: does the ip_conntrack subjected to DOS attack???
Date: Tue, 5 Nov 2002 11:37:22 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c2847c$a7cf5870$0bc8c80a@dolphin>
References: <002401c28193$9fcbbba0$1801010a@demo>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0014_01C284BF.B4FAF200"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ben Tan <linuxnewbie74@hotmail.com>, a <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0014_01C284BF.B4FAF200
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just want to check with you on how much RAM do you have? What is the max =
table size (cat /proc/sys/net/ipv4/ip_conntrack_max)  and if possible =
what is the size of the connection table before it crashes?

I have the same problem too on kernel 2.4.18-xfs. What is yours? I =
believe the bug is called OOM (out-of-memory).


.//Jet
  ----- Original Message -----=20
  From: Ben Tan=20
  To: a=20
  Sent: Friday, November 01, 2002 6:44 PM
  Subject: does the ip_conntrack subjected to DOS attack???


  hi,
      it seems that once the ip_conntrack table is being filled up, the =
system will crash.=20

      Does it means that it is very vulnerable to DOS attack?

      I have performed a port scan using nmap on my box, and it is able =
to scan alot of ports being opened? How come this happened? I only allow =
established,related tcp packets and tcp port 22 New on INPUT to the box? =
The default policy is DROP.

      The result is=20
      port 22 open=20
      port 80 open

  Why it is so? Pls advise. Thanks in advanced.

  ben
      =20

      
------=_NextPart_000_0014_01C284BF.B4FAF200
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Just want to check with you on how much =
RAM do you=20
have? What is the max table size (cat =
/proc/sys/net/ipv4/ip_conntrack_max)&nbsp;=20
and if possible what is the size of the connection table before it=20
crashes?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have the same problem too on kernel =
2.4.18-xfs.=20
What is yours? I believe the bug is called OOM =
(out-of-memory).</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>.//Jet</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dlinuxnewbie74@hotmail.com =
href=3D"mailto:linuxnewbie74@hotmail.com">Ben=20
  Tan</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  href=3D"mailto:netfilter@lists.netfilter.org">a</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, November 01, 2002 =
6:44=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> does the ip_conntrack =
subjected=20
  to DOS attack???</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>hi,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; it seems that once =
the=20
  ip_conntrack table is being filled up, the system will crash. =
</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Does it means that =
it is very=20
  vulnerable to DOS attack?</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I have performed =
a&nbsp;port=20
  scan using nmap on my box, and it is able to scan alot of ports being =
opened?=20
  How come this happened? I only allow established,related tcp packets=20
  and&nbsp;tcp port 22 New on INPUT to the box? The default policy is=20
  DROP.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; The result is =
</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; port 22 open =
</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; port 80 =
open</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Why it is so? Pls advise. Thanks in=20
  advanced.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>ben</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
</FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;=20
</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0014_01C284BF.B4FAF200--


