From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: are these enough now?
Date: Fri, 4 Oct 2002 20:13:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021004191400.YGEY459.mta02-svc.ntlworld.com@there>
References: <200210041218.26636@.> <200210041309.g94D9ML10904@vulcan.rissington.net> <200210042048.36993@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210042048.36993@.>
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

On Friday 04 October 2002 4:22 pm, PayalR wrote:

> Hello all,
> Thanks a lot for the time and patience. I have written the script and am
> posting it here. If such kind of posting is not allowed please tell, so
> next time I will post it on a webpage and paste the link. But since ppl.
> might be reluctant to launch there browsers for this thing, I took the
> liberty of pasting it here.
> I have a single PC with all servers on the same machine.
> I am not forwading anything.
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
>
> [Is this OUTPUT rule OK?]

This is okay, provided you have a rule to allow reply packets out (you have - 
that's the ESTABLISHED,RELATED rule below) and also rules to allow out any 
connections you expect to be initiated from this machine (most likely being 
DNS lookups - agin, you do have these later on).

> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 21 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 23 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 25 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 53 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 110 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 143 -j ACCEPT

> iptables -A INPUT -i eth0 -p tcp --dport 161 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 162 -j ACCEPT

You don't need these last two - SNMP uses UDP, not TCP.

> iptables -A INPUT -i eth0 -p tcp --dport 3306 -j ACCEPT
>
> iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 161 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 162 -j ACCEPT
>
> [udp for these are sufficent I guess]

Correct, but remove UDP 162 inbound, because you only need to send SNMP 
traps, you are not expecting to receive them.

> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> [please see if the state rule looks OK?]

Yes.

> iptables -A OUTPUT -i eth0 -p tcp --sport 21 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 22 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 23 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 25 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 53 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 80 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 110 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 143 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 161 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 162 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 3306 -j ACCEPT

Remove all of the above rules.   They are not needed because you have the 
ESTABLISHED,RELATED rule which will allow out the reply packets to all the 
onews you let in in your INPUT chain.

> [is the tag --sport appropriate here? or do I have to use --dport? I always
> get confused between the usage of these two :)]

It would be correct, yes, if you needed the rules.   The way to remember 
whether it's Source port or Destination port is that services are requested 
by clients, and servers a sitting there listening on specific port numbers, 
waiting for a client to ask for something.   Therefore the server is the 
destination of the request, and it is listening on the correct port numbers 
for whatever services it is offering.   Therefore a client sends its requests 
to the server's destination port.   When the server replies, it replies from 
the same port, so the responses come from the server's source port.

> iptables -A OUTPUT -i eth0 -p udp --sport 53 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p udp --sport 161 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p udp --sport 162 -j ACCEPT
>
> [udp here also seems enough]

No, add TCP for DNS on port 53 as well.

Remove UDP 161 outbound; you only need this inbound, for a device being 
monitored but not monitoring anything else.

> Shall I block ICMP?

No !!!   ICMP is a very important part of traffic management, and you should 
not block it outright.   However, I cannot think of any ICMP message codes 
you should explicitly allow on this system, since everything you need should 
be handled by you ESTABLISHED,RELATED rules (ICMP forms the bulk of the 
RELATED category, except for things like ftp).

> I intend to have some logging for SMTP, HTTP and POP3.
> I have yet to formulate the rules for them. I will do it in day or two and
> let ask here for opinion.

If you use syslogd to send log messages to a remote machine you will need to 
allow UDP port 514 out of your server.

> p.s I will drop the telnet also in a day or two :)

Good :-)
 

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

