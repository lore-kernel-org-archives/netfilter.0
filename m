From: =?ISO-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: Complex NAT problems
Date: Thu, 20 May 2004 13:35:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FF0D@smtp.retecal.es>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C43E5E.940B6840"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C43E5E.940B6840
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi

I have a strage problem with iptables NAT

I try to join 2 net with the same ip.


fwinet-2:~# iptables -L -n -t nat -v
Chain PREROUTING (policy ACCEPT 41232 packets, 2376K bytes)
 pkts bytes target     prot opt in     out     source
destination
   94  4743 NETMAP     all  --  eth2   *       172.0.0.0/8
172.20.4.0/24       172.16.4.0/24
    7   420 NETMAP     all  --  eth1   *       172.16.4.0/24
172.20.3.0/24       172.16.33.0/24

Chain POSTROUTING (policy ACCEPT 21845 packets, 1167K bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 NETMAP     all  --  *      eth1    172.16.33.0/24
172.16.4.0/24       172.20.3.0/24
  654 33367 NETMAP     all  --  *      eth2    172.16.4.0/24
172.0.0.0/8         172.20.4.0/24
    0     0 SNAT       all  --  *      eth0    172.16.0.0/16
0.0.0.0/0           to:192.168.8.6
    0     0 SNAT       all  --  *      eth0    172.40.40.0/22
0.0.0.0/0           to:192.168.8.6
    0     0 SNAT       all  --  *      eth0    172.60.60.0/24
0.0.0.0/0           to:192.168.8.6
  394 32515 SNAT       all  --  *      eth0    10.152.24.100
0.0.0.0/0           to:192.168.8.6
    0     0 MASQUERADE  all  --  *      eth1    0.0.0.0/0
172.16.4.14

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination


The 1=BA rule in POSTROUTING table don=B4t work, the packets go to the =
inteface
eth1 with the original ip, i have the same problem for the other NETMAP
rules(i also try with SNAT/DNAT) but when y reboot de firewall the =
rules
apply correctly.
This only happend when modify the rules and no reboot, if reboot and =
load
the firewall script (with the new rules) all work ok.


fwinet-2:~# tcpdump -i eth2 -n icmp
tcpdump: listening on eth2
13:25:38.157106 172.16.33.1 > 172.20.4.11: icmp: echo request
13:25:39.158705 172.16.33.1 > 172.20.4.11: icmp: echo request

fwinet-2:~# tcpdump -i eth1 -n icmp
tcpdump: listening on eth1
13:25:43.163094 172.16.33.1 > 172.16.4.11: icmp: echo request

It=B4s very strange.

fwinet-2:~# uname -a
Linux fwinet-2 2.4.26 #2 Mon May 17 21:11:05 CEST 2004 i686 unknown


gretings

David Carde=F1osa

------_=_NextPart_001_01C43E5E.940B6840
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
<TITLE>Complex NAT problems</TITLE>
</HEAD>
<BODY>
<BR>

<P><FONT SIZE=3D2>Hi</FONT>
</P>

<P><FONT SIZE=3D2>I have a strage problem with iptables NAT</FONT>
</P>

<P><FONT SIZE=3D2>I try to join 2 net with the same ip.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>fwinet-2:~# iptables -L -n -t nat -v</FONT>
<BR><FONT SIZE=3D2>Chain PREROUTING (policy ACCEPT 41232 packets, 2376K =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 94&nbsp; 4743 =
NETMAP&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth2&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.0.0.0/8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.20.4.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.4.0/24</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 7&nbsp;&nbsp; 420 =
NETMAP&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; eth1&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.16.4.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.20.3.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.16.33.0/24</FONT>
</P>

<P><FONT SIZE=3D2>Chain POSTROUTING (policy ACCEPT 21845 packets, 1167K =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
NETMAP&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth1&nbsp;&nbsp;&nbsp; =
172.16.33.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.16.4.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 172.20.3.0/24</FONT>
<BR><FONT SIZE=3D2>&nbsp; 654 33367 NETMAP&nbsp;&nbsp;&nbsp;&nbsp; =
all&nbsp; --&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
eth2&nbsp;&nbsp;&nbsp; =
172.16.4.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.0.0.0/8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.20.4.0/24</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0&nbsp;&nbsp;&nbsp; =
172.16.0.0/16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
to:192.168.8.6</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0&nbsp;&nbsp;&nbsp; =
172.40.40.0/22&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
to:192.168.8.6</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0&nbsp;&nbsp;&nbsp; =
172.60.60.0/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
to:192.168.8.6</FONT>
<BR><FONT SIZE=3D2>&nbsp; 394 32515 =
SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0&nbsp;&nbsp;&nbsp; =
10.152.24.100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
to:192.168.8.6</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
MASQUERADE&nbsp; all&nbsp; --&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
eth1&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 172.16.4.14</FONT>
</P>

<P><FONT SIZE=3D2>Chain OUTPUT (policy ACCEPT 0 packets, 0 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; destination</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>The 1=BA rule in POSTROUTING table don=B4t work, the =
packets go to the inteface eth1 with the original ip, i have the same =
problem for the other NETMAP rules(i also try with SNAT/DNAT) but when =
y reboot de firewall the rules apply correctly.</FONT></P>

<P><FONT SIZE=3D2>This only happend when modify the rules and no =
reboot, if reboot and load the firewall script (with the new rules) all =
work ok.</FONT></P>
<BR>

<P><FONT SIZE=3D2>fwinet-2:~# tcpdump -i eth2 -n icmp</FONT>
<BR><FONT SIZE=3D2>tcpdump: listening on eth2</FONT>
<BR><FONT SIZE=3D2>13:25:38.157106 172.16.33.1 &gt; 172.20.4.11: icmp: =
echo request</FONT>
<BR><FONT SIZE=3D2>13:25:39.158705 172.16.33.1 &gt; 172.20.4.11: icmp: =
echo request</FONT>
</P>

<P><FONT SIZE=3D2>fwinet-2:~# tcpdump -i eth1 -n icmp</FONT>
<BR><FONT SIZE=3D2>tcpdump: listening on eth1</FONT>
<BR><FONT SIZE=3D2>13:25:43.163094 172.16.33.1 &gt; 172.16.4.11: icmp: =
echo request</FONT>
</P>

<P><FONT SIZE=3D2>It=B4s very strange.</FONT>
</P>

<P><FONT SIZE=3D2>fwinet-2:~# uname -a</FONT>
<BR><FONT SIZE=3D2>Linux fwinet-2 2.4.26 #2 Mon May 17 21:11:05 CEST =
2004 i686 unknown</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>gretings</FONT>
</P>

<P><FONT SIZE=3D2>David Carde=F1osa</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C43E5E.940B6840--

