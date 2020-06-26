From: Hooman <mailinglister.hooman@gmail.com>
Subject: Re: WiFi Hotspot Disable Neighbor discovery,Ask
Date: Fri, 26 Jun 2020 14:07:40 -0400
Message-ID: <8a982f80-e11b-b506-3844-35dc8e655a0a@gmail.com>
References: <alpine.DEB.2.21.2006161012410.11442@piplus.local.jubileegroup.co.uk>
 <44cc0842-bd3b-986e-9537-bd11d980e61b@gmail.com>
 <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <01ddc95d-b6cd-193c-4a8c-4b2a42718441@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <netfilter@jubileegroup.co.uk>, Hooman <netfilter@vger.kernel.org>, Alex Buie <alexander.buie@datto.com>

After much searching, I realized that in wpa_supplicant/hostapd there is
a feature called `ap_isolate` which is supposed to do exactly what I needed.

I tried it to set this flag with `wpa_cli` which is a command line
interface for wpa_supplicant. That didn't work unfortunately. But
creating the entire Access Point with hostapd and `ap_isolate` enabled
worked for me :
http://lists.infradead.org/pipermail/hostap/2020-June/038542.html

I still believe netfilter tables should be able to manage such packets
even though these packets are probably forwarded by the wifi interface
directly.

I know that tcpdump/eBPF can view and filter these packets and I think
not being able to manipulate or drop such packets could be a security
issue, since these are packets that you can't really manage through
iptables/ebtables (think of firewalls). So I leave it to this community
to decide whether netfilter should be able to manage such packets.

-Hooman


