From: "zze-Proxy GRALL O ext FTRD/SVA/LAN" <ograll.ext@rd.francetelecom.com>
Subject: Apply rules to 1 UDP port but port used as a socket: possible?
Date: Tue, 10 Feb 2004 14:16:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D4EF10CCEB2CE742BEEA9838C590B0E80113FA41@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3EFD8.196D97F2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

------_=_NextPart_001_01C3EFD8.196D97F2
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello to IPTables users,

I'm trying to use a socket (on port 1727) to decode some proprietary UDP
packets. When I've decoded them I want to apply a DNAT rule (and then a
SNAT  too) to this port using a filter on @IP:port source for all
following packets...

I use libiptc to manage iptables from my application.

My problem is that I can't apply rule to the packets. They all arrive on
the socket. I think it may be due to connection tracking but I would
like your points of view to be sure.

Is there any solution to do it ? For the moment I use v1.2.5a but I'm
installing v1.2.9.

Thanx in advance,

Olivier GRALL. =20

------_=_NextPart_001_01C3EFD8.196D97F2
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6487.1">
<TITLE>Apply rules to 1 UDP port but port used as a socket: =
possible?</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hello to IPTables users,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I'm trying to use a socket (on port =
1727) to decode some proprietary UDP packets. When I've decoded them I =
want to apply a DNAT rule (and then a SNAT&nbsp; too) to this port using =
a filter on @IP:port source for all following packets&#8230;</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I use libiptc to manage iptables from =
my application.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">My problem is that I can't apply rule =
to the packets. They all arrive on the socket. I think it may be due to =
connection tracking but I would like your points of view to be =
sure.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Is there any solution to do it ? For =
the moment I use v1.2.5a but I'm installing v1.2.9.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanx in advance,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Olivier GRALL.&nbsp; </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C3EFD8.196D97F2--

