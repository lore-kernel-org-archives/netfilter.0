From: "Barry L. Jeung" <bjeung@teamlynx.com>
Subject: RE: Redirecting/DNATing local traffic?
Date: Tue, 22 Apr 2003 13:33:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D7FB597C5A18824C9A257EC757CEAF4C344E1C@pepsi.teamlynx.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3090E.64310674"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------_=_NextPart_001_01C3090E.64310674
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

N/M, I think I found my answer here.
=20
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

	-----Original Message-----
	From: Barry L. Jeung=20
	Sent: Tuesday, April 22, 2003 1:23 PM
	To: netfilter@lists.netfilter.org
	Subject: Redirecting/DNATing local traffic?
=09
=09

	Hey guys,=20
	        Is this possible, and if so, what would be the syntax
for the following scenario?=20

	I have a client app that talks to a server behind a linux box
doing NAT. I have forwarding rules from the external IP/port to the
internal IP/port. This works fine. However, what happens is, once the
connection is established, the server trys to make a 2nd connection to a
local service on the same machine, but different port. But what is
happening is since the client is connecting to the external IP, the
server tries to connect to it's external IP instead of localhost or its
internal IP. So I need to bounce traffic coming from that box
(192.168.20.x) destined to the equivalent external IP, back to itself.
Thanks for your help.


------_=_NextPart_001_01C3090E.64310674
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Message</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D323573220-22042003><FONT face=3DArial color=3D#0000ff =
size=3D2>N/M, I=20
think I found my answer here.</FONT></SPAN></DIV>
<DIV><SPAN class=3D323573220-22042003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D323573220-22042003><FONT face=3DArial color=3D#0000ff =
size=3D2><A=20
href=3D"http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html">=
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html</A></FONT=
></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B> =
Barry L. Jeung=20
  <BR><B>Sent:</B> Tuesday, April 22, 2003 1:23 PM<BR><B>To:</B>=20
  netfilter@lists.netfilter.org<BR><B>Subject:</B> Redirecting/DNATing =
local=20
  traffic?<BR><BR></FONT></DIV><!-- Converted from text/rtf format -->
  <P><FONT face=3DArial size=3D2>Hey guys,</FONT>=20
  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT face=3DArial =
size=3D2>Is this=20
  possible, and if so, what would be the syntax for the following=20
  scenario?</FONT> </P>
  <P><FONT face=3DArial size=3D2>I have a client app that talks to a =
server behind a=20
  linux box doing NAT. I have forwarding rules from the external IP/port =
to the=20
  internal IP/port. This works fine. However, what happens is, once the=20
  connection is established, the server trys to make a 2nd connection to =
a local=20
  service on the same machine, but different port. But what is happening =
is=20
  since the client is connecting to the external IP, the server tries to =
connect=20
  to it's external IP instead of localhost or its internal IP. So I need =
to=20
  bounce traffic coming from that box (192.168.20.x) destined to the =
equivalent=20
  external IP, back to itself. Thanks for your=20
help.</FONT></P></BLOCKQUOTE></BODY></HTML>
=00
------_=_NextPart_001_01C3090E.64310674--