On 6/20/20 5:48 PM, Hooman wrote:
> Hi
>
> On 6/19/20 1:38 PM, Hooman wrote:
>> Hi,
>>
>> On 6/16/20 6:09 AM, G.W. Haywood wrote:
>>> Hi there,
>>>
>>> On Mon, 15 Jun 2020, Hooman wrote:
>>>
>>>> I am using WiFi hotspot feature of Ubuntu 18.04 to create a hotspot for
>>>> my devices. I need to prevent different devices on the network from
>>>> contacting each other.
>>>>
>>>> More specifically, I have two phones on the network, I would like them
>>>> not to be able to send any packets to each other. Right now if phone 1
>>>> is using IP address 10.42.0.172 and phone 2 is using 10.42.0.59, I can
>>>> use phone 1 to ping 10.42.0.59.
>>>>
>>>> I would like to disable connections between different hosts on the
>>>> network created by the hotspot.
>>>>
>>>> I tried using iptables to drop local traffic. However, it seems like
>>>> the
>>>> iptables don't have any effect on these packets.
>>>>
>>>> I do see local packets on wireshark though. I'm wondering if local
>>>> packets are forwarded directly without hitting the iptable rules.
>>> That's _almost_ what is happening, I think.  It isn't totally clear to
>>> me but I'm going to assume that all your devices can communicate with
>>> your Ubuntu box over your local network.
>>>
>>> The word 'forward' has a specific meaning in networking.  It means
>>> that the connection goes via a router which is responsible for traffic
>>> which crosses network boundaries, and in that case the router can do
>>> things with the traffic (like block it, NAT and so on).  But in your
>>> case the devices are on the SAME network; traffic doesn't need to pass
>>> through a router, a switch or hub will do, but a switch or hub doesn't
>>> meddle with the traffic like a router can.  I guess you have all the
>>> devices and your Ubuntu box connected via the same Ethernet switch, in
>>> which case the Ubuntu box won't even see the traffic between the two
>>> other devices when they talk to each other.  If you have a hub and not
>>> a switch the Ubuntu box will see it, but even then it won't be able to
>>> do much about it, as the packets would not be addressed to the Ubuntu
>>> box - they would effectively just be network noise, and ignored.
>>>
>>>> Is it possible to use iptables or ebtables to filter these packets?
>>> Not as things stand, you need to force the traffic through a router.
>>> Your Ubuntu box can be the router.
>>>
>>>> Is there any other solution to this?
>>> To force all the traffic through your Ubuntu box you could put each of
>>> the other hosts on a separate subnet.  For example, assuming that you
>>> set up each subnet as a /16, for the two devices you could have:
>>>
>>> 10.43.0.2 instead of 10.42.0.59 and
>>> 10.44.0.2 instead of 10.42.0.172
>>>
>>> You will then need to add IPs 10.43.0.1 and 10.44.0.1 to the interface
>>> on the Ubuntu box, and also to tell the Ubuntu box to forward packets,
>>> which can sometimes have interesting side-effects.  As root, something
>>> like
>>>
>>> echo 1 > /proc/sys/net/ipv4/ip_forward
>>>
>>> or
>>>
>>> sysctl -w net.ipv4.ip_forward=1
>>>
>>> will do the trick for IPv4 packets.
>>>
>>> If you _did_ want the two devices to talk to each other sometime, then
>>> you'd need to set up routes in each device, which is normally an extra
>>> complication when you set up subnets so that the subnets can talk to
>>> each other.  But since you specifically don't want that to happen then
>>> you don't need to do that normally (at least to me) irritating part.
>>> You can then have rules on the Ubuntu box which block traffic between
>>> the two devices.
>>>
>>> There's nothing really special about the IP numbers I've chosen which
>>> would mean that 10.42.0.59 and 10.42.0.172 are on the same subnet and
>>> the 10.43 and 10.44 numbers are not.  The thing which determines that
>>> is the network mask.  Most of the time on a 10.x.x.x network the mask
>>> will be /8 (or 255.0.0.0) for example, and on a 192.168.x.x network it
>>> will be /16 (or 255.255.0.0), but you could for example have a mask of
>>> /25 (255.255.128.0), which would mean that 10.42.0.59 and 10.42.0.172
>>> are actually on separate networks and need to be routed.  The thinking
>>> is a bit more tricky though, so that's why I chose the numbers in my
>>> examples.  The documentation on the Netfilter Website goes into a
>>> great deal more detail than I can here.  It will take you some time to
>>> wade through it but it will be worth the effort.
>>>
>
> Maybe I wasn't clear enough. Here's it again. I am using Ubuntu 18.04
> default hotspot feature to create a wifi access point. The Ubuntu
> machine is also connected via ethernet to the Internet (inet
> 25.02.224.105  netmask 255.255.252.0).
>
> The hotspot creates a network on subnet on my wifi interface ( inet
> 10.42.0.1  netmask 255.255.255.0 ):
>
>
>> root@myuser:~# ifconfig
>> eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>>          inet 25.02.224.105  netmask 255.255.252.0  broadcast 25.02.227.255
>>          inet6 fe80::3521:18e2:11d9:7c70  prefixlen 64  scopeid 0x20<link>
>>          ether 2e:61:a5:b2:3d:88  txqueuelen 1000  (Ethernet)
>>          RX packets 1144162  bytes 508133990 (508.1 MB)
>>          RX errors 0  dropped 0  overruns 0  frame 0
>>          TX packets 89831  bytes 7271961 (7.2 MB)
>>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>>          device interrupt 17  memory 0xb1200000-b1220000
>
>> wlan1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
>>          inet 10.42.0.1  netmask 255.255.255.0  broadcast 10.42.0.255
>>          inet6 fe80::c112:bd92:d15:ea96  prefixlen 64  scopeid 0x20<link>
>>          ether ac:6f:d2:2a:1b:9a  txqueuelen 1000  (Ethernet)
>>          RX packets 0  bytes 0 (0.0 B)
>>          RX errors 0  dropped 0  overruns 0  frame 0
>>          TX packets 92  bytes 11830 (11.8 KB)
>>          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> Now using this hotspot, I connect two other machines to this access
> point. Machine A is on 10.42.0.34 and Machine B is on 10.42.0.57.
>
> Some other info about the setup:
>
>> root@myuser:~# ip link show
>> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
> mode DEFAULT group default qlen 1000
>>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>> 2: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel
> state UP mode DEFAULT group default qlen 1000
>>      link/ether 2e:61:a5:b2:3d:88 brd ff:ff:ff:ff:ff:ff
>> 3: wlan1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP
> mode DORMANT group default qlen 1000
>>      link/ether ac:6f:d2:2a:1b:9a brd ff:ff:ff:ff:ff:ff
>
>> root@myuser:~# ip rule show
>> 0:    from all lookup local
>> 32766:    from all lookup main
>> 32767:    from all lookup default
>
>> root@myuser:~# ip route show
>> default via 25.02.224.1 dev eth1 proto dhcp metric 100
>> 10.42.0.0/24 dev wlan1 proto kernel scope link src 10.42.0.1 metric 600
>> 25.02.224.0/22 dev eth1 proto kernel scope link src 25.02.224.105
> metric 100
>> 169.254.0.0/16 dev eth1 scope link metric 1000
>> root@myuser:~# ip netconf
>> ipv4 dev lo forwarding on rp_filter off mc_forwarding off proxy_neigh
> off ignore_routes_with_linkdown off
>> ipv4 dev eth1 forwarding on rp_filter loose mc_forwarding off
> proxy_neigh off ignore_routes_with_linkdown off
>> ipv4 dev wlan1 forwarding on rp_filter strict mc_forwarding off
> proxy_neigh off ignore_routes_with_linkdown off
>> ipv4 all forwarding on rp_filter strict mc_forwarding off proxy_neigh
> off ignore_routes_with_linkdown off
>> ipv4 default forwarding on rp_filter strict mc_forwarding off
> proxy_neigh off ignore_routes_with_linkdown off
>> ipv6 dev lo forwarding off mc_forwarding off proxy_neigh off
> ignore_routes_with_linkdown off
>> ipv6 dev eth1 forwarding off mc_forwarding off proxy_neigh off
> ignore_routes_with_linkdown off
>> ipv6 dev wlan1 forwarding off mc_forwarding off proxy_neigh off
> ignore_routes_with_linkdown off
>> ipv6 all forwarding off mc_forwarding off proxy_neigh off
> ignore_routes_with_linkdown off
>> ipv6 default forwarding off mc_forwarding off proxy_neigh off
> ignore_routes_with_linkdown off
>
>> root@myuser:~# brctl show
>> bridge name    bridge id        STP enabled    interfaces
>
>> root@myuser:~# arp -a
>> ? (25.02.224.104) at 2e:61:a5:b2:3e:25 [ether] on eth1
>> ? (10.42.0.57) at f6:2e:23:4b:72:ae [ether] on wlan1
>> ? (25.02.224.1) at 00:00:0c:9f:f0:e0 [ether] on eth1
>
> The hotspot feature creates some iptable rules:
>
>  
>> root@myuser:~# iptables -vL -t filter
>> Chain INPUT (policy ACCEPT 284K packets, 89M bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>>      0     0 ACCEPT     udp  --  wlan1 any     anywhere            
> anywhere             udp dpt:bootps
>>      0     0 ACCEPT     tcp  --  wlan1 any     anywhere            
> anywhere             tcp dpt:bootps
>>      0     0 ACCEPT     udp  --  wlan1 any     anywhere            
> anywhere             udp dpt:domain
>>      0     0 ACCEPT     tcp  --  wlan1 any     anywhere            
> anywhere             tcp dpt:domain
>> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>>      0     0 ACCEPT     all  --  any    wlan1  anywhere            
> 10.42.0.0/24         state RELATED,ESTABLISHED
>>      0     0 ACCEPT     all  --  wlan1 any     10.42.0.0/24        
> anywhere          
>>      0     0 ACCEPT     all  --  wlan1 wlan1  anywhere            
> anywhere          
>>      0     0 REJECT     all  --  any    wlan1  anywhere            
> anywhere             reject-with icmp-port-unreachable
>>      0     0 REJECT     all  --  wlan1 any     anywhere            
> anywhere             reject-with icmp-port-unreachable
>> Chain OUTPUT (policy ACCEPT 13186 packets, 1539K bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>>
>> root@myuser:~# iptables -vL -t nat
>> Chain PREROUTING (policy ACCEPT 110K packets, 27M bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain INPUT (policy ACCEPT 110K packets, 27M bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain OUTPUT (policy ACCEPT 1309 packets, 99285 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain POSTROUTING (policy ACCEPT 1276 packets, 96891 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>>     33  2394 MASQUERADE  all  --  any    any     10.42.0.0/24       
> !10.42.0.0/24      
>>
>> root@myuser:~# iptables -vL -t mangle
>> Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>>
>> root@myuser:~# iptables -vL -t raw
>> Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>>
>> root@myuser:~# iptables -vL -t security
>> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination       
>> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>>   pkts bytes target     prot opt in     out     source              
> destination      
>
> There are no ebatbles rules:
>
>> root@myuser:~# ebtables -t broute -L
>> Bridge table: broute
>>
>> Bridge chain: BROUTING, entries: 0, policy: ACCEPT
>>
>>
>> root@myuser:~# ebtables -t filter -L  
>> Bridge table: filter
>>
>> Bridge chain: INPUT, entries: 0, policy: ACCEPT
>>
>> Bridge chain: FORWARD, entries: 0, policy: ACCEPT
>>
>> Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
>>
>>
>> root@myuser:~# ebtables -t nat -L
>> Bridge table: nat
>>
>> Bridge chain: PREROUTING, entries: 0, policy: ACCEPT
>>
>> Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
>>
>> Bridge chain: POSTROUTING, entries: 0, policy: ACCEPT
>>
>
> Now as I said, Machine A is on 10.42.0.34 and Machine B is on 10.42.0.57.
>
> Machine A (10.42.0.34) can ping Machine B (10.42.0.57) and  can also
> ping 8.8.8.8 (external:Google).
>
> These ebtables rules don't have any effect:
>
>
>> sudo ebtables -t broute -F
>> sudo ebtables -t broute -P BROUTING DROP
>>
>>
>> sudo ebtables -t nat -F
>> sudo ebtables -t nat -P PREROUTING DROP
>> sudo ebtables -t nat -P OUTPUT DROP
>> sudo ebtables -t nat -P POSTROUTING DROP
>>
>>
>> sudo ebtables -t filter -F
>> sudo ebtables -t filter -P INPUT DROP
>> sudo ebtables -t filter -P OUTPUT DROP
>> sudo ebtables -t filter -P FORWARD DROP
>
> The following iptables rules stop packets from Machine A to Google but
> not from Machine A to B:
>
>> sudo iptables -t mangle  -I PREROUTING -j DROP
>> sudo iptables -t filter -I FORWARD -j DROP
>> sudo iptables -t raw  -I PREROUTING -j DROP
>
> The only way I can stop packets from machine A to B for a few second is
> to flush arp cache by running:
>
>>   sudo  ip -s -s neigh flush all
> So basically, iptable and ebtable rules have no effect on packets from A
> to B. However, I see those packets on wireshark and they definitely go
> through the Ubuntu machine that is hosting the access point. And that's
> exactly my dilemma, how to block those packets from going through.
>
