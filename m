From: "Jeroen Wortelboer" <jeroen@carotechnology.com>
Subject: Re: problems filtering ppp devices
Date: Mon, 9 Sep 2002 13:44:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007001c257f6$464789e0$0401a8c0@titanium>
References: <FD8F124A387AD6119F7900A0D218B321019834@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006D_01C25807.09B94F70"
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
To: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_006D_01C25807.09B94F70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

RE: problems filtering ppp devicesHi Rob,=20

thanks for your quick responce.
I checked the setting and it was switched on, so I should have support =
for it in my kernel.
I believe however that this setting was not intended for 'netfilter' =
filtering but for ppp activity filtering.

Any other idea's are very welcome.

Thanks again.
Jeroen

  ----- Original Message -----=20
  From: Rob Sterenborg=20
  To: 'netfilter@lists.netfilter.org'=20
  Sent: Monday, September 09, 2002 12:40 PM
  Subject: RE: problems filtering ppp devices


  > I am encountering some weird stuff while filtering a ppp device.=20
  > It seems like traffic from the ppp device does not enter the=20
  > INPUT or OUTPUT table.  Only when the destination of the traffic=20

  When configuring the kernel (compile your own) you have an option in =
the section "Network device support" : PPP Filtering =
(CONFIG_PPP_FILTER).

  The help for this item says that you need this for filtering PPP =
devices.=20
  Maybe you have to compile your kernel with CONFIG_PPP_FILTER=3Dy.=20



  Rob=20


------=_NextPart_000_006D_01C25807.09B94F70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>RE: problems filtering ppp devices</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi Rob, </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks for your quick =
responce.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I checked the setting and it was =
switched on, so I=20
should have support for it in my kernel.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I believe however that this setting was =
not=20
intended for 'netfilter' filtering but for ppp activity =
filtering.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any other idea's are very =
welcome.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks again.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jeroen</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">&nbsp;</DIV>
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dr.sterenborg@hsl-brabantzuid.nl=20
  href=3D"mailto:r.sterenborg@hsl-brabantzuid.nl">Rob Sterenborg</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:'netfilter@lists.netfilter.org'">'netfilter@lists.netfilte=
r.org'</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, September 09, =
2002 12:40=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: problems filtering =
ppp=20
  devices</DIV>
  <DIV><BR></DIV>
  <P><FONT size=3D2>&gt; I am encountering some weird stuff while =
filtering a ppp=20
  device.</FONT> <BR><FONT size=3D2>&gt; It seems like traffic from the =
ppp device=20
  does not enter the</FONT> <BR><FONT size=3D2>&gt; INPUT or OUTPUT =
table.&nbsp;=20
  Only when the destination of the traffic</FONT> </P>
  <P><FONT size=3D2>When configuring the kernel (compile your own) you =
have an=20
  option in the section "Network device support" : PPP Filtering=20
  (CONFIG_PPP_FILTER).</FONT></P>
  <P><FONT size=3D2>The help for this item says that you need this for =
filtering=20
  PPP devices.</FONT> <BR><FONT size=3D2>Maybe you have to compile your =
kernel=20
  with CONFIG_PPP_FILTER=3Dy.</FONT> </P><BR>
  <P><FONT size=3D2>Rob</FONT> </P></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_006D_01C25807.09B94F70--


