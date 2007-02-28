From: Frank.Mayer@knapp-systems.com
Subject: Antwort: NATing problem / question
Date: Wed, 28 Feb 2007 01:41:00 +0100
Message-ID: <OF7E671994.FEB8C3D6-ONC1257290.00000780-C1257290.0003C12A@knapp.com>
References: <A28553A7-1A00-4326-BC13-1076574BA129@paglayan.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A28553A7-1A00-4326-BC13-1076574BA129@paglayan.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Paglayan <andres@paglayan.com>
Cc: netfilter@lists.netfilter.org

Hi there,

the problem is not at all puzzling if you know what's happening at that 
"SNAT":
the firewall acts like a transparent proxy in your case.
For any outgoing connection, the firewall generates a mapping:

+source address/source port in the local network
+destination address/destination port in the "public" network
resulting in: NAT address/NAT port for the "public" network

Now, when a packet arrives at the firewall, it can check its source 
adress/
source port and destination address/destination port and thereby find out 
which local machine this packet should be forwarded to. (Both need to 
match,
since there may be many local machines connecting to the same public
server concurrently!)
This is how any number (OK: almost any number, since there are no more 
than 
65335 ports numbers available) of client machines behind such a NAT-device 

can share one IP address for (almost) any number of concrrent connections.
Some people - Cisco experts, for example - call this mechanism "port 
address 
translation", since in fact different IP addresses get translated into 
different
port numbers.

In your case, however, the firewall has a mapping for destination 
172.16.2.34,
but none for 172.16.2.35, so it cannot forward the packets correctly.

One possible solution for your problem:
There's an iptables target called "NETMAP" that might be helpful:
it statically translates one ip network into a different range of the same 
size, e.g.

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 172.16.2.34 -j NETMAP 
--to 192.168.50.0/24
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 172.16.2.35 -j NETMAP 
--to 192.168.50.0/24

iptables -t nat -A PREROUTING -s 172.16.2.34 -d 192.168.50.0/24 -j NETMAP 
--to 192.168.1.0/24
iptables -t nat -A PREROUTING -s 172.16.2.35 -d 192.168.50.0/24 -j NETMAP 
--to 192.168.1.0/24

This would in fact translate IP addresses instead of port numbers:

the first two rules would translate e.g. 192.168.1.1 to 192.168.50.1 when 
connecting to any valid IP
of that SQL server, 

and the second two lines would ensure that anything coming back from one 
of the two addresses
would get mapped back to the machine the data is actually intended for.

You should definitely add some filter rules for those connections, 
however, because otherwise
anyone having access to that SQL server would be able to connect to your 
home hetwork!

I happen to know that IPCop 1.4.11 at least does support the 
NETMAP-target, but I'm not sure
how to configure that.

Hope this helps,

  Frank 

netfilter-bounces@lists.netfilter.org schrieb am 27.02.2007 22:56:13:

> Hello,
> 
> I have a NATing problem,
> 
> I use an IPCop firewall and router,
> 
> eth0 has 192.168.1.1 and connects to my LAN 192.168.1.0
> 
> eth1 connects to my bridged DSL modem (public IP)
> 
> eth2 has 192.168.50.1 and connects to a Cisco 2800 router (at 
> 192.168.50.254) which routes via a dedicated T1 to a hospital,
> 
> eth3 is unused,
> 
> I connect to the following subnets at the hospital,
> 
> 172.22.0.0 255.255.254.0
> 172.16.0.0 255.255.254.0
> 172.17.0.0 255.255.254.0
> 
> so I added the following routes
> 
> route add -net 172.17.0.0/23 gw 192.168.50.1
> route add -net 172.16.0.0/23 gw 192.168.50.1
> route add -net 172.22.0.0/23 gw 192.168.50.1
> route add -net 192.168.50.0/24 gw 192.168.50.1
> 
> 
> but, since the hospital has its own 192.168.1.0 subnet (equal to mine),
> besides routing, I had to enable NATing, ('cause I wasn't getting any 
> traffic back)
> 
> I did so by
> 
> iptables -t nat -A POSTROUTING -d 172.17.0.0/23 -j SNAT --to 
> 192.168.50.1
> iptables -t nat -A POSTROUTING -d 172.16.0.0/23 -j SNAT --to 
> 192.168.50.1
> iptables -t nat -A POSTROUTING -d 172.22.0.0/23 -j SNAT --to 
> 192.168.50.1
> iptables -t nat -A POSTROUTING -d 192.168.50.0/24 -j SNAT --to 
> 192.168.50.1
> 
> and can connect to those subnets,
> 
> ...BUT!
> 
> one services is a MS-SQL database,
> it runs on a virtual machine with IP 172.16.2.34
> while the physical machine has IP 172.16.2.35
> I can perfectly ping 2.34 and 2.35 distinctively from my LAN
> 
> when I launch the client application that needs to connect
> my requests are sent to 2.34 (the virtual machine), but I am getting 
> responses back from 2.35 (the physical machine's IP)
> so those are not traversing NAT back to me and no connection is 
> established,
> 
> 
> the puzzling thing is that,
> 
> If I connect a regular wan router (like those linksys) to the cisco, 
> (thus bypassing my IPCop box)
> and a laptop to the router's switch,
> and launch the app, it will connect to the SQL server,
> 
> then, when I put everything back, and re-launch the app from my NATed 
> by IPCop LAN
> it also runs,
> 
> It fails on making the first run, but once is done because of 
> bypassing, it will run,
> 
> Hospital people had open a ticket with MS, and forwarded them the 
> captured packets,
> (it's to my understanding an MS problem, but I have to provide a 
> solution)
> 
> I think my alternatives are:
> 
> 1.
> doing one to one nat, meaning every internal address (in the 
> 192.168.1.0)
> translates into an external address (in the 192.168.50.0) ,
> 
> but I don't know how to do it, I can learn though,
> 
> 2.
> changing my LAN to i.e. 192.168.51.0 so no NATing is needed,
> 
> Is there any other?
> 
> what will you recommend?
> 
> any pointer towards the right documentation in how to do it?
> 
> Many, many thanks in advance
> 
> 
> 
> 
> 


