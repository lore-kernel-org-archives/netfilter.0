From: "Bryan Dyson" <lan_administrator@solanapres.org>
Subject: Help with iptables
Date: Wed, 10 Dec 2003 15:45:52 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FB11F223A1DE69499D299308731DD413014A2A@mail.SBPC>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3BF77.BF04C962"
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

------_=_NextPart_001_01C3BF77.BF04C962
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi folks,

I've got my iptables setup and working with one small glitch. My ISP
says I'm an open proxy.
What I'm trying to do is set a rule in iptables that will drop port 3128
requests coming from the outside but still allow my internal network to
use the proxy on this port.
I've tried the following, but they seem to shut down routing of e-mail
from the internal mail server:

-A PREROUTING -I eth1 -p tcp -m tcp --dport 3128 -j DROP
And
-A PREROUTING -I x.x.x.x (public IP) -p tcp -m -tcp --dport 3128 -j DROP


If anyone could help I'd appreciate it.

Bryan Dyson
LAN/db Administrator
Solana Beach Presbyterian Church
858-509-2580
Shelby 5.4.1472



------_=_NextPart_001_01C3BF77.BF04C962
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>Help with iptables</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi folks,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I've got my iptables setup and working =
with one small glitch. My ISP says I'm an open proxy.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">What I'm trying to do is set a rule in =
iptables that will drop port 3128 requests coming from the outside but =
still allow my internal network to use the proxy on this =
port.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I've tried the following, but they seem =
to shut down routing of e-mail from the internal mail server:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">-A PREROUTING -I eth1 -p tcp -m tcp =
--dport 3128 -j DROP</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">And</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">-A PREROUTING -I x.x.x.x (public IP) =
-p tcp -m -tcp --dport 3128 -j DROP</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">If anyone could help I'd appreciate =
it.</FONT>
</P>

<P><FONT FACE=3D"Arial">Bryan Dyson</FONT>

<BR><FONT FACE=3D"Arial">LAN/db Administrator</FONT>

<BR><FONT FACE=3D"Arial">Solana Beach Presbyterian Church</FONT>

<BR><FONT FACE=3D"Arial">858-509-2580</FONT>

<BR><FONT FACE=3D"Arial">Shelby 5.4.1472</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C3BF77.BF04C962--

