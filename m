From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: load-balancing router: trouble with breaking connections
Date: Sun, 19 Feb 2012 12:59:00 +1100
Message-ID: <4F405764.5040103@standarduniversal.com.au>
References: <op.v9wbxmahx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v9wbxmahx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

you need to restore connmarks coming in from the wan so the system can 
send them back out that way

this is the guts of my 4 way rig.

     `iptables -t mangle -X`;

     `iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark`;
     `iptables -t mangle -A PREROUTING -i eth19 -j MARK --set-mark 0x01`;
     `iptables -t mangle -A PREROUTING -i eth19 -j CONNMARK --save-mark`;
     `iptables -t mangle -A PREROUTING -i eth20 -j MARK --set-mark 0x02`;
     `iptables -t mangle -A PREROUTING -i eth20 -j CONNMARK --save-mark`;
     `iptables -t mangle -A PREROUTING -i tun0 -j MARK --set-mark 0x03`;
     `iptables -t mangle -A PREROUTING -i tun0 -j CONNMARK --save-mark`;
     `iptables -t mangle -A PREROUTING -i tun1 -j MARK --set-mark 0x04`;
     `iptables -t mangle -A PREROUTING -i tun1 -j CONNMARK --save-mark`;

     `iptables -t mangle -A INPUT -i eth19  -j MARK --set-mark 0x01`;
     `iptables -t mangle -A INPUT -i eth19  -j CONNMARK --save-mark`;
     `iptables -t mangle -A INPUT -i eth20  -j MARK --set-mark 0x02`;
     `iptables -t mangle -A INPUT -i eth20  -j CONNMARK --save-mark`;
     `iptables -t mangle -A INPUT -i tun0  -j MARK --set-mark 0x03`;
     `iptables -t mangle -A INPUT -i tun0  -j CONNMARK --save-mark`;
     `iptables -t mangle -A INPUT -i tun1  -j MARK --set-mark 0x04`;
     `iptables -t mangle -A INPUT -i tun1  -j CONNMARK --save-mark`;

     `iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark`;
     `iptables -t mangle -A FORWARD -j CONNMARK --restore-mark`;

     `iptables -t mangle -A OUTPUT -s $myeth19ip -j MARK --set-mark 0x01`;
     `iptables -t mangle -A OUTPUT -s $myeth19ip -j CONNMARK --save-mark`;
     `iptables -t mangle -A FORWARD -i eth19 -j MARK --set-mark 0x01`;
     `iptables -t mangle -A FORWARD -i eth19 -j CONNMARK --save-mark`;

     `iptables -t mangle -A OUTPUT -s $myeth20ip -j MARK --set-mark 0x02`;
     `iptables -t mangle -A OUTPUT -s $myeth20ip -j CONNMARK --save-mark`;
     `iptables -t mangle -A FORWARD -i eth20 -j MARK --set-mark 0x02`;
     `iptables -t mangle -A FORWARD -i eth20 -j CONNMARK --save-mark`;

     `iptables -t mangle -A OUTPUT -s 192.168.101.1 -j MARK --set-mark 
0x03`;
     `iptables -t mangle -A OUTPUT -s 192.168.101.1 -j CONNMARK 
--save-mark`;
     `iptables -t mangle -A FORWARD -i tun0 -j MARK --set-mark 0x03`;
     `iptables -t mangle -A FORWARD -i tun0 -j CONNMARK --save-mark`;

     `iptables -t mangle -A OUTPUT -s 192.168.102.1 -j MARK --set-mark 
0x04`;
     `iptables -t mangle -A OUTPUT -s 192.168.102.1 -j CONNMARK 
--save-mark`;
     `iptables -t mangle -A FORWARD -i tun1 -j MARK --set-mark 0x04`;
     `iptables -t mangle -A FORWARD -i tun1 -j CONNMARK --save-mark`;


     `iptables -t mangle -A POSTROUTING -o eth19  -j MARK --set-mark 0x1`;
     `iptables -t mangle -A POSTROUTING -o eth19  -j  CONNMARK --save-mark`;
     `iptables -t mangle -A POSTROUTING -o eth20  -j MARK --set-mark 0x2`;
     `iptables -t mangle -A POSTROUTING -o eth20  -j  CONNMARK --save-mark`;

     `iptables -t mangle -A POSTROUTING -o tun0  -j MARK --set-mark 0x3`;
     `iptables -t mangle -A POSTROUTING -o tun0  -j  CONNMARK --save-mark`;
     `iptables -t mangle -A POSTROUTING -o tun1  -j MARK --set-mark 0x4`;
     `iptables -t mangle -A POSTROUTING -o tun1  -j  CONNMARK --save-mark`;

