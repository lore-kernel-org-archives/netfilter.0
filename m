From: "Morrison, Trevor (Trevor)" <tmorrison@avaya.com>
Subject: h323
Date: Mon, 11 Aug 2003 11:50:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2C8B3976EDADFD41950F8C628F3E255A06B56626@co9510avexu2.global.avaya.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36031.097F00FD"
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

------_=_NextPart_001_01C36031.097F00FD
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a RH 9.0 box running iptables-1.2.8 and a 2.4.20 kernel with the =
h323 patch applied and recompiled.  My network looks like this:

				    dhcp from ISP
Win 2000 box <--------------------------->RH 9.0 =
Box<---------------------->Internet
192.168.1.0/24				NAT       12.207.X.X/32


I have searched the archives back to September of last year trying to =
find what rules I need to apply to my iptables to allow h323 traffic =
through my NAT'd box.  I am now more confused then before because the =
threads mentioned something about a gatekeeper that I need to run on a =
NAT box?

What I am looking for is what are the rules that I need to put into my =
filter file and what other programs or procedures do I need to add to =
that I have the full features and functionality of Microsoft's Net =
Meeting from my Win 2k box. =20

Thanks in Advance and sorry for bring this subject up again but I could =
not find the information in the previous threads.

Trevor Morrison


------_=_NextPart_001_01C36031.097F00FD
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6389.0">
<TITLE>h323</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have a RH 9.0 box running =
iptables-1.2.8 and a 2.4.20 kernel with the h323 patch applied and =
recompiled.&nbsp; My network looks like this:</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp; dhcp from ISP</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Win 2000 box =
&lt;---------------------------&gt;RH 9.0 =
Box&lt;----------------------&gt;Internet</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">192.168.1.0/24&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
NAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12.207.X.X/32</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have searched the archives back to =
September of last year trying to find what rules I need to apply to my =
iptables to allow h323 traffic through my NAT'd box.&nbsp; I am now more =
confused then before because the threads mentioned something about a =
gatekeeper that I need to run on a NAT box?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">What I am looking for is what are the =
rules that I need to put into my filter file and what other programs or =
procedures do I need to add to that I have the full features and =
functionality of Microsoft's Net Meeting from my Win 2k box.&nbsp; =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in Advance and sorry for bring =
this subject up again but I could not find the information in the =
previous threads.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Trevor Morrison</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C36031.097F00FD--

