From: "Aris  Santillan" <aris.santillan@summitmedia.com.ph>
Subject: Port Forwarding
Date: Fri, 26 Sep 2003 16:37:33 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <831411C4CBD37C4A91DBEC9B98A64C8B6C44A6@spmail.summitmedia.com.ph>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C38409.6E724CE4"
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
To: "netfilter (E-mail)" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C38409.6E724CE4
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi guys


i ve 2 server A and B
A have 190.200.1.62
B have 190.200.1.61


190.200.1.62 is binded to an external IP(203.167.117.154)
in the Cisco router.



i want to forward incoming HTTP request to 190.200.1.61 w/c is my=20
web server

i do this


echo '1' > /etc/sys/net/ipv4/ip_forward

iptables -t nat -A prerouting -p tcp -i eth0 -d 190.200.1.62 --dport 80 =
-j DNAT --to 190.200.1.61:80
iptables -A FORWARD -p tcp -i eth0 -d 190.200.1.61 --dport 80 -j ACCEPT


but it seems doesnt work..... i need ur advice & solutions

thanks in advance
aris

------_=_NextPart_001_01C38409.6E724CE4
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
<TITLE>Port Forwarding</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">hi guys</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">i ve 2 server A and B</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">A have 190.200.1.62</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">B have 190.200.1.61</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">190.200.1.62 is binded to an external =
IP(203.167.117.154)</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">in the Cisco router.</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">i want to forward incoming HTTP request =
to 190.200.1.61 w/c is my </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">web server</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">i do this</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">echo '1' &gt; =
/etc/sys/net/ipv4/ip_forward</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -t nat -A prerouting -p tcp -i =
eth0 -d 190.200.1.62 --dport 80 -j DNAT --to 190.200.1.61:80</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A FORWARD -p tcp -i eth0 -d =
190.200.1.61 --dport 80 -j ACCEPT</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">but it seems doesnt work..... i need ur =
advice &amp; solutions</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">thanks in advance</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">aris</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C38409.6E724CE4--

