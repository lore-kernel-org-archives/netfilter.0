From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Proxy arping
Date: Thu, 3 May 2007 20:12:14 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705031948400.18504@yvahk01.tjqt.qr>
References: <4BE2588D-6B2F-4D89-A5DC-149A048545D6@paglayan.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4BE2588D-6B2F-4D89-A5DC-149A048545D6@paglayan.com>
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
To: Andres Paglayan <andres@paglayan.com>
Cc: netfilter@lists.netfilter.org


On May 3 2007 10:44, Andres Paglayan wrote:
>
> Hi,
>
> how can I  properly set proxy arping in a one to one mapped nat?
>
> I have a router with 192.168.1.0 in one side (our lan eth0) and
> 192.168.50.0 in the other (other lan eth2), plus an internet
> gateway (eth3)
>
> this is the routing table
>
> root@ipcop:~/scripts # route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 192.168.50.0    *               255.255.255.0   U     0      0        0 eth2
> 192.168.2.0     *               255.255.255.0   U     0      0        0 eth1
> 192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
> 65.19.28.0      *               255.255.255.0   U     0      0        0 eth3
> 172.22.0.0      *               255.255.254.0   U     0      0        0 eth2
> 172.16.2.0      *               255.255.254.0   U     0      0        0 eth2
> 172.16.0.0      *               255.255.254.0   U     0      0        0 eth2
> default         65.19.28.1      0.0.0.0         UG    0      0        0 eth3
>
>
> at the 50.0 side, I am routing traffic to other subnets as well, ie
> 172.16.2.0/23
>
> For the applications we are running, instead of regular natting,
> I am using NETMAP target of iptables,
> which instead of making the packets as going out from 192.168.50.1
> they are mapped to addresses at 50.0/24
> i.e. when packet goes from 192.168.1.5 to 172.16.2.34 trasversing the
> 192.168.50.1 device
> the router mangles it an makes it appear as going out from 192.168.50.5 and
> then translates back
>
> everything goes fabulous, but I am having a problem with arping,
> arp questions addressed to 192.168.50.0/24 are not reaching my router's device,
>
> I have been reading and experimenting with this a bunch,
> echo 1 > /proc/sys/net/ipv4/conf/eth2/proxy_arp (an to eth0)
> on the proper device is set, but still not proxy arping,
>
>
> is there anybody with experience on this proxy arp issue?

If you can't get arpd running, try arp faking:

  brctl addbr br0;
  brctl addif br0 eth0 eth2;
  ebtables -t broute -P BROUTING DROP;
  ebtables -t broute -p arp --arp-opcode request -j ACCEPT;
  ebtables -t nat -A PREROUTING -i eth0 -p arp --arp-opcode request \
    -j arpreply --arpreply-mac `cat /sys/class/net/eth0/address` \
    --arpreply-target DROP;
  # repeat last command for eth2

Assume now that 192.168.1.5 contacts 172.16.2.34, it will send out
"arp who-has 172.16.2.34". The router will then reply "arp
172.16.2.34 is at AA:BB:CC:DD:EE:FF" -- however the MAC address
reported back to .1.5 not the one of .2.34, but the one of the eth0
card. This makes sure that packets for .2.34 do actually get routed
to the router. The router then asks for .2.34 itself (arp replies
by ebtables do NOT end up in the arp cache, thankfully) and should
forward it.

BTW, why would you need NETMAP?


Jan
-- 

