From: "Mark Webb" <webb@mmspl.com.au>
Subject: Monitoring problems...
Date: Thu, 30 Oct 2003 09:52:53 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DFD93DB4ABEF7243BC4F81DE17A182EF94B2@tugexch.vpn.mmsi.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39E6F.6306F999"
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

------_=_NextPart_001_01C39E6F.6306F999
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I was asked by the powers that be to set up some monitoring of our =
workplaces internet traffic. Basically a breakdown of the volume used =
and what protocol is using it.  i.e. 20% mail, 30% web, 10% ftp, etc.... =

I have installed a RH9 box and installed it onto a hub that also has the =
internal interface of our router and the connection to our internal =
network.  By my understanding this is the spot to "sniff" all traffic =
entering or leaving the internal network.

On the box I have iptables running using the following:

iptables -A INPUT -j LOG --log-level 7 --log-prefix '[MONITOR]'

I have also altered the syslog to send kern.* to a new log file.


Now all this seems to be working (sort of).   If I compare the log to a =
tcpdump output the log is only capturing about 5%.  On looking closer =
the log is only filing local and broadcast traffic.  It is not recording =
any traffic from other hosts out.  Perhaps I am using the wrong tool for =
the job or am just missing a step, something easy.  Any help is greatly =
appreciated.

Oh I also tried setting the interface on the RH box via: ifconfig eth0 =
promisc
This seemed to increase the amount of traffic logged but makes all =
traffic appear to be for the local machine.


Thanks in advance.=20

------_=_NextPart_001_01C39E6F.6306F999
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>Monitoring problems...</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">I was asked by the powers that be to =
set up some monitoring of our workplaces internet traffic. Basically a =
breakdown of the volume used and what protocol is using it.&nbsp; i.e. =
20% mail, 30% web, 10% ftp, etc.... </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have installed a RH9 box and =
installed it onto a hub that also has the internal interface of our =
router and the connection to our internal network.&nbsp; By my =
understanding this is the spot to &quot;sniff&quot; all traffic entering =
or leaving the internal network.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">On the box I have iptables running =
using the following:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -j LOG --log-level 7 =
--log-prefix '[MONITOR]'</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have also altered the syslog to send =
kern.* to a new log file.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Now all this seems to be working (sort =
of).&nbsp;&nbsp; If I compare the log to a tcpdump output the log is =
only capturing about 5%.&nbsp; On looking closer the log is only filing =
local and broadcast traffic.&nbsp; It is not recording any traffic from =
other hosts out.&nbsp; Perhaps I am using the wrong tool for the job or =
am just missing a step, something easy.&nbsp; Any help is greatly =
appreciated.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Oh I also tried setting the interface =
on the RH box via: ifconfig eth0 promisc</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">This seemed to increase the amount of =
traffic logged but makes all traffic appear to be for the local =
machine.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in advance. </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C39E6F.6306F999--

