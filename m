From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 16:42:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207101542.g6AFgm813002@vulcan.rissington.net>
References: <001601c22819$406b6a30$0300a8c0@W2KP01> <200207101457.g6AEvw812845@vulcan.rissington.net> <005801c22826$9490efb0$0300a8c0@W2KP01>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <005801c22826$9490efb0$0300a8c0@W2KP01>
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
To: netfilter@lists.samba.org

Mark; here is your ruleset, with my comments:

> $IPTABLES -P INPUT ACCEPT

With a default ACCEPT policy on INPUT, we can ignore any other rules in this 
chain unless they DROP or REJECT packets.

> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT

With a default ACCEPT policy on OUTPUT, we can ignore any other rules in this 
chain unless they DROP or REJECT packets.

> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP

We need FORWARDing rules to allow traffic.

> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
>
> $IPTABLES -A INPUT -p tcp --syn --destination-port 80 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --syn -j DROP

These rules will prevent any TCP connection being made to the firewall except 
on port 80.   Seems good.   Anything not TCP will be allowed in by default.

> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG

Allow stuff from outside to inside, allow stuff from inside to outside, then 
LOG anything else (such as inside to inside..... :-) before default DROPping 
it.

Therefore you need to add a rule:

$IPTABLES -A FORWARD -i $INTIF -o $INTIF -j ACCEPT

> $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j
> DNAT --to-destination 192.168.0.3:80

Don't need the above rule any more - just use the one below instead:

> $IPTABLES -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j DNAT --to
> 192.168.0.3

This will send any TCP port 80 requests coming in to the firewall's ext IP 
address, on to 192.168.0.3, no matter which way they came in to the firewall.

> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Hide outbound packets behind the ext IP of the firewall.

You also need to add the SNAT rule for packets from your internal LAN to the 
internal webserver:

$IPTABLES -t nat -A POSTROUTING -o $INTIF -s 192.168.0.0/24 -j SNAT --to 
192.168.0.1

So, add the FORWARD rule and the POSTROUTING SNAT rule, remove the first 
PREROUTING rule, and tell us what happens :-)

 

Antony.

