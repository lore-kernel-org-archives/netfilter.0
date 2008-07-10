From: John Stockdale <jstockdale@videosurf.com>
Subject: Re: IPTables with LVS-TUN -- eth0 shows encapsulated packets, but the decapsulated packets never make it to tunl0
Date: Thu, 10 Jul 2008 14:44:37 -0700
Message-ID: <E671C09E-B703-46FE-A2BE-A5A2798EA516@videosurf.com>
References: <698F3541-812A-4F45-98E9-55C94F23B4F1@videosurf.com>
Mime-Version: 1.0 (Apple Message framework v924)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <698F3541-812A-4F45-98E9-55C94F23B4F1@videosurf.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org
Cc: John Stockdale <jstockdale@videosurf.com>

To clarify, this is the firewall on the apache machines, not the  
loadbalancer. The LB firewall works just fine.
____________________
John Stockdale
System Engineer
jstockdale@videosurf.com

On Jul 10, 2008, at 12:36 PM, John Stockdale wrote:

> Hi everyone,
>
> I'm running a LVS loadbalancer in front of several apache instances,  
> using ip tunneling to forward the packets. When the firewall is down  
> (--flush) everything works beautifully. When I bring iptables back  
> up, everything dies.
>
> I've managed to trace the issue to the point where I can watch (with  
> tcpdump) the proto: IPIP packets ingress on eth0, but never show up  
> decapsulated on tunl0 (or anywhere else).
>
> Any help would be greatly appreciated.
>
> The relevant iptables rules, and ifconfig output follows.  
> XXX.XXX.XXX.17 is the primary loadbalancer, XXX.XXX.XXX.18 is the  
> secondary, and XXX.XXX.XXX.42 is the service address (bound to tunl0).
>
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [11714046:38544927249]
> :Firewall - [0:0]
> -A INPUT -j Firewall
> # Global allow established traffic
> -A Firewall -m state --state ESTABLISHED,RELATED -j ACCEPT
> # Global SSH @ Port 22
> -A Firewall -p tcp -m tcp --dport 22 -j ACCEPT
> # DNS Responses
> -A Firewall -p udp -s XXX.XXX.XXX.XXX/32 --source-port 53 -d 0/0 -- 
> destination-port 1024:65535 -j ACCEPT
> -A Firewall -p udp -s XXX.XXX.XXX.XXX/32 --source-port 53 -d 0/0 -- 
> destination-port 1024:65535 -j ACCEPT
> # Global WWW
> -A Firewall -p tcp -m tcp --dport 80 -j ACCEPT
> # time.nist.gov ntpd access
> -A Firewall -p udp -s 192.43.244.18/32 --source-port 123 -- 
> destination-port 123 -j ACCEPT
> # Office ping
> -A Firewall -s XXX.XXX.XXX.XXX/29 -p icmp --icmp-type 8 -j ACCEPT
> # Local ping
> -A Firewall -s XXX.XXX.XXX.XXX/25 -p icmp --icmp-type 8 -j ACCEPT
> # Global allow ip tunnels from loadbalancers
> -A Firewall -s XXX.XXX.23.17 -p ipip -j ACCEPT
> -A Firewall -s XXX.XXX.23.18 -p ipip -j ACCEPT
> -A Firewall -d XXX.XXX.23.42 -p all -j ACCEPT
> # Allow local interface traffic on lo and tunl0
> -A Firewall -i lo -s 127.0.0.1 -p all -j ACCEPT
> -A Firewall -i tunl0 -p all -j ACCEPT
> # Global reject
> -A Firewall -j DROP
> COMMIT
>
> eth0      Link encap:Ethernet  HWaddr XX:XX:XX:XX:XX:XX
>          inet addr:XXX.XXX.XXX.7  Bcast:XXX.XXX.XXX.127  Mask: 
> 255.255.255.128
>          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>          RX packets:479975 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:286084 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:1000
>          RX bytes:157547624 (150.2 MiB)  TX bytes:32662562 (31.1 MiB)
>          Interrupt:169 Memory:f8000000-f8012100
>
> lo        Link encap:Local Loopback
>          inet addr:127.0.0.1  Mask:255.0.0.0
>          UP LOOPBACK RUNNING  MTU:16436  Metric:1
>          RX packets:444 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:444 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:0
>          RX bytes:58036 (56.6 KiB)  TX bytes:58036 (56.6 KiB)
>
> tunl0     Link encap:IPIP Tunnel  HWaddr
>          inet addr:XXX.XXX.XXX.42  Mask:255.255.255.255
>          UP RUNNING NOARP  MTU:1480  Metric:1
>          RX packets:2659 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:0
>          RX bytes:305154 (298.0 KiB)  TX bytes:0 (0.0 b) <- Note:  
> the RX bytes only increase when the firewall is down.
>
> ____________________
> John Stockdale
> System Engineer
> jstockdale@videosurf.com
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

