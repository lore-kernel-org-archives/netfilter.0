From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: redirection in local private network problem
Date: Wed, 18 Feb 2004 22:54:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402182254.16865.Antony@Soft-Solutions.co.uk>
References: <1077143903.4033e95f5366f@archi.szn.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077143903.4033e95f5366f@archi.szn.pl>
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
To: netfilter@lists.netfilter.org

On Wednesday 18 February 2004 10:38 pm, archi@archi.szn.pl wrote:

> Hello,
>
> thanx Antony Stone :)

You're welcome :)

> I want to loop information in private network with IPtables. A host in
> local network must get through public IP to another host in the same local
> network. This is required to get WWW portal information from a specified
> internal host in the same way from local and external (public) network.

You really should solve this in one of the following ways:

1. Place the server on a DMZ network, separate from your internal LAN (and 
also separate from the public Internet), so that both internal and external 
machines can access it by the same IP address, and that IP address will 
always get routed across the firewall.

2. Run a split DNS so that internal queries get the private address (and can 
access it directly); external queries get the public address (and can access 
it through the firewall).

Method 1 is the recommended solution (for all the reasons why people use DMZ 
networks), and solution 2 will only work if your internal machines are 
accessing the server by hostname rather than knowing its public address 
directly.

Anyway, I'll assume for a moment that you have a really really good reason not 
to do either of the above, and that you really do want to redirect the public 
address to an internal address on the same network as the client....

> iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 1025 -j
> DNAT - -to-destination 192.168.1.250:80
>
> But I tried many combinations to do this for local network and I couldn't
> do this. The comunication shud be like this:
> - a computer in local network e.g. 192.168.1.10 by WWW shoud get through
> 1.2.3.4:1025 and shoud be transfered to 192.168.1.250:80
>
>            (router with NAT: eth0:192.168.1.1 , eth1:1.2.3.4)

You need two rules, one in PREROUTING (to redirect the packets to the server) 
and one in POSTROUTING (to redirect the replies to the client):

# Redirect all packets to 1.2.3.4:1025 (no matter where from)
# to 192.168.1.250:80
iptables -A PREROUTING -t nat -d 1.2.3.4 -p tcp --dport 1025 -j DNAT --to 
192.168.1.250:80
# Anything from the local network to 192.168.1.250:80 must look like it
# came from the firewall so the replies work too
iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -d 192.168.1.250 -p tcp 
--dport 80 -j SNAT 192.168.1.1

Of course you still need the FORWARD rule to allow packets to get to the 
server as well:

iptables -A FORWARD -d 192.168.1.250 -p tcp --dport 80 -j ACCEPT

Let us know how you get on with this (and don't complain about the web server 
logs showing all internal clients as the same IP address - that's one of the 
disadvantages of not putting the server on a DMZ...:)  )

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


