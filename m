From: "Barry L. Jeung" <bjeung@teamlynx.com>
Subject: Binding output traffic to specific (aliased) interface
Date: Tue, 11 Mar 2003 20:18:33 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D7FB597C5A18824C9A257EC757CEAF4C344D90@pepsi.teamlynx.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2E84E.71CF14C8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

------_=_NextPart_001_01C2E84E.71CF14C8
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry guys, I know this is a simple question but I'm pretty brain dead
right now. Basically, I have a firewall and a CS (Counter-Strike) server
behind it. The physical interface on the firewall is .210 and I have an
aliased interface as .211 . I have a rule for forward inbound CS traffic
(UDP port 27015) on the aliased interface to the internal box. All
normal gameplay works fine. However, because I'm doing NAT, some
outbound traffic (master server communication) is going out from the
.210 address. How can I specify that all traffic with source from my CS
box goes out the aliased interface? TIA

------_=_NextPart_001_01C2E84E.71CF14C8
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
<TITLE>Binding output traffic to specific (aliased) interface</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Sorry guys, I know this is a simple =
question but I'm pretty brain dead right now. Basically, I have a =
firewall and a CS (Counter-Strike) server behind it. The physical =
interface on the firewall is .210 and I have an aliased interface as =
.211 . I have a rule for forward inbound CS traffic (UDP port 27015) on =
the aliased interface to the internal box. All normal gameplay works =
fine. However, because I'm doing NAT, some outbound traffic (master =
server communication) is going out from the .210 address. How can I =
specify that all traffic with source from my CS box goes out the aliased =
interface? TIA</FONT></P>

</BODY>
</HTML>
------_=_NextPart_001_01C2E84E.71CF14C8--

