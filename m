From: "G.Laxman" <laxman@oxynetworks.com>
Subject: Port Forwarding........Help
Date: Wed, 24 Dec 2003 15:52:10 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.1.1.0.20031224155135.01e96760@mail.oxynetworks.com>
Mime-Version: 1.0
Content-Type: text/html; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

<html>
<body>
Hi,<br><br>
I have configured IP Tables 1.2.6 on RH Linux 8.0. Working
nice.....<br><br>
<br>
I have local system which is running Apache WebServer on Solaris... its
ip Address is 192.168.1.10<br>
I have configured DNS and Gateway for this system.....From This system I
can connect to the Internet ( Ping,nslookup,ssh..etc)<br><br>
My problem is......<br><br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>eth1
</b><x-tab>&nbsp;&nbsp;</x-tab>&nbsp;&nbsp; ||Linux Firewall||
<b>eth0-</b>-------------------------&gt;&nbsp; ||solaris machine (<b>web
server</b>)||<br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>(<b>61.11.10.11</b>)<x-tab>&nbsp;&nbsp;&nbsp;</x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
(<b>192.168.1.1</b>)<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>&nbsp;&nbsp;
( <b>192.168.1.10</b>)<br><br>
<br>
Here I have one more public IP . ..ie. <b>61.11.10.12</b>.. I need to map
this IP&nbsp; <b>61.11.10.12</b> to <b>192.168.1.10<br>
</b>and I want to allow only <b>80 </b>port of 192.168.1.10
machine....... (Only web request)<br><br>
I have tried the following command........but not working......<br><br>
<font face="Book Antiqua, Bookman">iptables -t nat -A PREROUTING -p tcp
--dport 80 -i eth1 -s 0.0.0.0/0 -d 61.11.10.12 -j DNAT --to
192.168.1.10:80<br><br>
<br>
</font>Please help me......<br><br>
bye<br>
Laxman<br><br>
<br>
</body>
</html>


