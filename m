From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Problem iptables DNAT.
Date: Tue, 17 Jun 2003 10:00:24 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E34E3@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C334F1.F19083B7"
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
To: zufeng huang <zufeng@hotpop.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C334F1.F19083B7
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If your firewall drops packets by default, you will have to add:

=20

iptables -A FORWARD -destination 192.168.0.5 -p tcp -dport 80 -j ACCEPT

=20

-----Original Message-----
From: zufeng huang [mailto:zufeng@hotpop.com]=20
Sent: Tuesday, June 17, 2003 9:13 AM
To: netfilter@lists.netfilter.org
Subject: Problem iptables DNAT.

=20

Hi, all

 I have a Linux box with RedHat 9.0
installed(eth0:218.xxx.xxx,eth1:192.168.0.1), this box is a
firewall&proxy. Now I want external user can access my internal web
server via the firewall box.

According to RedHat 9.0's manual and the posts in internet, I used the
following command.

#iptables -t nat -A PREROUTING -p TCP -d xxx.xxx.xxx.xxx --dport 80 -j
DNAT --to 192.168.0.5:80

But I can't access the internal web server from outside.

Use tcpdump to get the following packets:

21:57:18.274817 192.168.0.85.1331 > 218.77.120.200.25460: udp 49
21:57:18.450579 218.77.120.200 > 192.168.0.85: icmp: 218.77.120.200 udp
port 25460 unreachable [tos 0xc0]
21:57:18.968829 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:18.969963 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455:
ipx-netbios 50
21:57:19.057680 61.144.148.161.50660 > 192.168.0.5.http: S
5685372:5685372(0) win 8192 <mss 1452,nop,nop,sackOK> (DF)
21:57:19.718043 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:19.749255 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455:
ipx-netbios 50
21:57:20.468067 192.168.0.5.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:20.528584 0.00:30:48:23:04:33.455 > 0.ff:ff:ff:ff:ff:ff.455:
ipx-netbios 50
21:57:22.020715 61.144.148.161.50660 > 192.168.0.5.http: S
5685372:5685372(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
21:57:23.444576 arp who-has 192.168.0.85 tell 192.168.0.1
21:57:23.444815 arp reply 192.168.0.85 is-at 0:e0:4c:ef:55:f8
21:57:23.533007 218.17.247.6.http > 192.168.0.85.1383: R
562882410:562882410(0) ack 2793007952 win 0
21:57:24.054574 arp who-has 192.168.0.5 tell 192.168.0.1
21:57:24.054674 arp reply 192.168.0.5 is-at 0:30:48:23:4:33
21:57:27.919595 0.00:30:48:23:04:33.4010 >
0.ff:ff:ff:ff:ff:ff.452:ipx-sap-resp[|ipx 64]
21:57:28.024632 61.144.148.161.50660 > 192.168.0.5.http: S
5685372:5685372(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
21:57:29.248044 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:29.248486 192.168.0.100.netbios-dgm > 192.168.0.255.netbios-dgm:
NBT UDP PACKET(138)
21:57:33.839985 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:34.581878 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:35.332929 192.168.0.100.netbios-ns > 192.168.0.255.netbios-ns: NBT
UDP PACKET(137): QUERY; REQUEST; BROADCAST
21:57:40.026871 61.144.148.161.50660 > 192.168.0.5.http: S
5685372:5685372(0) win 8192 <mss 1460,nop,nop,sackOK> (DF)
21:57:43.191397 arp who-has 192.168.0.5 tell 192.168.0.4
21:58:18.987637 arp who-has 192.168.0.5 tell 192.168.0.222=20

As I said, this box is a proxy too, so the above packets maybe contain
un-useful messages to analysis where the problem is.

Anybody can help me?=20

thanks,

=20

zufeng


------_=_NextPart_001_01C334F1.F19083B7
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@SimSun";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body bgcolor=3Dwhite lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>If your firewall drops packets by =
default,
you will have to add:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>iptables &#8211;A FORWARD =
&#8211;destination 192.168.0.5
&#8211;p tcp &#8211;dport 80 &#8211;j ACCEPT</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> zufeng huang
[mailto:zufeng@hotpop.com] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Tuesday, June 17, =
2003 9:13
AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Problem iptables =
DNAT.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3DSimSun><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DSimSun><span
style=3D'font-size:10.0pt'>Hi, all</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Times New Roman"><!--StartFragment --><span
style=3D'font-size:10.0pt;font-family:"Times New =
Roman"'>&nbsp;</span></font><font
size=3D2 face=3DVerdana><span =
style=3D'font-size:10.0pt;font-family:Verdana'>I have a
Linux box with RedHat 9.0 installed(eth0:218.xxx.xxx,eth1:192.168.0.1), =
this
box is a firewall&amp;proxy. Now I want external user can access my =
internal
web server via the firewall box.<br>
<br>
According to RedHat 9.0's manual and the posts in internet, I used the
following command.<br>
<br>
#iptables -t nat -A PREROUTING -p TCP -d xxx.xxx.xxx.xxx --dport 80 -j =
DNAT
--to 192.168.0.5:80<br>
<br>
But I can't access the internal web server from outside.<br>
<br>
Use tcpdump to get the following packets:<br>
<br>
21:57:18.274817 192.168.0.85.1331 &gt; 218.77.120.200.25460: udp 49<br>
21:57:18.450579 218.77.120.200 &gt; 192.168.0.85: icmp: 218.77.120.200 =
udp port
25460 unreachable [tos 0xc0]<br>
21:57:18.968829 192.168.0.5.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:18.969963 0.00:30:48:23:04:33.455 &gt; 0.ff:ff:ff:ff:ff:ff.455:
ipx-netbios 50<br>
21:57:19.057680 61.144.148.161.50660 &gt; 192.168.0.5.http: S
5685372:5685372(0) win 8192 &lt;mss 1452,nop,nop,sackOK&gt; (DF)<br>
21:57:19.718043 192.168.0.5.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:19.749255 0.00:30:48:23:04:33.455 &gt; 0.ff:ff:ff:ff:ff:ff.455:
ipx-netbios 50<br>
21:57:20.468067 192.168.0.5.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:20.528584 0.00:30:48:23:04:33.455 &gt; 0.ff:ff:ff:ff:ff:ff.455:
ipx-netbios 50<br>
21:57:22.020715 61.144.148.161.50660 &gt; 192.168.0.5.http: S
5685372:5685372(0) win 8192 &lt;mss 1460,nop,nop,sackOK&gt; (DF)<br>
21:57:23.444576 arp who-has 192.168.0.85 tell 192.168.0.1<br>
21:57:23.444815 arp reply 192.168.0.85 is-at 0:e0:4c:ef:55:f8<br>
21:57:23.533007 218.17.247.6.http &gt; 192.168.0.85.1383: R
562882410:562882410(0) ack 2793007952 win 0<br>
21:57:24.054574 arp who-has 192.168.0.5 tell 192.168.0.1<br>
21:57:24.054674 arp reply 192.168.0.5 is-at 0:30:48:23:4:33<br>
21:57:27.919595 0.00:30:48:23:04:33.4010 &gt;
0.ff:ff:ff:ff:ff:ff.452:ipx-sap-resp[|ipx 64]<br>
21:57:28.024632 61.144.148.161.50660 &gt; 192.168.0.5.http: S
5685372:5685372(0) win 8192 &lt;mss 1460,nop,nop,sackOK&gt; (DF)<br>
21:57:29.248044 192.168.0.100.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:29.248486 192.168.0.100.netbios-dgm &gt; =
192.168.0.255.netbios-dgm: NBT UDP
PACKET(138)<br>
21:57:33.839985 192.168.0.100.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:34.581878 192.168.0.100.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:35.332929 192.168.0.100.netbios-ns &gt; 192.168.0.255.netbios-ns: =
NBT UDP
PACKET(137): QUERY; REQUEST; BROADCAST<br>
21:57:40.026871 61.144.148.161.50660 &gt; 192.168.0.5.http: S
5685372:5685372(0) win 8192 &lt;mss 1460,nop,nop,sackOK&gt; (DF)<br>
21:57:43.191397 arp who-has 192.168.0.5 tell 192.168.0.4<br>
21:58:18.987637 arp who-has 192.168.0.5 tell 192.168.0.222 <br>
<br>
As I said, this box is a proxy too, so the above packets maybe contain
un-useful messages to analysis where the problem is.<br>
<br>
Anybody can help me? </span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DSimSun><span
style=3D'font-size:10.0pt'>thanks,</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt;font-family:"Times New =
Roman"'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DSimSun><span
style=3D'font-size:10.0pt'>zufeng</span></font></p>

</div>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C334F1.F19083B7--

