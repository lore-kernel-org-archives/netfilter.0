From: =?ISO-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: RE: forwarding
Date: Tue, 18 May 2004 19:04:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FEFC@smtp.retecal.es>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C43CFA.3C8F95B0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'alucard@kanux.com'" <alucard@kanux.com>
Cc: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C43CFA.3C8F95B0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

hi

Im testing your configuration in my test machines and it=B4s works for =
me


=09
Firewall					web server
172.40.x.x (yes, local network with public ip, aggg) ----- =
[172.40.42.200 -
192.168.150.1] ----- [192.168.150.2]



firewall:~# iptables -L -t nat -n -v
Chain PREROUTING (policy ACCEPT 259 packets, 35934 bytes)
 pkts bytes target     prot opt in     out     source
destination
    3   144 DNAT       tcp  --  *      *       0.0.0.0/0
172.40.43.200      tcp dpt:8080 to:192.168.150.2:80

Chain POSTROUTING (policy ACCEPT 39 packets, 2680 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 19 packets, 1499 bytes)
 pkts bytes target     prot opt in     out     source
destination
firewall:~#

firewall:~# iptables -L -n -v
Chain INPUT (policy DROP 15 packets, 1455 bytes)
 pkts bytes target     prot opt in     out     source
destination
 2943  293K ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED
    1    48 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:22

Chain FORWARD (policy DROP 1 packets, 72 bytes)
 pkts bytes target     prot opt in     out     source
destination
 3963 3939K ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED
    3   144 ACCEPT     tcp  --  *      *       0.0.0.0/0
192.168.150.2      tcp dpt:80

Chain OUTPUT (policy ACCEPT 3794 packets, 283K bytes)
 pkts bytes target     prot opt in     out     source
destination
firewall:~#


balanceador:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.150.0   0.0.0.0         255.255.255.252 U     0      0        0 =
eth1
192.168.200.0   0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
0.0.0.0         192.168.150.1   0.0.0.0         UG    0      0        0 =
eth1
balanceador:~#


