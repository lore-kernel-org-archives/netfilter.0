From: =?iso-8859-1?Q?Bernhard_Wellh=F6fer?= <bernd.wellhoefer@email.de>
Subject: Routing port 80 to 8080 for one of two IPs
Date: Fri, 7 Apr 2006 16:39:43 +0200
Message-ID: <003501c65a51$1c709970$73ffa8c0@gaiagroup.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
 
my Linux machine has one physical interface eth0 and additionally one
logically interface eth0:1 :
 
$ ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:50:BA:EE:B4:35
          inet addr:192.168.255.25  Bcast:192.168.255.255 Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:34819 errors:0 dropped:0 overruns:0 frame:0
          TX packets:33864 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:5948119 (5.6 MiB)  TX bytes:3104279 (2.9 MiB)
          Interrupt:10 Base address:0xb400
 
eth0:1    Link encap:Ethernet  HWaddr 00:50:BA:EE:B4:35
          inet addr:192.168.255.81  Bcast:192.168.255.255 Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:10 Base address:0xb400

 
I have a Java program serving as web server that binds itself to port 8080
for the logically interface eth0:1 - since I do not want to start the Java
web server as root. Therefore I want to add a right iptables rule to
redirect port 80 to port 8080 for eth0:1. It is important that port 80 for
eth0 is not redirected.

What is the correct rule here? I tried

/sbin/iptables -t nat -I PREROUTING -p tcp --dst 192.168.255.81 --dport 80
-j REDIRECT --to-port 8080

and

/sbin/iptables -t nat -I PREROUTING -p tcp -i eth0:1  --dport 80 -j REDIRECT
--to-port 8080 (results in a warning)

but without success.

Who can help me here?

Thanks in advance,

Bernd





