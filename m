From: <lists@sterenborg.info>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 22:35:29 +0200
Message-ID: <1245875729.3765.48.camel@tanjian>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
	 <200906241320.13779.christoph.paasch@gmail.com>
	 <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
	 <200906241347.41841.christoph.paasch@gmail.com>
	 <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
	 <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
	 <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
	 <bf0e93a30906241110g3f6ab35al583c451c2ca2b777@mail.gmail.com>
	 <2546.87.196.56.230.1245872403.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2546.87.196.56.230.1245872403.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 2009-06-24 at 20:40 +0100, Jorge Bastos wrote:
> > Hi Jorge,
> >
> > Well, the scenary is that you want to allow outgoing traffic to tcp
> > port number 22 from your internal LAN.
> >
> > The rules suggested
> >
> >
> > 1) $ipt -P FORWARD DROP
> > 2) $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> > 3) $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT
> >
> >
> > are for:
> >
> > 1) Apply a POLICY to DROP any packet that does not match any rule in
> > the chain (in this case, the FORWARD chain)
> >
> > 2) Allow incoming traffic in response to traffic generated from your
> > internal network or from the GNU/Linux router itself. If you does not
> > use that rule (the second rule) you will not able to "speak" with the
> > world

No, not really.

Packets travel only one chain in the filter table: either the INPUT,
OUTPUT or FORWARD chain. Packets *for* the Linux host travel the INPUT
chain, packets *from* the Linux host travel the OUTPUT chain, packets
*routed through* the Linux router travel the FORWARD chain.
Since the FORWARD chain is used here, this rule will only match packets
of which routing determined that the packet was not sent to or from the
Linux host (at the risk of getting slapped because of not explaining it
right).

http://www.shorewall.com.au/misc/netfilterflow.pdf
http://jengelh.medozas.de/images/nf-packet-flow.png

The second chain allows all packets going from the internet to LAN and
vice versa, thus in or out, that are know to be in an already accepted
connection. That may be good, bad or something in between, depending on
what you want the complete ruleset to do.

> > 3) Allow packets marked with the SYN flag to travel to the world, but
> > if the second rule does not exists, the traffic in response to the
> > initial request to initiate a ssh sesion will not receive an answer
> > from the world.

The --syn flag was not used but in this case the result would be the
same.. AFAIK the first tcp packet in a connection that is in NEW state
normally carries the syn flag. If not, it may be a portscan or
something. This doesn't go for the other protocols like udp and icmp
which don't have a syn flag so it can't be specified in non-tcp rules.

> > I suggest you try to understand the mechanics to establish a tcp sesion.
> 
> 
> Thanks alot!
> This inicial part helps.

Without meaning to be rude..
I don't see how you are helped more now than before. The ruleset hasn't
changed and before you said it doesn't suit you, because it would allow
more than you wanted. You haven't shown a more detailed scenario of what
you actually want so no advice could be given to change the ruleset to
what you want it to do. (Yes: this example ruleset is too permissive if
you ask me, but it was meant as a working example.)

> I know how to do basic filtering with input/output, and i was doing nat
> filtering with the PREROUTING chain and it was easy, now things got a bit
> complicated for me :-) i have to study again... last time i did this was
> more than 5 years ago, i have to RElearn iptables basics!

So perhaps Oskar's IPTables Tutorial really would be a good place to
start. It has all the basics in it and more. I know it's a bit dated
(last change seems to be from 2006) but the basics still hold.


-- Rob


