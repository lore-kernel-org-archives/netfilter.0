From: "Julian Stefanov" <hackdevil@hotmail.com>
Subject: Problem with MSN Messenger Voice Chat and ICQ Voice Chat
Date: Thu, 12 Feb 2004 17:15:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law10-F85DHigByeTp800026799@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

<html><div style='background-color:'><DIV class=RTE>Problem with MSN Messenger Voice Chat and ICQ Voice Chat.</DIV>
<DIV class=RTE><BR>My situation is:<BR>_____&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ____&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_______________________<BR>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;|in eth0 (RealIP)|&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>|&nbsp;ISP&nbsp;|--&gt;|&nbsp;&nbsp;&nbsp; Slackware&nbsp;&nbsp;&nbsp;&nbsp;|--&gt;| HUB|--&gt;|&nbsp;LOCAL AREA (6 Computers)|<BR>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; |
 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10.0.0.2 - 10.0.0.7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<BR>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; |out eth1 (Local)|&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; 10.0.0.1&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb
 sp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<BR>-------- &nbsp;&nbsp;&nbsp; -----------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;------------------------------------------</DIV>
<DIV class=RTE>My ISP give me 13 Real-IPs. 1st Real-IP (80.xxx.xxx.xx1) is on the eth0 adapter on Linux Slackware machine. All other Real-IPs are on the virtual eth0:1, eth0:2, eth0:3 etc.<BR>eth1 is my other adapter with first local IP.<BR>I uses iptables to make the nat for Local Area.<BR>My iptables are:</DIV>
<DIV class=RTE>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.2 -o eth0 -j SNAT --to 80.xxx.xxx.xx2<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.3 -o eth0 -j SNAT --to 80.xxx.xxx.xx3<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.4 -o eth0 -j SNAT --to 80.xxx.xxx.xx4<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.5 -o eth0 -j SNAT --to 80.xxx.xxx.xx5<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.6 -o eth0 -j SNAT --to 80.xxx.xxx.xx6<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.7 -o eth0 -j SNAT --to 80.xxx.xxx.xx7<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.8 -o eth0 -j SNAT --to 80.xxx.xxx.xx8<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.9 -o eth0 -j SNAT --to 80.xxx.xxx.xx9<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.10 -o eth0 -j SNAT --to 80.xxx.xxx.x10<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.11 -o
  eth0 -j SNAT --to 80.xxx.xxx.x11<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.12 -o eth0 -j SNAT --to 80.xxx.xxx.x12<BR>/usr/sbin/iptables -t nat -A POSTROUTING -s 10.0.0.13 -o eth0 -j SNAT --to 80.xxx.xxx.x13</DIV>
<DIV class=RTE>All of this working fine, but I can't establish Voice connection with MSN Messenger and ICQ.<BR>Local Area computers working with WindowsXP Pro. They uses my Linux machine for Gateway and DNS Server.<BR>I can make voice connection with MSN Messenger only on my local area. For example 10.0.0.2 MSN Messenger Voice Chat to 10.0.0.5 MSN Messenger Voice Chat.<BR>Thank you in advance.<BR>Julian</DIV></div><br clear=all><hr>MSN 8 helps <a href="http://g.msn.com/8HMAEN/2752??PS=">ELIMINATE E-MAIL VIRUSES.</a> Get 2 months FREE*.</html>

