From: "Barry L. Jeung" <bjeung@teamlynx.com>
Subject: Redirecting/DNATing local traffic?
Date: Tue, 22 Apr 2003 13:23:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D7FB597C5A18824C9A257EC757CEAF4C344E1A@pepsi.teamlynx.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3090C.FDE7037E"
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

------_=_NextPart_001_01C3090C.FDE7037E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey guys,
	Is this possible, and if so, what would be the syntax for the
following scenario?

I have a client app that talks to a server behind a linux box doing NAT.
I have forwarding rules from the external IP/port to the internal
IP/port. This works fine. However, what happens is, once the connection
is established, the server trys to make a 2nd connection to a local
service on the same machine, but different port. But what is happening
is since the client is connecting to the external IP, the server tries
to connect to it's external IP instead of localhost or its internal IP.
So I need to bounce traffic coming from that box (192.168.20.x) destined
to the equivalent external IP, back to itself. Thanks for your help.

------_=_NextPart_001_01C3090C.FDE7037E
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>Redirecting/DNATing local traffic?</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hey guys,</FONT>

<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Is this possible, and if so, what would be the syntax for =
the following scenario?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have a client app that talks to a =
server behind a linux box doing NAT. I have forwarding rules from the =
external IP/port to the internal IP/port. This works fine. However, what =
happens is, once the connection is established, the server trys to make =
a 2nd connection to a local service on the same machine, but different =
port. But what is happening is since the client is connecting to the =
external IP, the server tries to connect to it's external IP instead of =
localhost or its internal IP. So I need to bounce traffic coming from =
that box (192.168.20.x) destined to the equivalent external IP, back to =
itself. Thanks for your help.</FONT></P>

</BODY>
</HTML>
------_=_NextPart_001_01C3090C.FDE7037E--

