From: "Diego Sarasua" <debian@sarasuasys.com.ar>
Subject: Re: MS NetMeeting
Date: Thu, 23 Jan 2003 13:03:06 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009501c2c2f8$eda13c00$6400a8c0@diego>
References: <002901c2c275$dd61c6d0$027ba8c0@intellistation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008D_01C2C2DF.C5A2C6B0"
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
To: Rodrigo Galindo <ros@servidor.unam.mx>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_008D_01C2C2DF.C5A2C6B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

U need to recompile your kernel to have h323 support
look around for h323 newnat patch or patch-o-matic  .-

forgive my english.-
Diego :)

  ----- Original Message -----=20
  From: Rodrigo Galindo=20
  To: netfilter@lists.netfilter.org=20
  Sent: Wednesday, January 22, 2003 9:24 PM
  Subject: MS NetMeeting


  Hello to all!
  I have a Linux box working as a local home router for 2 winXP machines =
behind it.  The Linux box has at eth0 the ADSL link and a hub attached =
to eth1. =20

                      internet
                          |
                      eth0
                    GATEWAY (Linux)
                        eth1
                         |
                   COMPUTERS (WindowsXP)


  What kind of instruction do I need to set-up to the iptables to get MS =
NetMeeting to work in the winXP boxes?

  Thank you!

  ros.


------=_NextPart_000_008D_01C2C2DF.C5A2C6B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2722.900" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>U need to recompile your kernel to have =
h323=20
support</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>look around for h323 newnat patch or =
patch-o-matic=20
&nbsp;.-</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>forgive my english.-</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Diego :)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dros@servidor.unam.mx =
href=3D"mailto:ros@servidor.unam.mx">Rodrigo=20
  Galindo</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, January 22, =
2003 9:24=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> MS NetMeeting</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hello to all!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>I have a Linux box working as a local =
home router=20
  for 2 winXP machines behind it.&nbsp; The Linux box has at eth0 the =
ADSL link=20
  and a hub attached to eth1.&nbsp; </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT=20
  =
size=3D+0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
internet<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
  =
|<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
eth0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  GATEWAY=20
  =
(Linux)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
eth1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
|<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  COMPUTERS (WindowsXP)</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>What kind of instruction do I need to =
set-up to=20
  the iptables to get MS NetMeeting to work in the winXP =
boxes?</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thank you!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>ros.</FONT></DIV>
  <DIV>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_008D_01C2C2DF.C5A2C6B0--


