From: "zufeng huang" <zufeng@hotpop.com>
Subject: Problem iptables DNAT.
Date: Wed, 18 Jun 2003 00:12:56 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001801c334eb$529a2ae0$0b01a8c0@mypc>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0015_01C3352E.5E737AE0"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0015_01C3352E.5E737AE0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

Hi, all

 I have a Linux box with RedHat 9.0 =
installed(eth0:218.xxx.xxx,eth1:192.168.0.1), this box is a =
firewall&proxy. Now I want external user can access my internal web =
server via the firewall box.

According to RedHat 9.0's manual and the posts in internet, I used the =
following command.

#iptables -t nat -A PREROUTING -p TCP -d xxx.xxx.xxx.xxx --dport 80 -j =
DNAT --to 192.168.0.5:80

But I can't access the internal web server from outside.

Use tcpdump to get the following packets:

21:57:18.274817 192.168.0.85.1331 > 218.77.120.200.25460: udp 49
21:57:18.450579 218.77.120.200 > 192.168.0.85: icmp: 218.77.120.200 udp =
port 25460 unreachable [tos 0xc0]
21:57:18.968829 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:18.969963 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455: =
ipx-netbios 50
21:57:19.057680 61.144.148.161.50660 > 192.168.0.5.http: S =
5685372:5685372(0) win 8192 <mss 1452,nop,nop,sackOK> (DF)
21:57:19.718043 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:19.749255 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455: =
ipx-netbios 50
21:57:20.468067 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:20.528584 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455: =
ipx-netbios 50
21:57:22.020715 61.144.148.161.50660 > 192.168.0.5.http: S =
5685372:5685372(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
21:57:23.444576 arp who-has 192.168.0.85 tell 192.168.0.1
21:57:23.444815 arp reply 192.168.0.85 is-at 0:e0:4c:ef:55:f8
21:57:23.533007 218.17.247.6.http > 192.168.0.85.1383: R =
562882410:562882410(0) ack 2793007952 win 0
21:57:24.054574 arp who-has 192.168.0.5 tell 192.168.0.1
21:57:24.054674 arp reply 192.168.0.5 is-at 0:30:48:23:4:33
21:57:27.919595 0.00:30:48:23:04:33.4010 > =
0.ff:ff:ff:ff:ff:ff.452:ipx-sap-resp[|ipx 64]
21:57:28.024632 61.144.148.161.50660 > 192.168.0.5.http: S =
5685372:5685372(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
21:57:29.248044 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:29.248486 192.168.0.100.netbios-dgm > 192.168.0.255.netbios-dgm: =
NBT UDP PACKET(138)
21:57:33.839985 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:34.581878 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:35.332929 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT =
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:40.026871 61.144.148.161.50660 > 192.168.0.5.http: S =
5685372:5685372(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
21:57:43.191397 arp who-has 192.168.0.5 tell 192.168.0.4
21:58:18.987637 arp who-has 192.168.0.5 tell 192.168.0.222=20

As I said, this box is a proxy too, so the above packets maybe contain =
un-useful messages to analysis where the problem is.

Anybody can help me?=20

thanks,

zufeng

------=_NextPart_000_0015_01C3352E.5E737AE0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3Dtext/html;charset=3Dgb2312>
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR></HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hi, all</FONT></DIV>
<DIV><FONT size=3D2><!--StartFragment --><FONT =
size=3D3></FONT></FONT></DIV>
<DIV><FONT size=3D2>&nbsp;<FONT face=3D"verdana, arial, helvetica" =
size=3D2>I have a=20
Linux box with RedHat 9.0 installed(eth0:218.xxx.xxx,eth1:192.168.0.1), =
this box=20
is a firewall&amp;proxy. Now I want external user can access my internal =
web=20
server via the firewall box.<BR><BR>According to RedHat 9.0's manual and =
the=20
posts in internet, I used the following command.<BR><BR>#iptables -t nat =
-A=20
PREROUTING -p TCP -d xxx.xxx.xxx.xxx --dport 80 -j DNAT --to=20
192.168.0.5:80<BR><BR>But I can't access the internal web server from=20
outside.<BR><BR>Use tcpdump to get the following =
packets:<BR><BR>21:57:18.274817=20
192.168.0.85.1331 &gt; 218.77.120.200.25460: udp 49<BR>21:57:18.450579=20
218.77.120.200 &gt; 192.168.0.85: icmp: 218.77.120.200 udp port 25460=20
unreachable [tos 0xc0]<BR>21:57:18.968829 192.168.0.5.netbios-ns &gt;=20
192.168.0.255.netbios-ns: NBT UDP PACKET(137): QUERY; REQUEST;=20
BROADCAST<BR>21:57:18.969963 0.00:30:48:23:04:33.455 &gt;=20
0.ff:ff:ff:ff:ff:ff.455: ipx-netbios 50<BR>21:57:19.057680 =
61.144.148.161.50660=20
&gt; 192.168.0.5.http: S 5685372:5685372(0) win 8192 &lt;mss=20
1452,nop,nop,sackOK&gt; (DF)<BR>21:57:19.718043 192.168.0.5.netbios-ns =
&gt;=20
192.168.0.255.netbios-ns: NBT UDP PACKET(137): QUERY; REQUEST;=20
BROADCAST<BR>21:57:19.749255 0.00:30:48:23:04:33.455 &gt;=20
0.ff:ff:ff:ff:ff:ff.455: ipx-netbios 50<BR>21:57:20.468067=20
192.168.0.5.netbios-ns &gt; 192.168.0.255.netbios-ns: NBT UDP =
PACKET(137):=20
QUERY; REQUEST; BROADCAST<BR>21:57:20.528584 0.00:30:48:23:04:33.455 =
&gt;=20
0.ff:ff:ff:ff:ff:ff.455: ipx-netbios 50<BR>21:57:22.020715 =
61.144.148.161.50660=20
&gt; 192.168.0.5.http: S 5685372:5685372(0) win 8192 &lt;mss=20
1460,nop,nop,sackOK&gt; (DF)<BR>21:57:23.444576 arp who-has 192.168.0.85 =
tell=20
192.168.0.1<BR>21:57:23.444815 arp reply 192.168.0.85 is-at=20
0:e0:4c:ef:55:f8<BR>21:57:23.533007 218.17.247.6.http &gt; =
192.168.0.85.1383: R=20
562882410:562882410(0) ack 2793007952 win 0<BR>21:57:24.054574 arp =
who-has=20
192.168.0.5 tell 192.168.0.1<BR>21:57:24.054674 arp reply 192.168.0.5 =
is-at=20
0:30:48:23:4:33<BR>21:57:27.919595 0.00:30:48:23:04:33.4010 &gt;=20
0.ff:ff:ff:ff:ff:ff.452:ipx-sap-resp[|ipx 64]<BR>21:57:28.024632=20
61.144.148.161.50660 &gt; 192.168.0.5.http: S 5685372:5685372(0) win =
8192=20
&lt;mss 1460,nop,nop,sackOK&gt; (DF)<BR>21:57:29.248044 =
192.168.0.100.netbios-ns=20
&gt; 192.168.0.255.netbios-ns: NBT UDP PACKET(137): QUERY; REQUEST;=20
BROADCAST<BR>21:57:29.248486 192.168.0.100.netbios-dgm &gt;=20
192.168.0.255.netbios-dgm: NBT UDP PACKET(138)<BR>21:57:33.839985=20
192.168.0.100.netbios-ns &gt; 192.168.0.255.netbios-ns: NBT UDP =
PACKET(137):=20
QUERY; REQUEST; BROADCAST<BR>21:57:34.581878 192.168.0.100.netbios-ns =
&gt;=20
192.168.0.255.netbios-ns: NBT UDP PACKET(137): QUERY; REQUEST;=20
BROADCAST<BR>21:57:35.332929 192.168.0.100.netbios-ns &gt;=20
192.168.0.255.netbios-ns: NBT UDP PACKET(137): QUERY; REQUEST;=20
BROADCAST<BR>21:57:40.026871 61.144.148.161.50660 &gt; 192.168.0.5.http: =
S=20
5685372:5685372(0) win 8192 &lt;mss 1460,nop,nop,sackOK&gt;=20
(DF)<BR>21:57:43.191397 arp who-has 192.168.0.5 tell=20
192.168.0.4<BR>21:58:18.987637 arp who-has 192.168.0.5 tell =
192.168.0.222=20
<BR><BR>As I said, this box is a proxy too, so the above packets maybe =
contain=20
un-useful messages to analysis where the problem is.<BR><BR>Anybody can =
help me?=20
<BR></FONT></FONT></DIV>
<DIV><FONT size=3D2>thanks,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>zufeng</FONT></DIV></BODY></HTML>

------=_NextPart_000_0015_01C3352E.5E737AE0--




