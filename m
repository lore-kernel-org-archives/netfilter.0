From: "Len L." <len@euler.com>
Subject: Blocking access to UDP port 53 (DNS)
Date: Mon, 11 Aug 2003 11:25:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12CC60849165134FB7DF8570B621F4D5FC4C@mailxserver.euler.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36025.28EB2420"
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
Cc: "Len L." <len@euler.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C36025.28EB2420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Does anyone know how to block the use of a DNS server (udp port 53) from =
outside, but still have external mail be able to resolve addresses?

Here is what I tried ( xxx.xxx.xxx.0 is our external net that the dns =
server is on)

iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp -j LOG --log-prefix "XXX =
LOCAL UDP DNS  XXX  "
iptables -A INPUT -s xxx.xxx.xxx.0/24 -p udp -j ACCEPT
iptables -A INPUT -p udp -j LOG --log-prefix "XXX INPUT UDP LOG-drop XXX =
 "
iptables -A INPUT -p udp -j DROP

DNS requests from our machines works with the rules above, but here is =
the message a remote system gets when someone mails us:=20

Aug 11 10:33:52 remotemachine sendmail[16732]: h7BFVAAR016730: =
to=3D<len@machine.ourdomain.com>, ctladdr=3D<someone@their.domain.com> =
(0/0), delay=3D00:01:49, xdelay=3D00:01:49, mailer=3Desmtp, pri=3D30344, =
relay=3Dmachine.ourdomain.com., dsn=3D4.0.0, stat=3DDeferred: Name =
server: machine.ourdomain.com.: host name lookup failure


Len Laulainen


------_=_NextPart_001_01C36025.28EB2420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>Blocking access to UDP port 53 (DNS)</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Does anyone know how to block the use =
of a DNS server (udp port 53) from outside, but still have external mail =
be able to resolve addresses?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Here is what I tried ( xxx.xxx.xxx.0 is =
our external net that the dns server is on)</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s xxx.xxx.xxx.0/24 =
-p udp -j LOG --log-prefix &quot;XXX LOCAL UDP DNS&nbsp; XXX&nbsp; =
&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s xxx.xxx.xxx.0/24 =
-p udp -j ACCEPT</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -p udp -j LOG =
--log-prefix &quot;XXX INPUT UDP LOG-drop XXX&nbsp; &quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -p udp -j =
DROP</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">DNS requests from our machines works =
with the rules above, but here is the message a remote system gets when =
someone mails us: </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Aug 11 10:33:52 remotemachine =
sendmail[16732]: h7BFVAAR016730: to=3D&lt;len@machine.ourdomain.com&gt;, =
ctladdr=3D&lt;someone@their.domain.com&gt; (0/0), delay=3D00:01:49, =
xdelay=3D00:01:49, mailer=3Desmtp, pri=3D30344, =
relay=3Dmachine.ourdomain.com., dsn=3D4.0.0, stat=3DDeferred: Name =
server: machine.ourdomain.com.: host name lookup failure</FONT></P>
<BR>

<P><B><FONT FACE=3D"Arial">Len Laulainen</FONT></B>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C36025.28EB2420--

