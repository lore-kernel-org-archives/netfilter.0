From: "Louie Miranda" <louie@axishift.ath.cx>
Subject: Re: Are IP ALIASES supported by iptables?
Date: Tue, 29 Jul 2003 13:18:06 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c401c35590$cd0c8ff0$020119ac@ADMWEBDEVWS>
References: <008301c3558f$22b075e0$080a0a0a@medannic>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00BF_01C355D3.D8F85680"
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
To: HTB <kerasakti@nusa.net.id>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_00BF_01C355D3.D8F85680
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi, it must be Is your Kernel compiled with IP Aliasing?
Yes, Iptables support ip aliasing.

--
Thank you,
Louie Miranda (louie@axishift.ath.cx)



  ----- Original Message -----=20
  From: HTB=20
  To: netfilter@lists.netfilter.org=20
  Sent: Tuesday, July 29, 2003 1:06 PM
  Subject: Are IP ALIASES supported by iptables?


  When i want to active nat using iptable on eth0:0 (aliasing) "error =
appear"
  # /sbin/iptables -A POSTROUTING -j MASQUERADE -t nat -s 192.168.0.0/24 =
-o eth0:0
  Warning: wierd character in interface `eth0:0' (No aliases, :, ! or =
*).

  Are IP ALIASES supported by iptables?



  regards

  HTB

------=_NextPart_000_00BF_01C355D3.D8F85680
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Hi, it must be Is your Kernel compiled with IP Aliasing?</DIV>
<DIV>Yes, Iptables support ip aliasing.</DIV>
<DIV><FONT size=3D1></FONT><FONT size=3D1></FONT><BR>--<BR>Thank =
you,<BR>Louie=20
Miranda (<A =
href=3D"mailto:louie@axishift.ath.cx">louie@axishift.ath.cx</A>)</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dkerasakti@nusa.net.id =
href=3D"mailto:kerasakti@nusa.net.id">HTB</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, July 29, 2003 =
1:06=20
PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Are IP ALIASES =
supported by=20
  iptables?</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>When i want to active nat using =
iptable on eth0:0=20
  (aliasing) "error appear"</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># /sbin/iptables -A POSTROUTING -j =
MASQUERADE -t=20
  nat -s 192.168.0.0/24 -o eth0:0<BR>Warning: wierd character in =
interface=20
  `eth0:0' (No aliases, :, ! or *).</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><FONT size=3D3>
  <P>Are IP ALIASES supported by iptables?</P>
  <P>&nbsp;</P>
  <P><FONT size=3D2>regards</FONT></P>
  <P><FONT =
size=3D2>HTB</FONT></P></FONT></FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_00BF_01C355D3.D8F85680--


