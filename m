From: guillaume <guillaume.riviere@hcm.vsl-vn.com>
Subject: Re: Routing, SNAT and two ISPs
Date: Fri, 13 Aug 2004 07:38:28 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411C0D84.5010307@hcm.vsl-vn.com>
References: <D5C9032B2B09C64EA2409D6214E91AC905125E@asimail2.alphanumeric.com> <03ab01c48009$4f8a9640$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03ab01c48009$4f8a9640$0100a8c0@newlife>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Ming-Ching Tiew wrote:

>  
>
>>>Well, it's seams to be a little bit more complicated than
>>>I thought to loadbalance Internat connection between 2 (different) ISP
>>>lines ...
>>>
>>>Here is my problem:
>>>
>>>Basically, I need to connect my office to 2 differents ISP (different
>>>gateways and different DNS ). My linux box is a 3 NICs Box. The problem
>>>is that, for the first ISP, I don't have static Addresses.
>>>
>>>So, I would like to loadbalance, "route" and NAT all my internals
>>>      
>>>
>Addresses
>  
>
>>>through thoses 2 ISP except for some addresses and some port numbers
>>>which will use
>>>only the ISP2.
>>>      
>>>
>>have a look at:
>>http://linux-ip.net/html/adv-multi-internet.html
>>
>>    
>>
>
>I like this article because basically it brings out the issues of having
>dual
>internet connects. I work on it for a few months to realized these issues.
>I do not have a theory paper to present, however, I have a different
>IMPLEMENTATION of dual internet connections, it is mostly based on
>netfilter capabilities ( rather than route-based ), it can handle all sorts
>of
>combinations :-
>
>1. Static or non-static external IPs.
>2. Select outbound based on services.
>3. Select outbound based on aggregate bandwidth.
>4. Inbound traffic via multiple connections.
>
>And it fits into a diskette. :-) Check out the implementation at :-
>
>   http://www.geocities.com/mctiew/ffw/dual.htm
>
>  
>

Thank you very much for all of this,
Those articles are very useful.

As Alok Nath Upadhyay reply to me in another thread, there is also a 
very good How To
on the LLUG web site (www.linux.com.lb). But only for  load balance 2 
link to the same ISP
with the same gateway.

In fact, my two externals links are to differents: One is very 
slow/unstable.
Now, I would just like to swich my internal network in 2 parts and route 
the 1st part toteh first ISP and the second part to the second ISP.

With, later, a backup solution to all on one or the other line if there 
is a fall down ...

I try this, but, of course, it's not working ;-)
I cannot make connection/ping, nothing also from the router itself.
Is there a kind iptables/iproute2 Guru to help me on this ?

External Network 1:  Router External IP 1.1.1.1
                                     GateWay                1.1.1.2
                                     NetMask                  255.255.255.0

External Network 2:    Router External IP 1.1.2.1
                                       Gateway                1.1.2.2
                                        Netmask               255.255.255.0

Internal Network:   Router Internal IP   10.117.71.1
                                  NetMask                  255.255.255.0

I want to slpit my connection in 2 parts: ISP2 for 10.117.71.0/25 except 
for 2 servers
ISP1 for 10.117.71.128/25. And that all for a first step.

Thank you for help,
Guillaume


Here is my "script" for iproute2 (I'm a little bit basic with scripting 
...):
#!/bin/bash
#creation 17/05/2004

echo "Routing rules and tables"
echo "removing old rules"

ip rule del prio 50  table main
ip rule del prio 80  from 10.117.71.2           table 80
ip rule del prio 90  from 10.117.71.156         table 90
ip rule del prio 100 from 10.117.71.0/25        table 100
ip rule del prio 110 from 10.117.71.128/25      table 110

echo "flushing tables"
ip route flush table 80
ip route flush table 90
ip route flush table 100
ip route flush table 110

# Setting new rules
#######################
echo "Setting new routing rules"

# main table look first (default gateway here)
ip rule add prio 50 table main
ip route del default table main

# Specific defined Rules Here

# Server1 lookup table 80
ip rule add prio 80 from 10.117.71.2 lookup 80
ip route add 10.117.71.0/24 via 10.117.71.1 dev eth0 table 80
ip route add default via 1.1.1.2 dev eth1 table 80

# Server2 lookup table 90
ip rule add prio 90 from 10.117.71.156 lookup 90
ip route add 10.117.71.0/24 via 10.117.71.1 dev eth0 table 90
ip route add default via 1.1.1.2 dev eth1 table 90

# ISP 2  line for 10.117.71.0/25
ip rule add prio 100 from 10.117.71.0/25 lookup 100
ip route add 10.117.71.0/24 via 10.117.71.1 dev eth0 table 100
ip route add default via 1.1.2.1 dev eth2 table 100

# ISP 1 Line for  10.117.71.128/25
ip rule add prio 110 from 10.117.71.128/25 lookup 110
ip route add 10.117.71.0/24 via 10.117.71.1 dev eth0 table 110
ip route add default via 1.1.1.2 dev eth1 table 110

ip route flush cache


Here is my script for iptables:

#!/bin/bash
#creation 17/05/2004

echo "firewall constants setup"

# FLUSH the tables
iptables -t nat -F POSTROUTING
iptables -t nat -F PREROUTING
iptables -t nat -F OUTPUT

# SNAT

# Allow all access to http and https (port 80, port 443) only for http
iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 80  -j SNAT --to 
1.1.1.1
iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 443 -j SNAT --to 
1.1.1.1
iptables -t nat -A POSTROUTING -o eth1 -p udp --dport 53  -j SNAT --to 
1.1.1.1
iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 110 -j SNAT --to 
1.1.1.1

# Allow all access to http and https (port 80, port 443) only for http
iptables -t nat -A POSTROUTING -o eth2 -p tcp --dport 80  -j SNAT --to 
1.1.2.1
iptables -t nat -A POSTROUTING -o eth2 -p tcp --dport 443 -j SNAT --to 
1.1.2.1
iptables -t nat -A POSTROUTING -o eth2 -p udp --dport 53  -j SNAT --to 
1.1.2.1
iptables -t nat -A POSTROUTING -o eth2 -p tcp --dport 110 -j SNAT --to 
1.1.2.2


 



