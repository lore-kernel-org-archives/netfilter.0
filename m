From: xavier renaut <list.netfilter@natch.dyndns.org>
Subject: ip route + routing ip from one block to another
Date: Wed, 4 Jun 2003 17:05:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030604210538.GB14053@natch.8d.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

i saw a strange configuration the other day :



router 1.2.3.1 ----------- 1.2.3.6 eth0  FW  eth1 10.1.1.1 --- LAN
                 network					network here:
                 here :						10.1.1.0/24
                 1.2.3.1/29


until here, nothing strange, juste a FW which nat the lan workstations.
(with ipchains, nothing fancy :                 
ipchains -A forward -i eth0 -s 10.1.1.0/24 -j MASQ)


Now,

on the firewall, 
I do :    

ip route add nat 1.2.3.2 via 10.1.1.10
ip rule add from 10.1.1.10 nat 1.2.3.2

and it does what is expected !
ie 10.1.1.10 appears as 1.2.3.2,
everything allowed, ping, services...

ifconfig on the firewall is normal, there is no aliases of 1.2.3.2...
i don't know how the router knows about it. 
i expected the router  ask for a arp.
arp -a does not show 1.2.3.2.

i sniffed the arp traffic, but i only get router and fw arp traffic,
no mention of 1.2.3.2.

when i tcpdump, it is as if  1.2.3.2 was normaly routed to the lan...
i don't understand how this could be, since the 1.2.3.1/29
is supposed to be between the fw and the router, not behind the fw.

when i traceroute, i can traceroute to 1.2.3.2, as if it was 
behind/after 1.2.3.1.

can anyone explain how this works ?

is there a local route propagated to the router ?
(if so, how ? what protocol ? what tools to debug/view it ?)

thanks

-- 
xavier renaut

