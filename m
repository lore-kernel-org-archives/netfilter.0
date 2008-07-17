From: Brian Austin <brian@standarduniversal.com.au>
Subject: Re: MARK and CONNMARK
Date: Thu, 17 Jul 2008 16:56:52 +1000
Message-ID: <487EED34.7000304@standarduniversal.com.au>
References: <200807161046.39247.vladislav.kurz@webstep.net> <alpine.LNX.1.10.0807161156560.26724@fbirervta.pbzchgretzou.qr> <200807161233.51463.vladislav.kurz@webstep.net> <487E0F3B.3070904@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <487E0F3B.3070904@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

sorry to hijack the thread a little bit... Just say I want to mark the 
connections based on the network they are coming from/going to... does 
this look appropriate?
eth19 and eth20 are connected to adsl modems and hence the internet. 
eth41 is the local lan.

maybe it helps answer the question, what use is conntrack...

   #first line in prerouting pulls out existing mark on the connection 
for the packet
   iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
   #check to see if there is a mark now, if so accept
   iptables -t mangle -A PREROUTING -m mark  --mark 1 -j ACCEPT
   iptables -t mangle -A PREROUTING -m mark  --mark 2 -j ACCEPT
     #else we need to add a mark
   #mark incoming from eth19
   iptables -t mangle -A PREROUTING -d 192.168.19.253 -j MARK --set-mark 1
   #mark incoming from eth20
   iptables -t mangle -A PREROUTING -d 192.168.20.253 -j MARK --set-mark 2

   #save the mark for future packets
   iptables -t mangle -A PREROUTING -j CONNMARK --save-mark


   #outgoing on eth41, the local interface, no marks required so accept.
   iptables -t mangle -A POSTROUTING -o eth41 -j ACCEPT
   #check if the connection is already marked
   iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
   #accept marked packets
   iptables -t mangle -A POSTROUTING -m mark  --mark 1 -j ACCEPT
   iptables -t mangle -A POSTROUTING -m mark  --mark 2 -j ACCEPT

   #else we want to set the markings for the connection
   #on outgoing connection via eth19 = wan1 we set the mark 1
   iptables -t mangle -A POSTROUTING -d 192.168.19.253 -j MARK --set-mark 1
   #on outgoing connection via eth20 = wan2 we set the mark 2
   iptables -t mangle -A POSTROUTING -d 192.168.20.253 -j MARK --set-mark 2

   #save the mark for future packets from this connx
   #iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark

now to have some rules to act on the marks

   ip rule add fwmark 1 table 101
   ip rule add fwmark 2 table 102

and finally some route tables  - 101 and 102
       #iinet network interface
       #we want to have rules for each packet that can be encountered in 
this table
       #local interfaces
       ip route add default via 192.168.19.254 dev eth19 table 101
       ip route add 192.168.41.0/24 dev eth41 table 101
       #no need for openvpn to get caught up in these tables
       #isp services
       ip route add  203.0.178.0/24 via 192.168.19.254 dev eth19 table 101

       #tpg network interface
       #we want to have rules for each packet that can be encountered in 
this table
       #local interfaces
       ip route add default via 192.168.20.254 dev eth20 table 102
       ip route add 192.168.41.0/24 dev eth41 table 102
       #no need for openvpn to get caught up in these tables
       #ISP services
       ip route add 203.12.160.0/24 via 192.168.20.254 dev eth20 table 102
       #internal networks

the grand plan is to route packets back out the wan connection the 
conversation was started from, for email server incoming connections, as 
well as maintaining the routes for outgoing connections from the local 
lan PCs.

       #the magic dual wan gateway route command
       ip route add default nexthop via 192.168.19.254 dev eth19 weight 1 \
               nexthop via 192.168.20.254 dev eth20 weight 1

       #some dodgy settings
       echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
       echo 1 > /proc/sys/net/ipv4/ip_forward
       ip route flush cache

regards

Brian

-----Original Message -----
 From: Grant Taylor
 Sent: 17/07/2008 1:09 AM
> On 07/16/08 05:33, Vladislav Kurz wrote:
>> Ok, I can read this, but i just wonder what is the difference and how 
>> can I use connmark. Just marking connections for fun? What other use 
>> they are for?
>
> The first thing that you need to realize about MARK is that it is only 
> good while the packets are in the kernel.  This means that the mark is 
> only retained from the point the packet comes in an interface and goes 
> out an interface or goes out to a local process.  Said another way is 
> when a packet comes in, gets marked and goes out and the reply comes 
> back in the mark is no longer there (because from the firewalls point 
> of view the reply is a completely different packet).
>
> This is where CONNMARK comes in to play.  CONNMARK is actually not 
> used to filter so much as it is used to remember a given packets mark 
> across different packets.  To re-use the above analogy you would check 
> to see if there is a CONNMARK associated with a packet and if there is 
> use it to set the MARK.  If the MARK has not been set (no stored 
> CONNMARK) you would set it your self.  Before the packet leaves the 
> system you would store the MARK to the CONNMARK for later use.
>
> Think of MARK as simple stateless filtering and CONNMARK as the state 
> that is stored across packets.
>
> Does that help?
>
>
>
> Grant. . . .
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
