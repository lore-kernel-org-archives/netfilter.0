From: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Subject: Re: How can I configure my firewall to access voice chat with MSN messenger 6.2?
Date: Wed, 4 Aug 2004 12:30:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019c01c47a37$fd1d1cb0$0200a8c0@ale>
References: <006c01c47a35$02e03540$0201a8c0@MagicwindLaptop>
Reply-To: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0199_01C47A1E.D716F4F0"
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
To: MagicWind <magicwind@citiz.net>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0199_01C47A1E.D716F4F0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

I think you have to install the H.323 module in order to establish voice =
over IP communications.

See here: http://roeder.goe.net/~koepi/newnat.html

And then you must to set your firewalls rules according to RTP ports.

Greetings

Alejandro
  ----- Original Message -----=20
  From: MagicWind=20
  To: netfilter@lists.netfilter.org=20
  Sent: Wednesday, August 04, 2004 12:09 PM
  Subject: How can I configure my firewall to access voice chat with MSN =
messenger 6.2?


  I have a linux server which is configured as a router connecting my =
internal network and the internet.  using the following iptables rules:

  iptables -A FORWARD -i eth0 -o eth1 -m state --state =
ESTABLISHED,RELATED -j ACCEPT
  iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
  iptables -A FORWARD -j LOG
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

  where eth0 is the netword adapter linking to the internet and the eth1 =
is the adapter linking to the internal network.
  It seems the network works quite well, except for the voice connection =
of MSN messenger 6.2.  I can't either initial a voice chat or accept a =
voice chat.

  I've got absolutely no idea how to make it work.  Any ideas?

------=_NextPart_000_0199_01C47A1E.D716F4F0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312">
<META content=3D"MSHTML 6.00.2800.1458" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I think you have to install the H.323 =
module in=20
order to establish voice over IP communications.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>See here: <A=20
href=3D"http://roeder.goe.net/~koepi/newnat.html">http://roeder.goe.net/~=
koepi/newnat.html</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>And then you must to set your firewalls =
rules=20
according to RTP ports.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Greetings</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Alejandro</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dmagicwind@citiz.net =
href=3D"mailto:magicwind@citiz.net">MagicWind</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, August 04, =
2004 12:09=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> How can I configure my =
firewall=20
  to access voice chat with MSN messenger 6.2?</DIV>
  <DIV><BR></DIV>
  <DIV><FONT size=3D2>I have a linux server which is configured as a =
router=20
  connecting my internal network and the internet.&nbsp; using the =
following=20
  iptables rules:</FONT></DIV>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2>iptables&nbsp;-A FORWARD -i&nbsp;eth0 -o&nbsp;eth1 =
-m state=20
  --state ESTABLISHED,RELATED -j ACCEPT<BR>iptables&nbsp;-A FORWARD =
-i&nbsp;eth1=20
  -o&nbsp;eth0 -j ACCEPT<BR>iptables&nbsp;-A FORWARD -j =
LOG<BR></FONT><FONT=20
  size=3D2>iptables&nbsp;-t nat -A POSTROUTING -o&nbsp;eth0 -j=20
  MASQUERADE</FONT></DIV>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2>where eth0 is the netword adapter linking to the =
internet=20
  and the eth1 is the adapter linking to the internal =
network.</FONT></DIV>
  <DIV><FONT size=3D2>It seems the network works quite well, except for =
the voice=20
  connection of MSN messenger 6.2.&nbsp; I can't either initial a voice =
chat or=20
  accept a voice chat.</FONT></DIV>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2>I've got absolutely no idea how to make it =
work.&nbsp; Any=20
  ideas?</DIV></FONT>
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0199_01C47A1E.D716F4F0--


