From: info <info@novelgmt.intnet.mu>
Subject: Help on IPTABLES
Date: Thu, 09 Oct 2003 16:20:02 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F855272.2080201@novelgmt.intnet.mu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------000000080202080701010709"
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


--------------000000080202080701010709
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi all,

 Can somebody explain to me why is when i changed my Chain INPUT Rules 
from ACCEPT to DROP, i cannot browse the internet despite opening port 
80 in the INPUT rule.
However, when Chain INPUT is changed to ACCEPT, browsing the internet 
works fine. (Note: CHAIN Output is accept for ALL)


The configurations on my IPTABLES are as follows

_*Chain INPUT (policy DROP)*_
target     prot opt source               destination
RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:http
ACCEPT     udp  --  anywhere             anywhere           udp spt:http

Note that my OUTPUT Rules are as follows:

_*Chain OUTPUT (policy ACCEPT)*_
target     prot opt source               destination

I have two network cards installed on my pc - running Red Hat 9.0

Routing for static routes are follows:

xx.yy.zz.aa        0.0.0.0         255.255.255.0       U     0      
0        0 eth0
xx.0.0.0           0.0.0.0         255.0.0.0           U     0      
0        0 eth1
127.0.0.0          0.0.0.0         255.0.0.0           U     0      
0        0 lo
0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      
0        0 eth0
0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0      
0        0 eth1

where zz.zz.zz.zz is my gateway to the internet.
eth0 - Interface with local address
eth1 - Interface with Internet address.

By the way, is there a way to save static routes because when i reboot 
my pc, all routes are lost.

Thanks for any help.

guy



--------------000000080202080701010709
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
hi all,<br>
<br>
&nbsp;Can somebody explain to me why is when i changed my Chain INPUT Rules
from ACCEPT to DROP, i cannot browse the internet despite opening port
80 in the INPUT rule.<br>
However, when Chain INPUT is changed to ACCEPT, browsing the internet
works fine. (Note: CHAIN Output is accept for ALL)<br>
<br>
<br>
The configurations on my IPTABLES are as follows<br>
<br>
<font color="#ff6600"><u><b>Chain INPUT (policy DROP)</b></u></font><br>
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; destination<br>
RH-Lokkit-0-50-INPUT&nbsp; all&nbsp; --&nbsp; anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; anywhere<br>
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp spt:http<br>
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; udp&nbsp; --&nbsp; anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udp spt:http<br>
<br>
Note that my OUTPUT Rules are as follows:<br>
<font color="#ff6600"><br>
<u><b>Chain OUTPUT (policy ACCEPT)</b></u></font><br>
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; destination<br>
<br>
I have two network cards installed on my pc - running Red Hat 9.0<br>
<br>
Routing for static routes are follows:<br>
<br>
<font face="Courier New, Courier, monospace">xx.yy.zz.aa &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0<br>
xx.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1<br>
127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 lo<br>
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; zz.zz.zz.zz &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0<br>
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; zz.zz.zz.zz &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</font><br>
<br>
where zz.zz.zz.zz is my gateway to the internet.<br>
eth0 - Interface with local address<br>
eth1 - Interface with Internet address.<br>
<br>
By the way, is there a way to save static routes because when i reboot
my pc, all routes are lost.<br>
<br>
Thanks for any help.<br>
<br>
guy<br>
<br>
<br>
</body>
</html>

--------------000000080202080701010709--


