From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables DNAT algorithm -- another way?
Date: Fri, 12 Dec 2014 20:26:24 -0500
Message-ID: <201412122026.24755.neal.p.murphy@alum.wpi.edu>
References: <548B8069.4020802@brandeis.edu> <201412121950.59768.neal.p.murphy@alum.wpi.edu> <CAGYMsbv13h1gdt7U=690Hepx0MAmxTWqR2wFSO2-aoyiwWVOpg@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGYMsbv13h1gdt7U=690Hepx0MAmxTWqR2wFSO2-aoyiwWVOpg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday, December 12, 2014 08:06:42 PM John Miller wrote:
> On Fri, Dec 12, 2014 at 7:50 PM, Neal Murphy <neal.p.murphy@alum.wpi.edu> 
wrote:
> > On Friday, December 12, 2014 06:55:21 PM John Miller wrote:
> >> Hi folks,
> >> 
> >> We're running a server that scan local systems for installed SSL
> >> certificates.  Problem is, the tool truly means local -- RFC1918 private
> >> ranges only, please.  Being a university, we have quite a few things
> >> located in public IP space that aren't necessarily world-accessible
> >> (development servers and the like).
> >> 
> >> My solution thus far has been to use DNAT to trick our scanning program
> >> into thinking it's using local addresses.
> >> 
> >> iptables -t nat -A OUTPUT -d 172.16.x.y -j DNAT \
> >> 
> >>      --to-destination 129.64.x.y
> > 
> > This might point you in the right direction:
> > 
> > iptables -t nat -A PREROUTING -s 172.16.0.0/16 \
> > 
> >   -j DNAT --to-destination 129.64.0.0-129.64.255.255
> 
> Thanks for your response, Neal.  These are for TCP streams that I'm
> initiating, so I'm pretty sure the OUTPUT chain is what I want here.
> As for the range in --to-destination, it's as you say: mappings aren't
> predictable.  Was hoping someone on the list knew the innards of the
> DNAT target and whether there were other options besides
> --to-destination.  Alternatively, was wondering if the mangle table
> might be able to do what I'm looking for.  Definitely open to
> suggestions!
> 
> John

Traditionally, DNAT must be done in the nat table in PREROUTING (change the 
destination address before any routing decisions are made). Likewise, SNAT 
must be done in the nat table in POSTROUTING (change the source address after 
all routing decisions are made).

Things might've changed with recent versions of netfilter and iptables.
