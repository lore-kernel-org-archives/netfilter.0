From: Jean Cantarutti <jcantarutti@subtel.cl>
Subject: RE: Memory leak problem
Date: Fri, 27 Sep 2002 12:59:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7F2740B50D94FD4B9EAF9AAC33016C3C45383C@lascar>
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
To: 'Anders Fugmann' <afu@fugmann.dhs.org>, Jean Cantarutti <jcantarutti@subtel.cl>
Cc: netfilter@lists.netfilter.org

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

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">Netfilter is the =
only proccess running in that machine (I think).</FONT>
<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">kernel version: =
2.4.18-3</FONT>
<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">gcc version: =
2.96</FONT>
<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">Red Hat Linux 7.3 =
2.96-110</FONT>
</P>

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">regards</FONT>
</P>

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">Jean =
Cantarutti</FONT>
<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 =
FACE=3D"Arial">jcantarutti@subtel.cl</FONT>
</P>
<BR>
<BR>
<BR>
<UL>
<P><FONT SIZE=3D1 FACE=3D"Arial">-----Mensaje original-----</FONT>
<BR><B><FONT SIZE=3D1 =
FACE=3D"Arial">De:&nbsp;&nbsp;&nbsp;&nbsp;</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">Anders Fugmann [SMTP:afu@fugmann.dhs.org]</FONT>
<BR><B><FONT SIZE=3D1 FACE=3D"Arial">Enviado =
el:&nbsp;&nbsp;&nbsp;&nbsp;</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">viernes, 27 de septiembre de 2002 12:08</FONT>
<BR><B><FONT SIZE=3D1 FACE=3D"Arial">Para:&nbsp;&nbsp;</FONT></B> <FONT =
SIZE=3D1 FACE=3D"Arial">Jean Cantarutti</FONT>
<BR><B><FONT SIZE=3D1 =
FACE=3D"Arial">CC:&nbsp;&nbsp;&nbsp;&nbsp;</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">netfilter@lists.netfilter.org</FONT>
<BR><B><FONT SIZE=3D1 FACE=3D"Arial">Asunto:</FONT></B> <FONT SIZE=3D1 =
FACE=3D"Arial">Re: Memory leak problem</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Jean Cantarutti wrote:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&gt; Hi, im using iptables =
1.2.5 on a HP machine working like firewall, it </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&gt; has 512 MB of RAM and =
every 30 seconds eats 6 kb of RAM, in 48 hours </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&gt; only left 8300 kb of =
available RAM.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Do remember that unused ram is =
used for disc cache and buffers, so </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">watching top does not give =
nessesarly an accurate picture of how ram is </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">used.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Could you please describe why =
you think that iptabels/netfilter has a </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">memory leak? Also printouts og =
memory usage would help us understand </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">what is happening.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Btw. What kernel are you =
using?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Regards</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">Anders Fugmann</FONT>
</P>
</UL>
</BODY>
</HTML>

