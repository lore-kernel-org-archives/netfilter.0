From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding (continued)
Date: Mon, 8 Jul 2002 08:54:26 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708075428.SHXU2755.mta05-svc.ntlworld.com@there>
References: <004b01c2263b$9812cc90$1606d6d1@nebuchadnezza> <20020708020553.MITF4119.mta06-svc.ntlworld.com@there> <001201c2264a$ce154110$2002d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001201c2264a$ce154110$2002d6d1@nebuchadnezza>
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
To: iptables-list <netfilter@lists.samba.org>

On Monday 08 July 2002 7:40 am, Tim wrote:

> I'm pinging from INTERNAL = 192.168.1.4 and DMZ = 172.16.1.3 each one of
> these machines has their own respective default gateway which are INTERNAL
> = 192.168.1.11 and DMZ = 172.16.1.1
>
> I agree the routing table looks a little odd in the sense (from my
> perspective) that there are only two interfaces that have a default
> gateway.

Slightly inappropriate terminology here.   A 'default gateway' does not apply 
to an interface, it applies to a whole machine; there should only be one 
default gateway on a machine (under most normal circumstances); and your 
machine does not have a default gateway.

Here is what you said your routing table on the firewall is:

Destination     Gateway         Genmask         Iface
192.168.2.0     192.168.2.2     255.255.255.0   eth0
192.168.2.0     *               255.255.255.0   eth0
172.16.0.0      *               255.255.255.0   eth1
192.168.1.0     *               255.255.255.0   eth2
172.16.1.0      172.16.1.1      255.255.255.0   eth1
172.16.1.0      *               255.255.255.0   eth1
127.0.0.0       *               255.0.0.0       lo

A default gateway is the address of a router to be used for any packets which 
don't match some other more specific route, and it is recognisable because 
the destination IP is 0.0.0.0 and the netmask is 0.0.0.0 (ie 'match 
everything').

> The actual ip addresses on the firewall box are
> .eth0 = 192.168.2.1 / eth1 = 172.16.1.1 / eth2 = 192.168.1.11.

> > Also, what are the routing tables on the machine you're pinging from, and
> > the machine you're pinging to ?
>
> Does this mean that the default gateways (the NICs on the firewall box) are
> not enough to route the packet through?

No, it just means I wanted to check they were correct :-)

> I just added a route to box 192.168.1.4 (an NT box INTERNAL) "route add -p
> 172.168.1.0 mask 255.255.255.0 192.168.1.11", and a route to box 172.16.1.5
> (another NT box in the DMZ)  "route add -p 192.168.1.0 mask 255.255.255.0
> 172.16.1.1", to no avail....this can't be the answer.

These entries are completely redundant.   You said in your last answer that 
each of these machines already had a default route of the address of the 
firewall on their respective networks.   Adding a more specific route to the 
other network, still using the firewall's IP as the gateway address, adds 
nothing to this (however it subtracts nothing either, so no harm done).

The routes on the machine you're pinging from (172.16.1.3) looks okay, and 
the routes on the machine you're pinging to (192.168.1.4) looks okay, however 
I still don't like the routes on your firewall now that you've told me what 
your IP addresses are.

Referring back to your firewall routing table listed above, I don't like the 
two lines with gateways listed.   They should not be there; the lines 
immediately following each of them handle routing to those two local networks.

Also, I don't quite understand why you have the line
172.16.0.0      *               255.255.255.0   eth1
in the table ?

Here's a quick routing table tutorial:

1. Packets being sent to a directly connected network (eg in your case 
192.168.1.0/24, 192.168.2.0/24 and 172.16.1.0/24) should only specify the 
interface name through which to send the packets - there should be no gateway 
listed, because the destination machine on the locally connected network is 
directly accessible without going through a gateway.

2. Packets going to networks not directly connected to the machine, but 
accessible on the other side of some router which is directly connected 
should be specified with the gateway address = IP of the router on the local 
network, and the interfacce = where the router is plugged into.

3. A default gateway (addr = 0.0.0.0, mask = 0.0.0.0) specifies where to send 
any packets which do not match any of the previously listed rules, and the 
gateway addr = IP of the router on the local network which knows how to send 
packets out to the Big Wide World.

Try removing the two entries in your firewall routing table which show 
gateway addresses:

192.168.2.0     192.168.2.2     255.255.255.0   eth0
172.16.1.0      172.16.1.1      255.255.255.0   eth1

Then re-run the pings and see what happens.

By the way, can you ping from the firewall to either/both of the machines ?

I assume your physical network cables are plugged in correctly and work :-) ?
Do you have link lights at both ends of all connections ?

 

Antony.

