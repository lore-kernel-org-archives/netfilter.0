From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this config OK, plus where should I be logging...
Date: Sun, 4 Apr 2004 18:56:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404041856.26377.Antony@Soft-Solutions.co.uk>
References: <000401c41a6a$056c3690$0464a8c0@stu>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c41a6a$056c3690$0464a8c0@stu>
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

On Sunday 04 April 2004 6:26 pm, Stuart Lamble wrote:

> Is this config OK, plus where should I be logging...

We need a bit more information in order to answer either of those questions.

Two things we need to know which you haven't said are:

1. What services are supposed to be allowed from/to where, so we can comment 
on whether this ruleset does what you want it to?

2. What would you like to have logged, so we can advise where to do the 
logging?

Also a few more questions added at points through your ruleset:

> :INPUT DROP [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [0:0]
>
> -A INPUT -i lo -j ACCEPT
> -A INPUT -i eth1 -j ACCEPT

What is interface eth1 used for?   (We don't know if it's reasonable to accept 
all packets from there into the firewall - we can assume, but that wouldn't 
be an answer to your question.   Do you have only a single trusted machine 
there?   Do you have lots of machines with possibly trusted, possibly 
untrusted users?   Is it connected to the Internet?   We need more info....)

> -A INPUT -p icmp -j ACCEPT
> -A INPUT -p tcp -m tcp --sport 25 -j ACCEPT

Your firewall machine in running a mail client !?

> -A INPUT -i ppp0 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 25 -j ACCEPT

Your firewall machine is running a mail server !!!???

> -A INPUT -i ppp0 -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 443 -j ACCEPT
> -A INPUT -i ppp0 -p tcp -m tcp --dport 10000 -j ACCEPT

What's that supposed to be for?

> -A INPUT -i ppp0 -p udp -m udp --sport 53 -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 192.168.100.0/255.255.255.0 -j ACCEPT

That's a nice way to allow spoofed packets through your firewall....

> -A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 22 -j ACCEPT
> -A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 7783 -j ACCEPT

What's that for?

> -A OUTPUT -s 127.0.0.1 -j ACCEPT
> -A OUTPUT -o eth1 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --sport 80 -j ACCEPT

You allowed in packets addressed to ports 80 and 443 - how come you only allow 
out reply packets from 80?

> -A OUTPUT -p tcp -m tcp --sport 25 -j ACCEPT
> -A OUTPUT -p tcp -m tcp --sport 22 -j ACCEPT

You allowed in packets to port 10000 - you don't allow the replies out again?

> :PREROUTING ACCEPT [10:1191]
> :POSTROUTING ACCEPT [1:48]
> :OUTPUT ACCEPT [0:0]

So, you set up a nice default DROP policy, added some ACCEPT rules allowing 
the traffic you want, and then change the policy to ACCEPT so that everything 
is allowed (and you don't have any DROP rules).   You may as well not bother 
with the OUTPUT ACCEPT rules - it's all going to get ACCEPTed anyway.

> -A PREROUTING -i ppp0 -p tcp -m tcp --dport 555 -j DNAT --to-destination
> 192.168.100.6:22
> -A PREROUTING -i ppp0 -p tcp -m tcp --dport 7783 -j DNAT
> --to-destination 192.168.100.6:7783
> -A POSTROUTING -s 192.168.100.0/255.255.255.240 -o ppp0 -j MASQUERADE

You seem confused about your network size.   Here you've used a 20 bit netmask 
- earlier you used a 24 bit (on the FORWARDing rule).   Probably best to be 
consistent (what subnet mask are you using on the eth1 interface, and on the 
client machines?)

Also, by the way, what happened to interface eth0?

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


