From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: nftables NAT
Date: Mon, 04 Aug 2014 09:54:02 +0530
Message-ID: <53DF0AE2.5080202@atc.tcs.com>
References: <CAFnufp1kVrtPXm45VRYZK9G+oHBS0Uy9S_sfYzSmapSB5SdR0w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFnufp1kVrtPXm45VRYZK9G+oHBS0Uy9S_sfYzSmapSB5SdR0w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matteo Croce <technoboy85@gmail.com>
Cc: netfilter@vger.kernel.org

On 08/03/2014 04:05 PM, Matteo Croce wrote:
> Hi,
>
> I'm trying to setup a NAT on my router with nftables, my LAN is wlan0
> with address 192.168.20.1 and a the LAN is eth0 with address
> 192.168.1.7, ip forwarding is enabled:
>
> [~]# ifconfig eth0
> eth0      Link encap:Ethernet  HWaddr 00:0d:b9:34:2b:e8
>            inet addr:192.168.1.7  Bcast:192.168.1.255  Mask:255.255.255.0
>            inet6 addr: fe80::20d:b9ff:fe34:2be8/64 Scope:Link
>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>            RX packets:353 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:305 errors:0 dropped:0 overruns:0 carrier:0
>            collisions:0 txqueuelen:1000
>            RX bytes:39409 (38.4 KiB)  TX bytes:39077 (38.1 KiB)
>
> [~]# ifconfig wlan0
> wlan0     Link encap:Ethernet  HWaddr 04:f0:21:0c:a3:7d
>            inet addr:192.168.20.1  Bcast:192.168.20.255  Mask:255.255.255.0
>            inet6 addr: fe80::6f0:21ff:fe0c:a37d/64 Scope:Link
>            UP BROADCAST RUNNING MULTICAST  MTU:1612  Metric:1
>            RX packets:475 errors:0 dropped:0 overruns:0 frame:0
>            TX packets:232 errors:0 dropped:0 overruns:0 carrier:0
>            collisions:0 txqueuelen:1000
>            RX bytes:48202 (47.0 KiB)  TX bytes:41345 (40.3 KiB)
>
> [~]# route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 0.0.0.0         192.168.1.1     0.0.0.0         UG    0      0        0 eth0
> 192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
> 192.168.20.0    0.0.0.0         255.255.255.0   U     0      0        0 wlan0
> [~]# cat /proc/sys/net/ipv4/ip_forward
> 1
>
> I've setup nftables like this:
>
> [~]# nft -n list table nat
> table ip nat {
>          chain postrouting {
>                   type nat hook postrouting priority 0;
>                   ip saddr 192.168.20.0/24 oif eth0 snat 192.168.1.7
>          }
> }
>
> It correctly forwards the packet with the new address, but doesn't
> send the replies back:
>
> [~]# tcpdump -pni wlan0 icmp
> IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 11, length 64
> IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 12, length 64
> IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 13, length 64
> [~]# tcpdump -pni eth0 icmp
> IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 21, length 64
> IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 21, length 64
> IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 22, length 64
> IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 22, length 64
> IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 23, length 64
> IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 23, length 64
>
> I can't see any problem in the configuration, any hint?

Just a thought.. Are you accepting packets in the FORWARD chain in both 
directions (eth0 -> wlan0, wlan0 -> eth0)?

Vignesh
