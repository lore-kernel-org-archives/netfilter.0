From: "..." <betolourenco@ig.com.br>
Subject: Re: FORWARD not working
Date: Mon, 17 Feb 2003 10:32:57 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c2d689$16020550$0a01a8c0@rlourenco>
References: <000801c2d555$61c7dda0$0a0110ac@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C2D66F.F0222A40"
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
To: Tim <twr@bellsouth.net>, iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_001A_01C2D66F.F0222A40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

did you tried to set:

echo "1" > /proc/sys/net/ipv4/ip_forward

...
  ----- Original Message -----=20
  From: Tim=20
  To: iptables-list=20
  Sent: Saturday, February 15, 2003 9:50 PM
  Subject: FORWARD not working


  ppl,
  =20
  I rebuilt my box and can't seem to FORWARD anything. The same rules =
that were working with the old box into the new box and its not working. =
Did I miss anything.
  =20
  Cannot traverse the chains...I ran the command lsmod to check to make =
sure the modules where loading correctly and did notice something that =
was not there in my old box. ppp_syntty, ppp_async, ppp_generic and slhc =
which states it is a generic ppp along with jbd which I never noticed =
before.
  =20
  I anyone can point me to any reason or documentation why this is so, I =
would gratefully appreciate it.
  =20
  Thanks
  Tim

------=_NextPart_000_001A_01C2D66F.F0222A40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3502.5390" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>did you tried to set:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>echo "1" &gt;=20
/proc/sys/net/ipv4/ip_forward</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A href=3D"mailto:twr@bellsouth.net" title=3Dtwr@bellsouth.net>Tim</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  href=3D"mailto:netfilter@lists.samba.org"=20
  title=3Dnetfilter@lists.samba.org>iptables-list</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Saturday, February 15, =
2003 9:50=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> FORWARD not =
working</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>ppl,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I rebuilt my box and can't seem to =
FORWARD=20
  anything. The same rules that were working with the old box into the =
new box=20
  and its not working. Did I miss anything.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Cannot traverse the chains...I ran =
the command=20
  lsmod to check to make sure the modules where loading correctly and =
did notice=20
  something that was not there in my old box. ppp_syntty, ppp_async, =
ppp_generic=20
  and slhc which states it is a generic ppp along with jbd which I never =
noticed=20
  before.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I anyone can point me to any reason =
or=20
  documentation&nbsp;why this is so, I would gratefully appreciate=20
  it.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
  <DIV><FONT face=3DArial =
size=3D2>Tim</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_001A_01C2D66F.F0222A40--


