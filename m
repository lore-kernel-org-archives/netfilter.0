From: Jean Cantarutti <jcantarutti@subtel.cl>
Subject: RE: Memory leak problem
Date: Fri, 27 Sep 2002 12:56:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7F2740B50D94FD4B9EAF9AAC33016C3C45383B@lascar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/html; charset="us-ascii"
To: 'Anthony Liu' <anthony@nexus-online.com>, Jean Cantarutti <jcantarutti@subtel.cl>
Cc: Netfilter Mailing List <netfilter@lists.samba.org>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Memory leak problem</TITLE>
</HEAD>
<BODY>

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">Hi, we serve 300 =
clients for forwarding and 3 servers(http,vpn,h.323) using NAT.</FONT>
</P>

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">thanks</FONT>
</P>

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">Jean =
Cantarutti</FONT>
<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 =
FACE=3D"Arial">jcantarutti@subtel.cl</FONT>
</P>
<UL>
<P><FONT SIZE=3D1 FACE=3D"Arial">-----Mensaje original-----</FONT>
<BR><B><FONT SIZE=3D1 =
FACE=3D"Arial">De:&nbsp;&nbsp;&nbsp;&nbsp;</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">Anthony Liu [SMTP:anthony@nexus-online.com]</FONT>
<BR><B><FONT SIZE=3D1 FACE=3D"Arial">Enviado =
el:&nbsp;&nbsp;&nbsp;&nbsp;</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">viernes, 27 de septiembre de 2002 12:51</FONT>
<BR><B><FONT SIZE=3D1 FACE=3D"Arial">Para:&nbsp;&nbsp;</FONT></B> <FONT =
SIZE=3D1 FACE=3D"Arial">Jean Cantarutti</FONT>
<BR><B><FONT SIZE=3D1 =
FACE=3D"Arial">CC:&nbsp;&nbsp;&nbsp;&nbsp;</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">Netfilter Mailing List</FONT>
<BR><B><FONT SIZE=3D1 FACE=3D"Arial">Asunto:</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">Re: Memory leak problem</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">On Fri, 27 Sep 2002 11:03:32 =
-0400 Jean Cantarutti &lt;jcantarutti@subtel.cl&gt; wrote:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">&gt; Memory leak problem</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&gt; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&gt; Hi, im using iptables =
1.2.5 on a HP machine working like firewall, it has 512 MB of RAM and =
every 30 seconds eats 6 kb of RAM, in 48 hours only left 8300 kb of =
available RAM.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">&gt; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&gt; I need help.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Are you sure it was leaking =
memory? Each tracked connection use up some kernel memory.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New"><A =
HREF=3D"http://www.netfilter.org/documentation/FAQ/netfilter-faq.html#to=
c3.6" =
TARGET=3D"_blank">http://www.netfilter.org/documentation/FAQ/netfilter-f=
aq.html#toc3.6</A></FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Ignore &quot;available&quot; =
RAM, the system will take as much &quot;available&quot; RAM for various =
cache buffers,</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">the system will release it back =
from the cache buffers when needed.&nbsp; If the memory pressure =
still</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">increase, the system will start =
to swap some other process out.&nbsp; Unless you are seeing =
out-of-memory</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">situation in the syslog, it =
should not be a problem.&nbsp; BTW, how many clients is the firewall =
serving?</FONT>
</P>
</UL>
</BODY>
</HTML>

