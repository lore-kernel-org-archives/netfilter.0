From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 13:55:03 -0400
Message-ID: <201205141355.03803.neal.p.murphy@alum.wpi.edu>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <201205140326.09455.neal.p.murphy@alum.wpi.edu> <CAEjQA5KY-6k-mFny8g=Gw8v+PZBh6tP9r4TaX+Gv3Y7V6b9aTw@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEjQA5KY-6k-mFny8g=Gw8v+PZBh6tP9r4TaX+Gv3Y7V6b9aTw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 14 May 2012 04:18:23 C. L. Martinez wrote:

As written and presented, your rules:
> > As written, your rules
> >  1. Allow all packets for established conns and the first packet for
> > related conns to pass.
> >  2. Allow all packets for new conns from the host to pass
> >  3. Drop all other packets.

Unless I grossly misread, this is what your rules do.

Either these are the rules you are using and you've found they don't work they 
way you expect, or you have provided the list with an incomplete set of rules 
and an incomplete problem statement.

> 
> Sorry Neal, but exists some things in your answer that I don't understand
> ...
> 
> In line:
> > To restrict that host to a particular LAN and allow other hosts through,
> > these rules in table 'filter':
> > -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -s 172.24.50.3/32 -m state --state NEW -j ACCEPT
> > -A FORWARD -j LOG --log-prefix "IPT FORWARD packet died: "
> > 
> > should be:
> > -A FORWARD -s 172.24.50.3/32 -d a.b.c.d/netmask \
> >  -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> 
> Why this rule??:

TCP/IP traffic is bi-directional. You must control the traffic in both 
directions.

You said you wanted to allow traffic from that host to a particular, but 
unspecified, LAN; you did not say you wanted to allow hosts on that LAN to 
initiate conns to that host. The only correct and definitive way to reach your 
stated goal is to
  -  allow new and related packets and packets for established conns to
     flow from that host to that LAN
  -  allow only related packets and packets for established conns to flow
     from that LAN to that host
  - explicitly block all other traffic between that host to all other LANs
  - explicitly allow all other traffic
You didn't provide a complete problem statement, only that a particular host 
is to be allowed to communicate (initiate conns) only with a particular LAN. 
Therefore I made the assumption (based on your incomplete rules) that you 
wanted to allow all other traffic.

> > -A FORWARD -s a.b.c.d/netmask -d 172.24.50.3/32 \
> >  -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -s 172.24.50.3/32 \
> >  -j LOG --log-prefix "FORWARD dropped packet from 172.24.50.3: "
> 
> Why this rule??: by default all is denied if it is not exists an
> established and related connection.
> 
> > -A FORWARD -s 172.24.50.3/32 -j DROP
> > -A FORWARD -d 172.24.50.3/32 \
> >  -j LOG --log-prefix "FORWARD dropped packet to 172.24.50.3: "
> > -A FORWARD -d 172.24.50.3/32 -j DROP

Simple logic. Filtering 101. You must handle more specific conditions before 
you can handle more general conditions, and you must handle the traffic in 
both directions. You could eliminate a couple rules by using negative logic. 
But you'll be sorry next year when you can't recall your convoluted logic to 
make sense of the negative logic. The rules I presented make it very clear 
that (1) conns from that host to that LAN and related conns from that LAN to 
that host are allowed, (2) traffic between that host to anywhere else is 
prohibited.

There is no such thing as an 'established and related' conn. There can be a 
NEW packet (the first packet of a new conn). There can be a RELATED new packet 
(the first packet of a new conn that a helper has determined to be related to 
an existing conn). And there are ESTABLISHED conns. Once a conn is 
established, it is not possible to determine if it started with a NEW packet 
or a RELATED packet. I recently spent a week puzzling through this to finish 
making a new UI for my firewall work correctly. Netfilter has limitations that 
must be understood before you can work with or around them.

> 
> Why this rule??:
> > -A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> 
> I only want to allow related and established connections ... not new
> if it is not explicit allowed.

So delete that rule. Now the only traffic that will be forwarded will be NEW, 
RELATED and ESTABLISHED packets from that host to that LAN, and RELATED and 
ESTABLISHED packets from that LAN to that host; no other traffic shall be 
forwarded across the router until you add rules that explicitly allow it.

It might be helpful if you provided a complete problem statement.
