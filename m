From: "Eric Poulin" <epoulin@onepost.net>
Subject: Re: Output Chain Problem...
Date: Fri, 18 Jun 2004 09:28:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009b01c45538$1ab69780$800101df@lvl.digidyne.ca>
References: <005d01c45531$f6f4bfd0$800101df@lvl.digidyne.ca> <200406181402.51862.Antony@Soft-Solutions.co.uk>
Reply-To: "Eric Poulin" <epoulin@onepost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Good Day Anthony

> >     Now, packet flow through a chain from top to bottom, and will hit
the
> > Default Policy if no rules are match... My first test was to put those
> > rules in my output chain(That was completly empty before).
> >
> > iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> > iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT
> > iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>
> That second rule suggests to me that you are slightly mistaken about what
> packets go through the OUTPUT chain - you have allowed all packets sourced
> from an entire Class C, so I suspect you think that all packets from your
> local network, which pass through the Firewall, are traversing the OUTPUT
> chain?

Not really, I got several virtual IP on my NIC facing the internal Network,
so some packet will sent from my firewall(like those coming from it while
i'm doing ssh in it), and I have decided to set the entire subnet. Remember
this is a test, I'm doing large rule to make it works first...

>
> In fact, the only packets which go through OUTPUT are those originating on
the
> machine itself - any which are being routed through it go through FORWARD
> instead (and they don't go through INPUT, either...).

Like I said, I'm troubleshooting a ssh connection between internal machines
and my firewall, since I'm allowing ssh from the inside only towards the
firewall. I need to accept some data on my OUTPUT chain to receive response
from my Firewall.

> >     After this, I did try to set the Default policy to drop...
Strangely, I
> > lost my ssh connection(but as expected, all my NAT rules continued to
work
> > perfectly).
>
> Do you mean for connections which were already in place (ESTABLISHED), or
new
> ones which you set up after changing the rules?   Bear in mind that
existing
> connections will largely be handled in the background, rather than by your
> ruleset - most rules only apply to the first packets of new connections.

iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

This rule accept all of them actual, which is pretty similar to accept
everything with checking the state. (I believe).

> >     To my surprise, nothing seems to hit my LOG rule, and even the
overall
> > ACCEPT rule... But again, as soon as I change the default policy to
DROP, I
> > can't communicate with the box.
>
> And when that happens, do you get any packets LOGged before being DROPped?
> I'm not too surprised nothing gets logged when it's working (as I
explained
> above, those will probably be established connections), however I *would*
> expect something to get logged when you cannot connect.   Basically, you
want
> to log when there's a problem, not when it's working fine :)

The problem can be simplify as the following. Everything is fine now,
because my Default Policy is set to ACCEPT. Following "Best Practices", I
would prefer to set it to "DROP" and only allow what I need. The problem is
that I have rules that ACCEPT my ssh response packet form the firewall
perfectly. PLease check the counters:

Chain OUTPUT (policy ACCEPT 19 packets, 2060 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 ACCEPT     all  --  *      *       127.0.0.1
0.0.0.0/0
    3543   625244 ACCEPT     all  --  *      *       192.168.0.0/24
0.0.0.0/0
      36     3240 ACCEPT     all  --  *      *       66.11.160.119
0.0.0.0/0
       6     1948 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0
       0        0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `Output:'


The second rule accept almost everything. Witness the counters for the last
2 rules, they are set to ZERO. This means that all packets are being
ACCEPTed in the first 4 rules, therefor, it shouldn't hit the bottom of the
chain, making the Default Policy to apply. If I set the Default policy to
drop with iptables -P OUTPUT DROP, I'm loosing my ssh connection, which
means that a packet HIT the Default Policy, which is at the bottom of the
chain, under my LOG rule.... But since nothing is logged, the packet is
being accepted before, so it shoudn't hit the Default policy.

If I put back the default output policy to ACCEPT, everything is fine... I
don't know if you understand my point, or if I'm wrong...

Eric



