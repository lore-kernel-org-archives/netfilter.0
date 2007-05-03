From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Proxy arping
Date: Thu, 03 May 2007 21:31:41 +0200
Message-ID: <463A389D.8050206@rtij.nl>
References: <4BE2588D-6B2F-4D89-A5DC-149A048545D6@paglayan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andres Paglayan <andres@paglayan.com>
Cc: netfilter@lists.netfilter.org

Andres Paglayan wrote:
> Hi,
>
> how can I  properly set proxy arping in a one to one mapped nat?
>
> I have a router with 192.168.1.0 in one side (our lan eth0) and 
> 192.168.50.0 in the other (other lan eth2),
> plus an internet gateway (eth3)
>
> this is the routing table
>
> root@ipcop:~/scripts # route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    
> Use Iface
> 192.168.50.0    *               255.255.255.0   U     0      0        
> 0 eth2
> 192.168.2.0     *               255.255.255.0   U     0      0        
> 0 eth1
> 192.168.1.0     *               255.255.255.0   U     0      0        
> 0 eth0
> 65.19.28.0      *               255.255.255.0   U     0      0        
> 0 eth3
> 172.22.0.0      *               255.255.254.0   U     0      0        
> 0 eth2
> 172.16.2.0      *               255.255.254.0   U     0      0        
> 0 eth2
> 172.16.0.0      *               255.255.254.0   U     0      0        
> 0 eth2
> default         65.19.28.1      0.0.0.0         UG    0      0        
> 0 eth3
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
> the router mangles it an makes it appear as going out from 
> 192.168.50.5 and then translates back
>
> everything goes fabulous, but I am having a problem with arping,
> arp questions addressed to 192.168.50.0/24 are not reaching my 
> router's device,
>
> I have been reading and experimenting with this a bunch,
> echo 1 > /proc/sys/net/ipv4/conf/eth2/proxy_arp (an to eth0)
> on the proper device is set, but still not proxy arping,
>
>
> is there anybody with experience on this proxy arp issue?

The usual way is to add static arp entries.

# (untested code)
for i in `seq 2 254` do
    arp -Ds 192.168.50.$i eth2 pub
done

HTH,
M4


