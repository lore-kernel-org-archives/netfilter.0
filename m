From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: Routing Issue Between 2 Network Cards
Date: Mon, 31 Mar 2003 12:13:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009401c2f776$8c3acaa0$6401a8c0@int.thorcom.com>
References: <015501c2f708$8d7c0730$637974c0@22gig>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0091_01C2F77E.EDF79180"
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
To: sarky <sarky@raycon.net>, netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0091_01C2F77E.EDF79180
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sarky,

I don't think this is going to work... both of your IP addresses on
the ethernet cards fall inside the *same* network block if you
use the subnet masks that you have.

This is a basic IP networking issues that you have to resolve
first.

Mike



  ----- Original Message -----=20
  From: sarky=20
  To: netfilter=20
  Sent: Sunday, March 30, 2003 11:05 PM
  Subject: Routing Issue Between 2 Network Cards


  Hi all=20

  I have a machine with 2 Network Cards=20
  Hub: 192.116.121.2 upto 127 is attached
  Ether1: 192.116.121.119 subnet:255.255.255.128
  Ether2: 192.116.121.120 subnet:255.255.255.128
  Gateway:192.116.121.1

  I want to route all incoming from the Hub through 119 out of 120 into =
the Gateway the reason for such  a thing is so i can filter all the =
incomings and outgoings through that point.

  Attached is a Diagram just to show what i have.

  Thank you

  Sarky
------=_NextPart_000_0091_01C2F77E.EDF79180
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Sarky,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I don't think this is going to work... =
both of your=20
IP </FONT><FONT face=3DArial size=3D2>addresses on</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the ethernet cards fall inside the =
*same*=20
</FONT><FONT face=3DArial size=3D2>network block if you</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>use the subnet masks that you =
have.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This is a basic IP networking issues =
that you have=20
to resolve</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>first.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mike</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dsarky@raycon.net href=3D"mailto:sarky@raycon.net">sarky</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  href=3D"mailto:netfilter@lists.netfilter.org">netfilter</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, March 30, 2003 =
11:05=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Routing Issue Between =
2 Network=20
  Cards</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi all </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I have a machine with 2 Network Cards =

  </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Hub: 192.116.121.2 upto 127 is=20
  attached</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Ether1: 192.116.121.119=20
  subnet:255.255.255.128</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Ether2: 192.116.121.120=20
  subnet:255.255.255.128</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Gateway:192.116.121.1</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I want to route all incoming from the =
Hub through=20
  119 out of 120 into the Gateway the reason for such&nbsp; a thing is =
so i can=20
  filter all the incomings and outgoings through that =
point.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Attached is a Diagram just to show =
what i=20
  have.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thank you</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial =
size=3D2>Sarky</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0091_01C2F77E.EDF79180--


