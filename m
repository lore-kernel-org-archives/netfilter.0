From: "zze-KHOURY Jad FTRD/DMI/CAE" <jad.khoury@rd.francetelecom.com>
Subject: (no subject)
Date: Fri, 30 Apr 2004 10:32:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D4EF10CCEB2CE742BEEA9838C590B0E801AA2B1C@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C42E8D.B4EDC700"
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

------_=_NextPart_001_01C42E8D.B4EDC700
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
 I'm having some problems finding how to log ONLY iptable log messages
to another file other than messages. So I made some changes in the
"sylsog.conf" file by adding: kern.warning /var/log/firewall since the
Default log level entry is" warning". But I still reveive some message
other than the packets, from the kernel itself!
 how can I limit the input messages to only Netfilter packets?
What should I change in the syslog.conf file If I don't want to receive
Netfilter messages in this file?
=20

regards
Jad=20

------_=_NextPart_001_01C42E8D.B4EDC700
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
<TITLE></TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;I'm having some problems finding =
how to log ONLY iptable log messages to another file other than =
messages. So I made some changes in the &quot;sylsog.conf&quot; file by =
adding:<B> kern.warning /var/log/firewall</B> since the Default log =
level entry is&quot; warning&quot;. But I still reveive some message =
other than the packets, from the kernel itself!</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;how can I limit the input =
messages to only Netfilter packets?</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">What should I change in the =
syslog.conf file If I don't want to receive Netfilter messages in this =
file?</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">regards</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Jad </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C42E8D.B4EDC700--

