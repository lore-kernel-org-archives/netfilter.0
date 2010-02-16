From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: I can't make forwarding
Date: Tue, 16 Feb 2010 16:38:21 +0100
Message-ID: <4B7ABBED.1020404@chello.at>
References: <4B7A7F39.5090808@perfaction.net>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B7A7F39.5090808@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org, patrick.chemla@perfaction.net

On 16.02.2010 12:34, netfilter-owner@vger.kernel.org wrote:
> Hi,
> 
> I have problems to setup a NAT router using iptables.
> 
> My NAT Router is running Fedora 11.
> 
> I have 2 interfaces, eth0 10.0.0.1 is internal, eth1 172.25.2.2 is
> external.
> 
> I have 10 external public addresses coming to the interface eth1 that I
> want to forward to 10 internal computers on eth0.
> 
> When I try to ping or access an external web server from the NAT server
> itself, it works very fine. I see on the remote server the external
> address of the NAT router itself.
> When I try to ping or wget an external web server from an internal
> 10.0.0.151 computer,  using TCPDUMP both on the foreign server interface
> and on the eth1 of the NAT router, I see  that packets reach the
> external server with the right IP 192.114.84.144, I see that the
> external server send back something, but I can't get it back on the eth1
> tcpdump.
> 
> Here is my iptables:
> ============
> iptables -n  -L -v
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>  1664  208K ACCEPT     all  --    *       *       0.0.0.0/0            
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>     0     0 ACCEPT           icmp --  *       *      
> 0.0.0.0/0             0.0.0.0/0
>     0     0 ACCEPT            all  --   lo      *      
> 0.0.0.0/0             0.0.0.0/0
>     0     0 ACCEPT             tcp  --  *       *      
> 0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
> 
> Chain FORWARD (policy ACCEPT 3499 packets, 213K bytes)
>  pkts bytes target     prot opt in     out         source              
> destination
>     0     0 ACCEPT         all  --    eth0   eth1   
> 10.0.0.151           192.114.84.144      state NEW,RELATED,ESTABLISHED
>     0     0 ACCEPT         all  --    eth1   eth0   
> 192.114.84.144       10.0.0.151          state NEW,RELATED,ESTABLISHED
> 
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target      prot opt in     out     source              
> destination
>   466 71467 ACCEPT     all     --  *        *       0.0.0.0/0           
> 0.0.0.0/0           state NEW,RELATED,ESTABLISHED
>     0     0       ACCEPT     icmp --   *        *      
> 0.0.0.0/0            0.0.0.0/0

Why have all the ACCEPT rules, if the policy of all chains is ACCEPT?
Use at least a DROP policy in INPUT and FORWARD chain.

EXT_IF=eth1
INT_IF=eth0
INT_IP01=10.0.0.151

iptables -A FORWARD -o $INT_IF -d $INT_IP01 -m state ... -p ... -j ACCEPT
iptables -A FORWARD -i $INT_IF -s $INT_IP ... -j ACCEPT

> 
> Here is my NAT table:
> =============
> iptables -n -t nat -L -v
> Chain PREROUTING (policy ACCEPT 915 packets, 129K bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>     0     0        DNAT      tcp    --  eth1   *      
> 192.114.84.144       0.0.0.0/0           to:10.0.0.151
> 
> Chain POSTROUTING (policy ACCEPT 75 packets, 6372 bytes)
>  pkts bytes target     prot opt in      out     source              
> destination
>    16   960     SNAT       all     --    *      eth1   
> 10.0.0.151           0.0.0.0/0           to:192.114.84.144
> 
> Chain OUTPUT (policy ACCEPT 36 packets, 3998 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
> 
> 
> I think I ACCEPT and FORWARD all, I have both SNAT and DNAT, but I
> missed something.
> 
> Help will be welcome.
> 
> Patrick

ok, lets work this out:

goal 1: I want a request coming from the internet - towards a specific
ip of the external interface of the gateway, to be redirected to a
certain ip inside my internal network.

EXT_IF=eth1
EXT_IP01=192.114.84.144
INT_IP01=10.0.0.151

iptables -t nat -A PREROUTING -i $EXT_IF -d $EXT_IP01 -j DNAT
--to-destination $INT_IP01

This will map external request to the internal server, traffic coming
back will re-translated by itself.

Repeat for every external/internal IP pair...

goal 2: All traffic originating from a certain internal ip - should
leave the external interface with a certain ip.

iptables -t nat -A POSTROUTING -o $EXT_IF -s $INT_IP01 -j SNAT
--to-source $EXT_IP01

Repeat for every internal/external IP pair...


Writing all those stuff in the nat table, one might prefer assigning the
external IPs to the servers and route the traffic through.

Best regards

Mart
