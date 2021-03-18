From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Thu, 18 Mar 2021 18:00:17 +0100
Message-ID: <20210318170017.GA30939@salvia>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia>
 <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia>
 <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
 <20210317204220.GA13211@salvia>
 <CANf9dFOHgb+QNqVkWVsnP6ALSQxbPzyv8xA0LXyck39w3bUjwg@mail.gmail.com>
 <20210317222854.GA24692@salvia>
 <CANf9dFMzt+mZZS5SSYZbVY1M2VOz1wh3KEyUkfVeRMuMMc96yg@mail.gmail.com>
 <20210318162059.GA9120@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210318162059.GA9120@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Mar 18, 2021 at 05:20:59PM +0100, Pablo Neira Ayuso wrote:
> On Wed, Mar 17, 2021 at 10:23:04PM -0400, Martin Gignac wrote:
> > Hi Pablo,
> > 
> > I was finally able to reproduce the IPv6 lockup with the flowtable
> > counters turned on. I had conntrack -L running under 'watch' with some
> > greps to isolate the specific flow I wanted to check out. I also had a
> > tcpdump running on the OpenVPN tun interface and another tcpdump
> > running on the bonded VLAN interface to compare both.
> > 
> > When a lockup occurred, as I said earlier, I could see some packets
> > coming in on the bonded VLAN interface but not being sent out the tun0
> > interface. When those packets came in, I *did* see the packet count
> > increase by one for the "packet=" metric for that specific direction
> > for every one of those packets.
> > 
> > Sometimes, after some time being locked up, the state of the session
> > would move back to "ESTABLISHED [ASSURED]" (but traffic would remain
> > "stuck") until the point where traffic would suddenly resume, and then
> > the session would move back to "[OFFLOAD]" state again.
> > 
> > Commenting out the rule that offloaded IPv6 to the flowtable in the
> > ruleset. and reloading that ruleset with "nft -f rules.txt"
> > immediately fixed the lockup.
> > 
> > Am I the only person that's reported any kind of issue with flowtable
> > and IPv6? Maybe it's something about my setup...
> 
> My IPv6 testbed is working fine here.
> 
> I just checked that kernel-5.10.23-200.fc33 contains
> 
> commit 8d6bca156e47d68551750a384b3ff49384c67be3
> Author: Sven Auhagen <sven.auhagen@voleatech.de>
> Date:   Tue Feb 2 18:01:16 2021 +0100
> 
>     netfilter: flowtable: fix tcp and udp header checksum update
>     
>     When updating the tcp or udp header checksum on port nat the function
>     inet_proto_csum_replace2 with the last parameter pseudohdr as true.
>     This leads to an error in the case that GRO is used and packets are
>     split up in GSO. The tcp or udp checksum of all packets is incorrect.
>     
>     The error is probably masked due to the fact the most network driver
>     implement tcp/udp checksum offloading. It also only happens when GRO is
>     applied and not on single packets.
>     
>     The error is most visible when using a pppoe connection which is not
>     triggering the tcp/udp checksum offload.
> 
> which looks similar to your issue.
> 
> I don't have access to kernel 5.10.17-200.fc33.x86_64, it's been
> replaced in the mirrors I have access to by kernel-5.10.23-200.fc33.
> 
> It would be good to confirm you have this fix before looking somewhere
> else.

I just checked, 5.10.17-200.fc33.x86_64 already contains the fix above.
No need to check.
