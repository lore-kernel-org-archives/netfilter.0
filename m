From: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Subject: DNAT question
Date: Mon, 14 Jun 2004 16:35:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <519AD2BA94FC6E4DB5DE078B2E37CB10A37999@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4521C.CF565987"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

------_=_NextPart_001_01C4521C.CF565987
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I want to DNAT some machines in another subnet.
The target machines have ip's like 11.0.0.x/24

My available lan ip's are 172.239.239.x/27 (255.255.255.224)

These are my rules. Wich are apparently not working.
I created virtual interfaces on eth1, one for each DNAT'ed ip.

What am I missing ? Forget about normal tables stuff, I only want this
machine to do DNAT.

Thx,


INET_IP=3D"172.25.239.208"
INET_IFACE=3D"eth1"
INET_BROADCAST=3D"172.25.239.223"
LAN_IP=3D"11.0.0.1"
LAN_IP_RANGE=3D"11.0.0.0/24"
LAN_IFACE=3D"eth0"
LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"
IPTABLES=3D"/sbin/iptables"
echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES --flush
$IPTABLES --table nat --flush
$IPTABLES --delete-chain
$IPTABLES --table nat --delete-chain
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
$INET_IP
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -t nat -A PREROUTING -d 172.25.239.220/255.255.255.224 -j DNAT
--to 11.0.0.9


------_=_NextPart_001_01C4521C.CF565987
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.6980.66">
<TITLE>DNAT question</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hello all,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I want to DNAT some machines in another =
subnet.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">The target machines have ip's like =
11.0.0.x/24</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">My available lan ip's are =
172.239.239.x/27 (255.255.255.224)</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">These are my rules. Wich are apparently =
not working.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">I created virtual interfaces on eth1, =
one for each DNAT'ed ip.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">What am I missing ? Forget about normal =
tables stuff, I only want this machine to do DNAT.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thx,</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">INET_IP=3D&quot;172.25.239.208&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">INET_IFACE=3D&quot;eth1&quot;</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">INET_BROADCAST=3D&quot;172.25.239.223&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">LAN_IP=3D&quot;11.0.0.1&quot;</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">LAN_IP_RANGE=3D&quot;11.0.0.0/24&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">LAN_IFACE=3D&quot;eth0&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">LO_IFACE=3D&quot;lo&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">LO_IP=3D&quot;127.0.0.1&quot;</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">IPTABLES=3D&quot;/sbin/iptables&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">echo &quot;1&quot; &gt; =
/proc/sys/net/ipv4/ip_forward</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES --flush</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES --table nat --flush</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES --delete-chain</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES --table nat =
--delete-chain</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES -t nat -A POSTROUTING -o =
$INET_IFACE -j SNAT --to-source $INET_IP</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES -A FORWARD -i $LAN_IFACE -j =
ACCEPT</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">$IPTABLES -t nat -A PREROUTING -d =
172.25.239.220/255.255.255.224 -j DNAT --to 11.0.0.9</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C4521C.CF565987--

