From: "Len L." <len@euler.com>
Subject: RE: Blocking access to UDP port 53 (DNS) - Solution
Date: Mon, 11 Aug 2003 12:48:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12CC60849165134FB7DF8570B621F4D51C89CD@mailxserver.euler.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36030.C207BC00"
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

------_=_NextPart_001_01C36030.C207BC00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

OK,=20
I got it. Here is the rule set I tried and had success (b.t.w. The DNS =
server is fire walled but is a standalone machine - no forwarding)=20
The answer was to reference DNS requests for port 25 only.=20
iptables -A INPUT --protocol udp --source-port 25 -s 63.143.210.0/24 -j =
LOG --log-prefix "XXX LOCAL UDP DNS XXX "
iptables -A INPUT --protocol udp --source-port 25 -s 63.143.210.0/24 -j =
ACCEPT
iptables -A INPUT --protocol udp --source-port 25 -j LOG --log-prefix =
"XXX EXTERNAL UDP LOG XXX "
iptables -A INPUT --protocol udp --source-port 25 -j ACCEPT
iptables -A INPUT -p udp -j LOG --log-prefix "XXX UDP DROP XXX "
iptables -A INPUT -p udp -j DROP=20
Also will drop the 25 sport reference on the internal side along with =
the logging as a final solution


Len Laulainen=20




------_=_NextPart_001_01C36030.C207BC00
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
<TITLE>RE: Blocking access to UDP port 53 (DNS) - Solution</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">OK,</FONT><FONT =
FACE=3D"Times New Roman"> </FONT>

<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">I got it. Here is =
the rule set I tried and had success (b.t.w. The DNS server is fire =
walled but is a standalone machine - no forwarding)</FONT><FONT =
FACE=3D"Times New Roman"> </FONT></P>

<P><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">The answer was to =
reference DNS requests for port 25 only.</FONT><FONT FACE=3D"Times New =
Roman"> </FONT>

<BR><FONT COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Arial">iptables -A INPUT =
--protocol udp --source-port 25 -s 63.143.210.0/24 -j LOG --log-prefix =
&quot;XXX LOCAL UDP DNS XXX &quot;<BR>
iptables -A INPUT --protocol udp --source-port 25 -s 63.143.210.0/24 -j =
ACCEPT<BR>
iptables -A INPUT --protocol udp --source-port 25 -j LOG --log-prefix =
&quot;XXX EXTERNAL UDP LOG XXX &quot;<BR>
iptables -A INPUT --protocol udp --source-port 25 -j ACCEPT<BR>
iptables -A INPUT -p udp -j LOG --log-prefix &quot;XXX UDP DROP XXX =
&quot;<BR>
iptables -A INPUT -p udp -j DROP</FONT><FONT FACE=3D"Times New Roman"> =
</FONT>

<BR><FONT FACE=3D"Times New Roman">Also will drop the 25 sport reference =
on the internal side along with the logging as a final solution</FONT>
</P>
<BR>

<P><B><FONT FACE=3D"Arial">Len Laulainen</FONT></B><FONT FACE=3D"Times =
New Roman"> </FONT>
</P>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C36030.C207BC00--