firewall:~# tcpdump -n tcp src or dst port 80 or 8080
tcpdump: listening on eth0
20:01:06.945606 172.60.60.75.2286 > 172.40.43.200.8080: S
1752076561:1752076561(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
20:01:06.946034 172.40.43.200.8080 > 172.60.60.75.2286: S
2920282127:2920282127(0) ack 1752076562 win 5840 <mss =
1460,nop,nop,sackOK>
(DF)
20:01:06.946273 172.60.60.75.2286 > 172.40.43.200.8080: . ack 1 win =
17520
(DF)
20:01:17.851129 172.60.60.75.2286 > 172.40.43.200.8080: P 1:3(2) ack 1 =
win
17520 (DF)
20:01:17.851467 172.40.43.200.8080 > 172.60.60.75.2286: . ack 3 win =
5840
(DF)

balanceador:~# tcpdump -i eth1 -n tcp src or dst port 80
tcpdump: listening on eth1
21:08:36.116571 172.60.60.75.2286 > 192.168.150.2.80: S
1752076561:1752076561(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
21:08:36.116668 192.168.150.2.80 > 172.60.60.75.2286: S
2920282127:2920282127(0) ack 1752076562 win 5840 <mss =
1460,nop,nop,sackOK>
(DF)
21:08:36.117201 172.60.60.75.2286 > 192.168.150.2.80: . ack 1 win 17520 =
(DF)
21:08:47.022155 172.60.60.75.2286 > 192.168.150.2.80: P 1:3(2) ack 1 =
win
17520 (DF)
21:08:47.022211 192.168.150.2.80 > 172.60.60.75.2286: . ack 3 win 5840 =
(DF)

------_=_NextPart_001_01C43CFA.3C8F95B0
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DISO-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: forwarding</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>hi</FONT>
</P>

<P><FONT SIZE=3D2>Im testing your configuration in my test machines and =
it=B4s works for me</FONT>
</P>
<BR>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>Firewall&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; web server</FONT></P>

<P><FONT SIZE=3D2>172.40.x.x (yes, local network with public ip, aggg) =
----- [172.40.42.200 - 192.168.150.1] ----- [192.168.150.2]</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>firewall:~# iptables -L -t nat -n -v</FONT>
<BR><FONT SIZE=3D2>Chain PREROUTING (policy ACCEPT 259 packets, 35934 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp; 144 =
DNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 172.40.43.200&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp dpt:8080 =
to:192.168.150.2:80</FONT>
</P>

<P><FONT SIZE=3D2>Chain POSTROUTING (policy ACCEPT 39 packets, 2680 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
</P>

<P><FONT SIZE=3D2>Chain OUTPUT (policy ACCEPT 19 packets, 1499 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>firewall:~#</FONT>
</P>

<P><FONT SIZE=3D2>firewall:~# iptables -L -n -v</FONT>
<BR><FONT SIZE=3D2>Chain INPUT (policy DROP 15 packets, 1455 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>&nbsp;2943&nbsp; 293K ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp; --&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state RELATED,ESTABLISHED</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp; 48 =
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
dpt:22</FONT>
</P>

<P><FONT SIZE=3D2>Chain FORWARD (policy DROP 1 packets, 72 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>&nbsp;3963 3939K ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp; --&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state RELATED,ESTABLISHED</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp; 144 =
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 192.168.150.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp dpt:80</FONT>
</P>

<P><FONT SIZE=3D2>Chain OUTPUT (policy ACCEPT 3794 packets, 283K =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>firewall:~#</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>balanceador:~# route -n</FONT>
<BR><FONT SIZE=3D2>Kernel IP routing table</FONT>
<BR><FONT SIZE=3D2>Destination&nbsp;&nbsp;&nbsp;&nbsp; =
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric =
Ref&nbsp;&nbsp;&nbsp; Use Iface</FONT>
<BR><FONT SIZE=3D2>192.168.150.0&nbsp;&nbsp; =
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.252 =
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</FONT>
<BR><FONT SIZE=3D2>192.168.200.0&nbsp;&nbsp; =
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0</FONT>
<BR><FONT =
SIZE=3D2>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
192.168.150.1&nbsp;&nbsp; =
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</FONT>
<BR><FONT SIZE=3D2>balanceador:~#</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>firewall:~# tcpdump -n tcp src or dst port 80 or =
8080</FONT>
<BR><FONT SIZE=3D2>tcpdump: listening on eth0</FONT>
<BR><FONT SIZE=3D2>20:01:06.945606 172.60.60.75.2286 &gt; =
172.40.43.200.8080: S 1752076561:1752076561(0) win 16384 &lt;mss =
1460,nop,nop,sackOK&gt; (DF)</FONT></P>

<P><FONT SIZE=3D2>20:01:06.946034 172.40.43.200.8080 &gt; =
172.60.60.75.2286: S 2920282127:2920282127(0) ack 1752076562 win 5840 =
&lt;mss 1460,nop,nop,sackOK&gt; (DF)</FONT></P>

<P><FONT SIZE=3D2>20:01:06.946273 172.60.60.75.2286 &gt; =
172.40.43.200.8080: . ack 1 win 17520 (DF)</FONT>
<BR><FONT SIZE=3D2>20:01:17.851129 172.60.60.75.2286 &gt; =
172.40.43.200.8080: P 1:3(2) ack 1 win 17520 (DF)</FONT>
<BR><FONT SIZE=3D2>20:01:17.851467 172.40.43.200.8080 &gt; =
172.60.60.75.2286: . ack 3 win 5840 (DF)</FONT>
</P>

<P><FONT SIZE=3D2>balanceador:~# tcpdump -i eth1 -n tcp src or dst port =
80</FONT>
<BR><FONT SIZE=3D2>tcpdump: listening on eth1</FONT>
<BR><FONT SIZE=3D2>21:08:36.116571 172.60.60.75.2286 &gt; =
192.168.150.2.80: S 1752076561:1752076561(0) win 16384 &lt;mss =
1460,nop,nop,sackOK&gt; (DF)</FONT></P>

<P><FONT SIZE=3D2>21:08:36.116668 192.168.150.2.80 &gt; =
172.60.60.75.2286: S 2920282127:2920282127(0) ack 1752076562 win 5840 =
&lt;mss 1460,nop,nop,sackOK&gt; (DF)</FONT></P>

<P><FONT SIZE=3D2>21:08:36.117201 172.60.60.75.2286 &gt; =
192.168.150.2.80: . ack 1 win 17520 (DF)</FONT>
<BR><FONT SIZE=3D2>21:08:47.022155 172.60.60.75.2286 &gt; =
192.168.150.2.80: P 1:3(2) ack 1 win 17520 (DF)</FONT>
<BR><FONT SIZE=3D2>21:08:47.022211 192.168.150.2.80 &gt; =
172.60.60.75.2286: . ack 3 win 5840 (DF)</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C43CFA.3C8F95B0--

