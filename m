From: "Unzeitig Lumir" <lumir.unzeitig@gatc.com>
Subject: PPTP - more connections from a  NATed LAN to LAN behind PPTP Linux box doesn't work
Date: Wed, 21 Jan 2004 15:47:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0807917940AEF54F9A0C3096A0ED03AB40EDD0@gatc-ex1.gatc.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3E02D.7C15C51C"
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

------_=_NextPart_001_01C3E02D.7C15C51C
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hi,
I applied the PPTP patch and it solved what I needed. (=3Dmore =
connections
from NATed LAN behind Linux box to a PPTP server) - it's OK.
But oposit direction (=3Dmore connections from NATed LAN behind a PPTP
server to theLAN which is behind PPTP Linux box) works only for 1 PPTP
client. It stays in verification process and ends by error.

Is there way how to solve it?

Thanks
Lumir Unzeitig




------_=_NextPart_001_01C3E02D.7C15C51C
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6396.0">
<TITLE>PPTP - more connections from a  NATed LAN to LAN behind PPTP =
Linux box doesn&#8217;t work</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">I applied the PPTP patch and it solved =
what I needed. (=3Dmore connections from NATed LAN behind Linux box to a =
PPTP server) - it's OK.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">But oposit direction (=3Dmore =
connections from NATed LAN behind a PPTP server to theLAN which is =
behind PPTP Linux box) works only for 1 PPTP client. It stays in =
verification process and ends by error.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Is there way how to solve it?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Lumir Unzeitig</FONT>
</P>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C3E02D.7C15C51C--

