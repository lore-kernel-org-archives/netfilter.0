From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: Does NAT modify sequence number in packet ?
Date: Thu, 28 Nov 2002 08:50:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD77734@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C296B2.DDBFA8D9"
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

------_=_NextPart_001_01C296B2.DDBFA8D9
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,
>
>Does NAT change Sequence number in packet ? or only change IPAddress =
and/or=20
>Port
>

Under normal circumstances only the IP address(es) and sometimes port
numbers are changed. But if a connection tracking NAT module (eg.=20
ip_nat_ftp, ip_nat_irc) changes the data payload to make it correspond
to the IP addresses in the IP header, then it's is possible that
the original packet's length changes and then sequence numbers are
adjusted accordingly by the NAT code.

Regards,
Filip





------_=_NextPart_001_01C296B2.DDBFA8D9
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
<TITLE>RE: Does NAT modify sequence number in packet ?</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
&gt;<BR>
&gt;Does NAT change Sequence number in packet ? or only change IPAddress =
and/or<BR>
&gt;Port<BR>
&gt;<BR>
<BR>
Under normal circumstances only the IP address(es) and sometimes =
port<BR>
numbers are changed. But if a connection tracking NAT module (eg.<BR>
ip_nat_ftp, ip_nat_irc) changes the data payload to make it =
correspond<BR>
to the IP addresses in the IP header, then it's is possible that<BR>
the original packet's length changes and then sequence numbers are<BR>
adjusted accordingly by the NAT code.<BR>
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
------_=_NextPart_001_01C296B2.DDBFA8D9--

