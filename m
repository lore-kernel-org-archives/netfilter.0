From: "knom" <knom19@gmx.net>
Subject: iptables + smnp + mrtg
Date: Tue, 6 Jul 2004 22:10:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c46395$3c6f98c0$8c1ea8c0@Marketing01>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C463A5.FFF9EF60"
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

------=_NextPart_000_0001_01C463A5.FFF9EF60
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi !
I want to use iptables firewall to block all incoming traffic except on
several ports like www, smtp, pop.
It works all fine except for SNMP.

I want to use MRTG on localhost therefore I need the snmp port 161.

Therefore I did:

/sbin/iptables -I INPUT -p tcp --dport 161 -j ACCEPT
/sbin/iptables -I INPUT -p udp --dport 161 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 162 -j ACCEPT
/sbin/iptables -I INPUT -p udp --dport 162 -j ACCEPT
/sbin/iptables -P INPUT DROP

Now whenever I start mrtg from localhost and it wants to connect to my
external IP-adress I get an error "no response received"
When I make /sbin/iptables -P INPUT ACCEPT it works.

I connect from the same host where the firewall and the snmp is running
via the external IP.

Can you help me ??

Thank you,

Knom.

------=_NextPart_000_0001_01C463A5.FFF9EF60
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.4630.0">
<TITLE>iptables + smnp + mrtg</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Hi =
!</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">I =
want to use iptables firewall to block all incoming traffic except on =
several ports</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> =
like www, smtp, pop.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">It =
works all fine except for SNMP.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">I =
want to</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">use MRTG on localhost therefore I need the snmp port =
16</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">1</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">Therefore I did:</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> -I INPUT -p tcp --dport 161 -j =
ACCEPT</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> -I INPUT -p udp --dport 161 -j =
ACCEPT</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> -I INPUT -p tcp --dport 162 -j =
ACCEPT</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> -I INPUT -p udp --dport 162 -j =
ACCEPT</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">&#8211;</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">P INPUT DROP</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"en-gb"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Now =
whenever I start mrtg from localhost and it wants to connect to my =
external IP-adress I get an error</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"></FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">no =
response received</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">When =
I make</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">&#8211;</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">P INPUT</FONT></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">ACCEPT it works.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">I =
connect from</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> =
the same host where the firewall and the snmp is running via the =
external IP.</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Can =
you help me ??<BR>
<BR>
</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">Thank =
you,</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">Knom.</FONT></SPAN><SPAN LANG=3D"de"></SPAN><SPAN =
LANG=3D"de"></SPAN><SPAN LANG=3D"en-gb"></SPAN></P>

</BODY>
</HTML>
------=_NextPart_000_0001_01C463A5.FFF9EF60--


