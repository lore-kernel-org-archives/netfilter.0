From: "Juan Torres" <islero77@telefonica.net>
Subject: Problems installing Netfilter extensions
Date: Thu, 19 Jun 2003 21:04:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c33695$b3582070$0300000a@juan>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0004_01C336A6.76E0F070"
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
To: Netfilter-users <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0004_01C336A6.76E0F070
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


	Hi!!

	I'm trying to install a Netfilter extension, mport, but it
doesn't work

	I make all the steps that comes on the Netfilter Extensions
HOWTO, but, when I try to use the new match, it appears an error saying
that it doesn't exists the libipt_mport.so file, I have observed that
there are the ipt_mport.c and ipt_mport.h files, but no this other file.

	I think that the problem is because I can't make the last step
explained in the documentation, where is written:

		Once your new kernel is installed, you can go ahead and
compile and install the "iptables" package, from the "userspace/"
directory as follows:
			# make all install

	This last step doesn't work!! When I execute this command in the
userspace/ subdirectory inside the patch-o-matic directory, It appears
an error saying that It can't find the "all" option (or something
similar)


	What I'm not doing properly??


	Than you very much



------=_NextPart_000_0004_01C336A6.76E0F070
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
<TITLE>Problems installing Netfilter extensions</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->
<BR>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Hi</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"><FONT SIZE=3D2 =
FACE=3D"Arial">!!</FONT></SPAN></P>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"es">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">m =
trying to install a Netfilter extension, mport, but it =
doesn</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t =
work</FONT></SPAN></P>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I make all the steps that come</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">s on the Netfilter Extensions HOWTO, but, when =
I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"en-gb"> <FONT SIZE=3D2 FACE=3D"Arial">try to use the new match, =
it appears an error sayi</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">ng =
that it doesn</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t =
exists the libipt_mport.so file, I have</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">observed that there are the ipt_mport.c =
and</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> ipt_mport.h files, but no =
this other file.</FONT></SPAN></P>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">I think that the problem is because I =
can</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">t</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">make</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> =
the last step explained in the documentation</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">,</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">where is written:</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"en-gb"></SPAN></P>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">Once your new kernel is installed, you can go =
ahead and compile and install the</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">iptables</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> package, from the</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT =
SIZE=3D2 FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">userspace/</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> directory as follows:</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"en-gb"></SPAN></P>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial"># make all install</FONT></SPAN></P>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Thi</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">s =
last step doesn</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t =
work!!</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">When I execute this command in the userspace/ =
subdirectory inside the p</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">atch</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">-o-m</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">atic directory, It appears an error saying that =
I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">t</FONT></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT =
SIZE=3D2 FACE=3D"Arial"> can</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">t</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">find the</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"> <FONT SIZE=3D2 =
FACE=3D"Arial">&#8220;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">all</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8221;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial"> =
option (or something similar)</FONT></SPAN></P>
<BR>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">What I</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 =
FACE=3D"Arial">&#8217;</FONT></SPAN><SPAN LANG=3D"es"></SPAN><SPAN =
LANG=3D"es"></SPAN><SPAN LANG=3D"en-gb"><FONT SIZE=3D2 FACE=3D"Arial">m =
not doing properly??</FONT></SPAN></P>
<BR>

<P ALIGN=3DJUSTIFY><SPAN =
LANG=3D"en-gb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Than you very much</FONT></SPAN></P>
<BR>

</BODY>
</HTML>
------=_NextPart_000_0004_01C336A6.76E0F070--


