From: "Christo Bezuidenhout" <christo@it4africa.co.za>
Subject: Firewall Setup on RH 9
Date: Tue, 1 Jul 2003 10:04:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016201c33fa7$5c755eb0$660210ac@christo>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0163_01C33FB8.1FFE2EB0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0163_01C33FB8.1FFE2EB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I need to do the following.
 
1. I have a Redhat 9 Box with Two nics. NIC1 is my Private Network. NIC2
is connected to my PPP0 interface for internet access. I need to add
NIC3 which will be second Private Network.
 
2. Both NIC1 and NIC3 Should be able to Connect VIA NIC2 to Internet. 
NIC1 Should be able to connect to NIC3 but NIC3 must not be ABLE to
Connect to NIC1 's network
 
I have my network already setup as in 1 above and it working very well.
I'm using iptables to get this running. 
 
Please mail me offline if more info needed or with a suggestion
 
Christo

------=_NextPart_000_0163_01C33FB8.1FFE2EB0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =
size=3D2>I need=20
to do the following.</FONT></SPAN></DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =
size=3D2>1. I=20
have a Redhat 9 Box with Two nics. NIC1 is my Private Network. NIC2 is =
connected=20
to my PPP0 interface for internet access. I need to add NIC3 which will =
be=20
second Private Network.</FONT></SPAN></DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =
size=3D2>2.=20
Both NIC1 and NIC3 Should be able to Connect VIA NIC2 to Internet.=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =
size=3D2>NIC1=20
Should be able to connect to NIC3 but NIC3 must not be ABLE to Connect =
to NIC1=20
's network</FONT></SPAN></DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =
size=3D2>I have=20
my network already setup as in 1 above and it working very well. I'm =
using=20
iptables to get this running. </FONT></SPAN></DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =
size=3D2>Please=20
mail me offline if more info needed or with a =
suggestion</FONT></SPAN></DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D308123315-23062003><FONT face=3DArial color=3D#0000ff =

size=3D2>Christo</FONT></SPAN></DIV></DIV></BODY></HTML>

------=_NextPart_000_0163_01C33FB8.1FFE2EB0--


