From: "Patrick Ahler" <pmahler@vikus.com>
Subject: routing
Date: Thu, 22 Jan 2004 11:17:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <810BC538117E9F4E9BB152E0C100DF1F0A4F3E@farmer.vikus.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3E103.2CEC9D5B"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

------_=_NextPart_001_01C3E103.2CEC9D5B
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a router setup to forward 192.168.1.x (private/internal)
addresses to A.B.C.x (public) addresses and public to private. The x
variable remains the same.

192.168.1.x <-- --> eth0 (router/iptables) eth1 <-- --> A.B.C.x =20

Using the following configuration I have had no luck getting anything to
forward. (yes I've enabled ip_forward and correctly compiled the
kernel). If I run a traceroute from a machine outside our network it
will find the router, but if I traceroute a machine behind the firewall
(A.B.C.x), the trace will hang just before it gets to my router and then
won't find my router.

Route:
Route add -net A.B.C.x netmask 255.255.255.255 dev eth1
(also add default gateway and loopback interface)

iptables:
iptables -t nat -A PREROUTING -d A.B.C.x -I eth0 -j DNAT -to 192.168.1.x
iptables -t nat -A POSTROUTING -s 192.168.1.x -I eth0 -j SNAT -to
A.B.C.x

Thanks,
Patrick A.

------_=_NextPart_001_01C3E103.2CEC9D5B
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.6944.0">
<TITLE>routing </TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">I =
have a router setup to forward 192.168.1.x (private/internal) addresses =
to A.B.C.x (public) addresses and public to private. The x variable =
remains the same.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">192.168.1.x</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> <FONT FACE=3D"Wingdings" =
SIZE=3D2>&#223;</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial"></FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> <FONT FACE=3D"Wingdings" =
SIZE=3D2>&#224;</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial"> eth0 (router/iptables) =
eth1</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> =
<FONT FACE=3D"Wingdings" SIZE=3D2>&#223;</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"> <FONT FACE=3D"Wingdings" =
SIZE=3D2>&#224;</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial"> A.B.C.x&nbsp; =
</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Using =
the following configuration I have had no luck getting anything to =
forward. (yes I&#8217;ve enabled ip_forward and correctly compiled the =
kernel). If I run a traceroute from a machine outside our network it =
will find the router, but if I traceroute a machine behind the firewall =
(A.B.C.x), the trace will hang just before it gets to my router and then =
won&#8217;t find my router.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Route:</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Route =
add &#8211;net A.B.C.x netmask 255.255.255.255 dev =
eth1</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">(also =
add default gateway and loopback interface)</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">iptables:</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">iptables &#8211;t nat &#8211;A PREROUTING &#8211;d =
A.B.C.x &#8211;I eth0 &#8211;j DNAT &#8211;to =
192.168.1.x</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">iptables &#8211;t nat &#8211;A POSTROUTING &#8211;s =
192.168.1.x &#8211;I eth0 &#8211;j SNAT &#8211;to =
A.B.C.x</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Thanks,</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Patrick A.</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"></SPAN></P>

</BODY>
</HTML>
------_=_NextPart_001_01C3E103.2CEC9D5B--

