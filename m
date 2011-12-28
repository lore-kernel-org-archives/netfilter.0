From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: can't set default route for virtual interface
Date: Wed, 28 Dec 2011 11:40:05 +1100
Message-ID: <4EFA6565.7050808@standarduniversal.com.au>
References: <op.v654qjz3x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v654qjz3x1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

table T1 needs this first?

ip route add 192.168.2.0/24 dev eth0.3 src 192.168.2.10 table T1




On 28/12/2011 10:32 AM, Lloyd Standish wrote:
> Hi All,
>
> I'm setting up multiple virtual interfaces to allow load-balancing 
> over several uplinks using a single NIC, on Debian Squeeze.  Packets 
> will be marked by iptables, and sent to the proper routing tables via 
> "ip rule add fwmark <n>".
>
> I'm having trouble setting routes for the VLANs.
>
> root@debiandesk2:/etc/network# ifconfig
>
> 192.168.100.255  Mask:255.255.255.0
>            inet6 addr: fe80::22cf:30ff:fed8:6bea/64 Scope:Link
>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>            RX packets:49654 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:54712 errors:0 dropped:0 overruns:0 carrier:0
>            collisions:0 txqueuelen:1000
>            RX bytes:35989170 (34.3 MiB)  TX bytes:8795113 (8.3 MiB)
>            Interrupt:27 Base address:0xc000
>
> eth1      Link encap:Ethernet  HWaddr 00:08:54:dc:1b:79
>            inet addr:192.168.10.1  Bcast:192.168.10.255  
> Mask:255.255.255.0
>            inet6 addr: fe80::208:54ff:fedc:1b79/64 Scope:Link
>            UP BROADCAST MULTICAST  MTU:1500  Metric:1
>            RX packets:6077 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:9451 errors:0 dropped:0 overruns:0 carrier:73
>            collisions:0 txqueuelen:1000
>            RX bytes:821439 (802.1 KiB)  TX bytes:9756873 (9.3 MiB)
>            Interrupt:19 Base address:0xdc00
>
> eth0.2    Link encap:Ethernet  HWaddr 20:cf:30:d8:6b:ea
>            inet addr:192.168.200.10  Bcast:192.168.200.255  
> Mask:255.255.255.0
>            inet6 addr: fe80::22cf:30ff:fed8:6bea/64 Scope:Link
>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>            RX packets:17776 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:15037 errors:0 dropped:1 overruns:0 carrier:0
>            collisions:0 txqueuelen:0
>            RX bytes:16258598 (15.5 MiB)  TX bytes:2075870 (1.9 MiB)
>
> eth0.3    Link encap:Ethernet  HWaddr 20:cf:30:d8:6b:ea
>            inet addr:192.168.2.10  Bcast:192.168.2.255  
> Mask:255.255.255.0
>            inet6 addr: fe80::22cf:30ff:fed8:6bea/64 Scope:Link
>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>            RX packets:1083 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:1320 errors:0 dropped:0 overruns:0 carrier:0
>            collisions:0 txqueuelen:0
>            RX bytes:113499 (110.8 KiB)  TX bytes:273602 (267.1 KiB)
>
> My firewall/load-balancing script is able to set the routes for the 
> first virtual interface (eth0.2) OK:
>
> + ip route flush table T0
> + ip route add 192.168.200.0/24 dev eth0.2 src 192.168.200.10 table T0
> + ip rule add from 192.168.200.10 table T0
> + ip rule add iif lo to 201.200.105.6 table T0
> + ip route add 192.168.10.0/24 dev eth1 table T0
> + ip route add 127.0.0.0/8 dev lo table T0
> + ip rule del from all fwmark 0
> + ip rule add fwmark 0 table T0
> + ip route add 192.168.200.0/24 dev eth0.2 src 192.168.200.10
> + ip route add default via 192.168.200.1 table T0
>
> However, it fails as follows when adding the default route for the 
> second virtual interface (eth0.3):
>
> + ip route flush table T1
> + ip route add 192.168.2.0/24 dev eth0.3 src 192.168.2.10 table T1
> + ip rule add from 192.168.2.10 table T1
> + ip rule add iif lo to 8.8.4.4 table T1
> + ip route add 192.168.10.0/24 dev eth1 table T1
> + ip route add 127.0.0.0/8 dev lo table T1
> + ip rule del from all fwmark 1
> + ip rule add fwmark 1 table T1
> + ip route add 192.168.2.0/24 dev eth0.3 src 192.168.2.10
> + ip route add default via 192.168.2.1 table T1
> RTNETLINK answers: No such process
>
> Similarly, I was unable to use "ip" to set a "nexthop via" default 
> route for virtual interfaces.
>
> I'd greatly appreciate any help.
>
> Regards,
> Lloyd
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

