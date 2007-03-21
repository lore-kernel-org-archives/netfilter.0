From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: bridged firewall wont DNAT http to proxy
Date: Wed, 21 Mar 2007 23:08:12 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703212306180.486@yvahk01.tjqt.qr>
References: <002801c76bfc$b68971e0$6701a8c0@vaio>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002801c76bfc$b68971e0$6701a8c0@vaio>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Meechan <rico@rm83.co.uk>
Cc: netfilter@lists.netfilter.org


On Mar 21 2007 21:05, Ricardo Meechan wrote:
>Subject: bridged firewall wont DNAT http to proxy
          ^^^^^^^               ^^^^

I can already see your problem in the subject. Having a bridge bypasses Layer3,
don't you know?

>I want all http 80 traffic that is about to leave the network (entering the 
>bridged router) to redirect into another server running squid.
>
>The problem is the routing of data.
>
>I have tried many options but to no avail.
>
>I added the following rule to the nat prerouting using only one of the 
>servers as a source for testing.:
>
>-A PREROUTING -p tcp -s 194.72.xxx.xxx --dport 80 -j DNAT --to-destination 
>192.168.x.x:80

ebtables -t broute -A BROUTING -d 194.72.xxx.xxx --sport 80 -j DROP

>
>But nothing happens. I tried the destination address as a 194.72 but it also
>
>didnt work.
>
>Routes are all working and the servers/squid/bridge (has a local ip on br0) 
>can talk to each other ok. ipv4 forwarding is enabled.
>
>
>
>I probably haven't been detailed enough but if anyone has any solutions or 
>require more info then I would really really appreciate your help!
>
>
>Many thanks in advance!
>
>rico.
>
># uname -r
>2.6.19-1.2911.6.5.fc6
>
>
>[root@xxxxxxx~]# ifconfig
>br0       Link encap:Ethernet  HWaddr 00:02:B3:B4:60:20
>          inet6 addr: fe80::202:b3ff:feb4:6020/64 Scope:Link
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>          RX packets:26881 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:10798 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:0
>          RX bytes:1813830 (1.7 MiB)  TX bytes:2222767 (2.1 MiB)
>
>br0:0     Link encap:Ethernet  HWaddr 00:02:B3:B4:60:20
>          inet addr:192.168.xxx.xxx  Bcast:192.168.1.255  Mask:255.255.255.0
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>
>br0:1     Link encap:Ethernet  HWaddr 00:02:B3:B4:60:20
>          inet addr:194.72.xxx.xxx  Bcast:194.72.111.191 
>Mask:255.255.255.240
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>
>eth0      Link encap:Ethernet  HWaddr 00:02:B3:B4:60:20
>          inet6 addr: fe80::202:b3ff:feb4:6020/64 Scope:Link
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>          RX packets:141519 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:139218 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:1176 txqueuelen:1000
>          RX bytes:21761332 (20.7 MiB)  TX bytes:111661372 (106.4 MiB)
>
>eth1      Link encap:Ethernet  HWaddr 00:02:B3:B4:60:21
>          inet6 addr: fe80::202:b3ff:feb4:6021/64 Scope:Link
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>          RX packets:157758 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:143081 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:1000
>          RX bytes:112414496 (107.2 MiB)  TX bytes:21491683 (20.4 MiB)
>
>lo        Link encap:Local Loopback
>          inet addr:127.0.0.1  Mask:255.0.0.0
>          inet6 addr: ::1/128 Scope:Host
>          UP LOOPBACK RUNNING  MTU:16436  Metric:1
>          RX packets:50 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:50 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:0
>          RX bytes:4510 (4.4 KiB)  TX bytes:4510 (4.4 KiB)
>
>iptables:
>
>
>
>
>
>
>
>

Jan
-- 

