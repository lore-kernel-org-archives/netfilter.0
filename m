From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 14:58:29 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002b01c20b49$cbb0e080$6301a8c0@JJONES1>
References: <200206032132.g53LWgA23232@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206032132.g53LWgA23232@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Iptables <netfilter@lists.samba.org>

Antony,

Grateful for the help, and it is getting me closer, I think.

> > echo 1 > /proc/sys/net/ipv4/ip_forward
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 
> > iptables -A FORWARD -p tcp -d 10.0.0.10 --dport 53 -j 
> ACCEPT iptables 
> > -A FORWARD -p udp -d 10.0.0.10 --dport 53 -j ACCEPT 
> iptables -t nat -I 
> > PREROUTING 1 -p tcp -d 66.38.133.120 --dport 53 -j DNAT --to 
> > 10.0.0.10:53 iptables -t nat -I PREROUTING 1 -p udp -d 
> 66.38.133.120 
> > --sport 53 -j DNAT --to 10.0.0.10:53
> 
> If this is your entire ruleset, the problem is that your name 
> server is ging 
> out to the Internet with a source address of 10.0.0.10, 
> therefore nothing else can reply to it.
>
> (By the way, you should change that --sport in the last rule 
> to --dport.)
> 

Okay, sorry I typoed.  I fixed the typo, however, and that doesn't solve
it.

HOWEVER!  I -am- now getting Timed Out responses, not Cannot Connect
responses!  So, that helped!  (( Can you imagine how frustrated I am to
see that?  After literally hours of trying different things... I typo
when I am THAT close! ))
 

> Anyway, I'm happy to have a go at a ruleset for you, but 
> please can you 
> remind me exactly what you're trying to do ?   Looking back 
> over the thread 
> of this question, you've said you're trying to redirect DNS 
> requests to a 
> name server on the DMZ - is this DNS requests from machines 
> on the internal 
> LAN, or machines on the outside (or both) ?

We have two firewalls, one for the LAN and one for the DMZ.  So, for our
purposes here, lets just go with the statement that all DNS requests
seen by the DMZ firewall should be portforwarded into the DMZ server
(10.0.0.10).  For further reference, eth0 is the 10. interface, and eth1
is the public/outside/Internet interface.
 
> I'll assume for the moment you've got an internal LAN, a DMZ 
> with a DNS 
> server on it, and you want to make sure that all DNS requests 
> from machines 
> on the internal LAN get redirected to the DMZ DNS server, 
> which can then go 
> out to the Internet to resolve queries.   If that's wrong, 
> just let me know 
> and I'll have another go.

Aside from the fact that the DMZ is not connected to the LAN at all,
yes.  Just so those out there know, this structure is intentional,
because of the possibility in the near future to co-locating our DMZ
structure off-site for higher bandwidth.  

> iptables -A PREROUTING -t nat -i $LAN_IF -p tcp --dport 53 -j 
> DNAT --to 10.0.0.10
> iptables -A PREROUTING -t nat -i $LAN_IF -p udp --dport 53 -j 
> DNAT --to 10.0.0.10

Rewritten: (eth1 is external interface)

iptables -t nat -I PREROUTING 1 -i eth1 -p tcp --dport 53 -j DNAT --to
10.0.0.10
iptables -t nat -I PREROUTING 1 -i eth1 -p udp --dport 53 -j DNAT --to
10.0.0.10

> These two rules will catch all DNS lookups from internal 
> machines and send them to the DNS server on 10.0.0.10
> 
> iptables -A POSTROUTING -t nat -o $EXT_IF -j SNAT --to $EXT_IP

Rewritten:

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 66.38.133.120

> 
> This rule will masquerade all your outgoing packets (from 
> either the internal 
> LAN or the DMZ) behind the external address of the firewall
> 
> iptables -A FORWARD -i $LAN_IF -j ACCEPT
> iptables -A FORWARD -i $DMZ_IF -j ACCEPT

Rewritten:
iptables -A FORWARD -i eth0 -j ACCEPT

> These two rules will forward all packets which come from 
> either the internal 
> LAN or the DMZ through the firewall (ie they will not allow 
> packets which 
> come from the external interface)
> 
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


> This will allow all replies through the box, no matter where 
> they're from.
> 
> 
> I think that should do it.

Compiled and final ruleset:

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -I PREROUTING 1 -i eth1 -p tcp --dport 53 -j DNAT --to
10.0.0.10
iptables -t nat -I PREROUTING 1 -i eth1 -p udp --dport 53 -j DNAT --to
10.0.0.10
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 66.38.133.120
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 


After running an nslookup with a specified 66.38.133.120 server, I get
this output:


Chain INPUT (policy ACCEPT 106 packets, 8148 bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain FORWARD (policy ACCEPT 3 packets, 212 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    0     0 ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0          
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED 

Chain OUTPUT (policy ACCEPT 79 packets, 10458 bytes)
 pkts bytes target     prot opt in     out     source
destination         

----------------------- NAT TABLES ---------------------------

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    3   212 DNAT       udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          udp dpt:53 to:10.0.0.10 
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:53 to:10.0.0.10 

Chain POSTROUTING (policy ACCEPT 3 packets, 212 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    1    72 SNAT       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0          to:66.38.133.120 

Chain OUTPUT (policy ACCEPT 1 packets, 72 bytes)
 pkts bytes target     prot opt in     out     source
destination        



So, I can see that the PREROUTING table is getting ahold of the packets
and processing them on the udp port.  Further, I see POSTROUTING SNATted
one packet.  But, the client still gets a timed-out.