cheers


On 19/02/2012 9:40 AM, Lloyd Standish wrote:
> Hi All,
>
> I have a load balancing router to distribute traffic from an internal 
> LAN over several small (5 Mbit) uplinks, using NAT.  The router works, 
> but I had a problem which prevents me from doing the balancing the way 
> I would like.  I have spent weeks trying to fix the problem I will 
> describe below.
>
> Here is an ASCII picture stolen from 
> http://lartc.org/howto/lartc.rpdb.multiple-links.html.  This shows the 
> general scheme of my simple network setup (there are 5 uplinks instead 
> of 2).  I have added the interface addresses to refer to below.
>
>                                                                                         
> ________
>                                                                  
> +------------+        /
>                                                                  |    
> gw1     |       |
>                                                    +-------------+ 
> Provider 1 +-------
>                                __            192.168.1.7         
> |            |     /
>                            ___/  \_         +------+-------+     
> +------------+    |
>                          _/        \__      |     if1      
> |                      /
>                         /             \     |              
> |                      |
> | Local network -----+ Linux router |                      |     Internet
>                         \_           __/    |              
> |                      |
>                           \__     __/       |     if2      
> |                      \
>                              \___/          +------+-------+     
> +------------+    |
>                                              200.91.104.144      |   
> gw2      |     \
>                                                    +-------------+ 
> Provider 2 +-------
>                                                                  
> |            |       |
>                                                                  
> +------------+        \________
>
>
> I have distinct routing tables for each interface, as described on 
> http://lartc.org/howto/lartc.rpdb.multiple-links.html.
>
> The simple round-robin load-balancing described on this page takes 
> advantage of the _route_cache_ to choose a new connection based on 
> routing for a previous connection.  This (partially, at least) solves 
> the primary problem with connmark-based load-balancing, which is the 
> tendency to break sessions.
>
> Unfortunately I have a bad problem with round-robin balancing that I 
> have not been able to overcome: connections traveling through 
> interfaces having a private IP address (if1 above) are often broken.
>
> Is there a known problem with this sort of load-balancing when there 
> is a private IP on the interface?
>
> I'm quite sure the problem is not in the NAT done by Provider 1, since 
> when this same interface is used with my Linux router doing 
> connmark-based load balancing, connections are not dropped.
>
> http://lartc.org/howto/lartc.rpdb.multiple-links.html explains this 
> simple routing scheme clearly, and I think I have followed it 
> carefully.  Basically, for each interface I execute commands like 
> these (IP numbers and interfaces are replaced by variables from my 
> script, but it should be clear.  CONNMARK<n> are simply chains to put 
> a fwmark on a packet.  This is used only for special cases on this 
> router.):
>
>      ip route flush table $table
>      ip route add ${!network} dev ${interface} src ${!wan} table $table
>
>      ip route add ${!lan_net} dev ${lan_if} table $table
>      ip route add 127.0.0.0/8 dev lo table $table #ok
>
> # also add route in main routing table for network (see below)
>      ip route add ${!network} dev ${interface} src ${!wan}
>      ip route add default via ${!gateway} dev ${interface} table $table
>
> # the following rule is supposed to ensure packets are replied to over 
> the interface they came from
> # frankly I don't clearly understand this; please comment
>      ip rule add from ${!wan} table $table priority 
> $((${#ifaces[@]}*100))
>
>      # masquerade outgoing connections on secondary interfaces
>      iptables -t nat -A POSTROUTING -o ${interface} -j SNAT 
> --to-source ${!wan}
>
> # mark new incoming connection, *not* from LAN, so we route back out 
> the right interface
>      iptables -t mangle -A PREROUTING -i ${interface} -m state --state 
> NEW -j CONNMARK$((cardnum+1))
>
> This is repeated for each interface, and then round-robin load 
> balancing is done over the interfaces by a command like this (this 
> example if for 3 interfaces):
> ip route add default scope global  nexthop via 192.168.1.1 dev eth1 
> weight 1 nexthop via 192.168.2.1 dev eth2 weight 1 nexthop via 
> 200.91.104.144 dev ppp0 weight 1
>
> Can you see anything wrong with this configuration?  The problem is 
> very serious, since I am forced to use connmark to mark connections 
> for load-balancing, and the session-breaking is very annoying.
>
> Regards,
> Lloyd
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

