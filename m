From: mpdykeman@micron.com
Subject: Connection table management
Date: Thu, 20 Nov 2003 16:46:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <040405FAA8D7CD41BCA471B1A3451EE305AA76@ntxboimbx08.micron.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3AFC0.7C201816"
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

------_=_NextPart_001_01C3AFC0.7C201816
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Two questions,

1) I've seen tools like cutter that jump though hoops to kill
connections using RSTs with invalid sequence numbers... However, is
there any way to force iptables to delete a connection entry from the
connection table so that further packets arriving for that connection
can simply be DROPed/REJECTed because there is no ASSURED/ESTABLISHED
matching state?

2) Short of setting up logging rules for RST/FIN packets, is there a way
to get iptables to log connection teardowns and the cause for the
teardown (especially since RST/FIN is not the only way that a connection
can be dropped from the table--i.e, when the kernal drops the connection
from the table because of inactivity)?

In general, while I am impressed with the
performance/stability/manageability of an iptables firewall, either I'm
not looking in the right place for documentation, or direct manipulation
of the connection table is not available without resorting to kernel
level programming.

Thanx.

--Markley Dykeman



------_=_NextPart_001_01C3AFC0.7C201816
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
<TITLE>Connection table management</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Verdana">Two questions,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">1) I've seen tools like cutter that =
jump though hoops to kill connections using RSTs with invalid sequence =
numbers... However, is there any way to force iptables to delete a =
connection entry from the connection table so that further packets =
arriving for that connection can simply be DROPed/REJECTed because there =
is no ASSURED/ESTABLISHED matching state?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">2) Short of setting up logging rules =
for RST/FIN packets, is there a way to get iptables to log connection =
teardowns and the cause for the teardown (especially since RST/FIN is =
not the only way that a connection can be dropped from the table--i.e, =
when the kernal drops the connection from the table because of =
inactivity)?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">In general, while I am impressed with =
the performance/stability/manageability of an iptables firewall, either =
I'm not looking in the right place for documentation, or direct =
manipulation of the connection table is not available without resorting =
to kernel level programming.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">Thanx.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">--Markley Dykeman</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C3AFC0.7C201816--

