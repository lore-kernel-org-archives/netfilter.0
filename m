From: Anssi Hannula <anssi.hannula@gmail.com>
Subject: Messages in log with SNAT target
Date: Mon, 24 Jul 2006 12:17:47 +0300
Message-ID: <44C4903B.3080004@gmail.com>
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

Hi!

I've been using this kind of configuration on my Linux router for a few
years:

eth0	80.223.77.223, public internet ip
eth0:0	10.0.0.1, private network ip

IP forwarding enabled.

And a rule for iptables:
-A POSTROUTING -s 10.0.0.0/255.255.255.0 -d ! 10.0.0.0/255.255.255.0 -j
SNAT --to-source 80.223.77.223

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
10.0.0.0        0.0.0.0         255.255.255.0   U     10     0        0 eth0
80.223.64.0     0.0.0.0         255.255.240.0   U     10     0        0 eth0
0.0.0.0         80.223.64.1     0.0.0.0         UG    10     0        0 eth0


However, I get lots of this kind of messages in the dmesg while routing:
host 10.0.0.4/if2 ignores redirects for 70.35.xxx.xxx to 80.223.64.1.
host 10.0.0.4/if2 ignores redirects for 68.219.xxx.xxx to 80.223.64.1.
host 10.0.0.4/if2 ignores redirects for 193.88.xxx.xxx to 80.223.64.1.
host 10.0.0.4/if2 ignores redirects for 80.81.xxx.xxx to 80.223.64.1.
host 10.0.0.4/if2 ignores redirects for 80.81.xxx.xxx to 80.223.64.1.

10.0.0.4 is a Windows machine in the private network set to use 10.0.0.1
(router) as a gateway. 80.223.64.1 is the ISP gateway. The third ip
number in the log message is the ip number of a server, to which the
10.0.0.4 is connected.

Note that the routing itself works just fine, there is just this log
message flood.

Please advise.

-- 
Anssi Hannula


