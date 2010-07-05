From: "John Meissen" <john@meissen.org>
Subject: Changing default route causes packet drop
Date: Mon, 05 Jul 2010 02:03:26 -0700
Message-ID: <20100705090326.BF7B134502@john>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I'm not sure if this is the right place to ask, or if it's even the right
question. Hopefully someone can point me in the right direction.

I had a traditional setup with two ethernet interfaces on my Linux box 
(WAN=eth0/LAN=eth1), and NATing the traffic that was forwarded between them.

I added another interface (eth2), and simply want to change the default
routing to go through it. I'm leaving various services listening on all
interfaces.

If I change the default route to use eth2, I can route from the internal
network to the outside just fine, and I can connect from the internal net
to services on the system fine. But incoming connections on the original
WAN (eth0) don't complete. They hang at SYN_RECV, as if I had a DROP rule.

I.e., what used to be

  internal <-> (eth1) gateway forward (eth0) <-> WAN
  internal <-> (eth1) gateway local service
                gateway local service (eth0) <-> WAN
is now

  internal <-> (eth1) gateway forward (eth2) <-> WAN
  internal <-> (eth1) gateway local service

but
                gateway local service (eth0) <-> WAN

now drops connection attempts.

I don't see what difference there should be between eth0 and eth1, except
that eth0 isn't forwarded. That shouldn't affect connections to processes
listening on that interface.

I've tried to keep the iptables config simple for this. The only change I'm
making is changing the default route with the 'route' command.

# iptables -L -v -n
Chain INPUT (policy ACCEPT 63555 packets, 73M bytes)
 pkts bytes target     prot opt in     out     source               destination 

   11  3626 ACCEPT     udp  --  eth1   *       0.0.0.0/0            0.0.0.0/0   
        udp spt:68 dpt:67
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0   
        tcp spt:68 dpt:67
    0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0            0.0.0.0/0   
        udp spt:67 dpt:68
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0   
        tcp spt:67 dpt:68
 1937  127K ACCEPT     udp  --  eth1   *       0.0.0.0/0            0.0.0.0/0   
        udp dpt:53
    0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            0.0.0.0/0   
        tcp dpt:53

Chain FORWARD (policy ACCEPT 39362 packets, 42M bytes)
 pkts bytes target     prot opt in     out     source               destination 

31533 2844K ACCEPT     all  --  *      *       192.168.10.0/24      0.0.0.0/0   


Chain OUTPUT (policy ACCEPT 42150 packets, 5745K bytes)
 pkts bytes target     prot opt in     out     source               destination 


and

# iptables -t nat -L -v -n
Chain PREROUTING (policy ACCEPT 859K packets, 57M bytes)
 pkts bytes target     prot opt in     out     source               destination 


Chain POSTROUTING (policy ACCEPT 584K packets, 46M bytes)
 pkts bytes target     prot opt in     out     source               destination 

 755K   72M MASQUERADE  all  --  *      *       192.168.10.0/24      0.0.0.0/0  


Chain OUTPUT (policy ACCEPT 1015K packets, 100M bytes)
 pkts bytes target     prot opt in     out     source               destination 



