From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: How to install connection tracking NAT module for FTP or other application else
Date: Thu, 28 Nov 2002 14:27:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD77735@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C296E1.D59C886E"
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
To: "Orca J." <orca_cs@hotmail.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C296E1.D59C886E
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>   How to download and install connection tracking NAT module for FTP =
or=20
>other application else (ip_nat_ftp, ip_nat_irc) ?
>   If any documents will be useful please let me know the URL .

They are in the kernel, do

modprobe ip_nat_ftp
modprobe ip_nat_irc

as root from a commandline.

For other connection tracking/NAT modules, check the netfilter site
and iptables documentation on how to use patch-o-matic to add=20
stuff to your kernel source tree. You'll have to recompile your
kernel to get them to work though...

Regards,
Filip





------_=_NextPart_001_01C296E1.D59C886E
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>RE: How to install connection tracking NAT module for FTP or =
other application else </TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>&gt;&nbsp;&nbsp; How to download and install =
connection tracking NAT module for FTP or<BR>
&gt;other application else (ip_nat_ftp, ip_nat_irc) ?<BR>
&gt;&nbsp;&nbsp; If any documents will be useful please let me know the =
URL .<BR>
<BR>
They are in the kernel, do<BR>
<BR>
modprobe ip_nat_ftp<BR>
modprobe ip_nat_irc<BR>
<BR>
as root from a commandline.<BR>
<BR>
For other connection tracking/NAT modules, check the netfilter site<BR>
and iptables documentation on how to use patch-o-matic to add<BR>
stuff to your kernel source tree. You'll have to recompile your<BR>
kernel to get them to work though...<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C296E1.D59C886E--

