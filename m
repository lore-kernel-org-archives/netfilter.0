From: mpdykeman@micron.com
Subject: RE: MRTG and IPTABLES
Date: Wed, 7 Jan 2004 09:17:37 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <040405FAA8D7CD41BCA471B1A3451EE305AAA6@ntxboimbx08.micron.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3D539.C43C0397"
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
To: EugeneJ@centratel.co.za
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3D539.C43C0397
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

MRTG uses snmp to poll devices...

SNMP runs on two ports -- udp/161 (polling from the monitoring console)
and udp/162 (SNMP traps sent to monitoring console)

For your purposes, you are probably interested in udp/161

-mpd

------_=_NextPart_001_01C3D539.C43C0397
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
<TITLE>RE: MRTG and IPTABLES</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Verdana">MRTG uses snmp to poll =
devices&#8230;</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">SNMP runs on two ports -- udp/161 =
(polling from the monitoring console) and udp/162 (SNMP traps sent to =
monitoring console)</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">For your purposes, you are probably =
interested in udp/161</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">-mpd</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C3D539.C43C0397--

