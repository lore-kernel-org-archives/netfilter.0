From: Hue Truong <HueT@CarParts.com>
Subject: problems with multiple pptp connections behind iptables to remote
	 vpn servers
Date: Wed, 5 Jun 2002 12:32:17 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <D2618020C017D41185CF009027DC835E0CFE48@mail.carparts.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C20CC7.B38EF170"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C20CC7.B38EF170
Content-Type: text/plain

Hello,

I am having problems with multiple Microsoft users using Microsoft pptp/vpn
clients connecting to external vpn servers. The clients are behind iptables
and only one client is able to make one connection, when two or more tries
to connect, it fails. Is there a known issue with iptables limitations? Here
is my firewall configuration...

...

/sbin/iptables -t nat -A POSTROUTING -o eth0  -s 192.168.0.0/24  -j SNAT
--to-source
$MY_REAL_IP

...

If there are any other helpful websites, please e-mail me. Thanks!

Hue Truong

------_=_NextPart_001_01C20CC7.B38EF170
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>problems with multiple pptp connections behind iptables to =
remote vpn servers</TITLE>
</HEAD>
<BODY>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">Hello,</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">I am having problems with =
multiple</FONT> <FONT SIZE=3D2 FACE=3D"Arial">Microsoft</FONT><FONT =
SIZE=3D2 FACE=3D"Arial"> users using</FONT> <FONT SIZE=3D2 =
FACE=3D"Arial">Microsoft</FONT><FONT SIZE=3D2 FACE=3D"Arial"> pptp/vpn =
clients connecting to external vpn servers.</FONT> <FONT SIZE=3D2 =
FACE=3D"Arial">The clients are behi</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">nd iptables and o</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">nly one client is able to make one connection, when two =
or more tries to connect, it fails.</FONT> <FONT SIZE=3D2 =
FACE=3D"Arial">Is there a known issue with iptables limitations? Here =
is my firewall configuration</FONT><FONT SIZE=3D2 =
FACE=3D"Arial">...</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">...</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 =
FACE=3D"Arial">/sbin/iptables</FONT><FONT SIZE=3D2 FACE=3D"Arial"> -t =
nat -A POSTROUTING -o</FONT> <FONT SIZE=3D2 =
FACE=3D"Arial">eth0</FONT><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; =
-s</FONT> <FONT SIZE=3D2 FACE=3D"Arial">192.168.0.0/24</FONT><FONT =
SIZE=3D2 FACE=3D"Arial">&nbsp; -j SNAT --to-source</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">$MY_REAL_IP</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">...</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">If there are any other =
helpful websites</FONT><FONT SIZE=3D2 FACE=3D"Arial">,</FONT> <FONT =
SIZE=3D2 FACE=3D"Arial">please e-mail me. Thanks!</FONT></P>

<P ALIGN=3DLEFT><FONT SIZE=3D2 FACE=3D"Arial">Hue Truong</FONT></P>

</BODY>
</HTML>
------_=_NextPart_001_01C20CC7.B38EF170--

