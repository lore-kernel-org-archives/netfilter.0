From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fail-closed option? (Make all policies "drop" by default for
 newly created namespaces)
Date: Wed, 2 Jun 2021 00:49:57 +0200
Message-ID: <20210601224957.GA27608@salvia>
References: <u11ahpbsujy4632sneges8wa3@onionmail.info>
 <oa2za3itrr7y6213z39w1wmh8z@louhlbgyupgktsw7.onion>
 <19r19pzn6iqu0o0ww099iqi0su@onionmail.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19r19pzn6iqu0o0ww099iqi0su@onionmail.info>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mose@onionmail.info
Cc: netfilter@vger.kernel.org, mose.qo2t3b6c7yx5oqju.onion@onionmail.info

On Fri, May 28, 2021 at 01:09:34AM +0000, mose@onionmail.info wrote:
> Pablo Neira Ayuso:
> > Hi,
> > 
> > On Tue, Apr 13, 2021 at 11:25:49PM +0000, mose@onionmail.info wrote:
> > > Hi,
> > > 
> > > Is there any option to make newly created namespaces start in a fail-closed
> > > (policy drop) state by default? For example a sysctl option perhaps? I want
> > > traffic to be dropped in case nftables fails due to a syntax error or a
> > > missing interface or any other problem. The assumption being that a valid,
> > > atomically-loaded, nftables.conf will override it from inside the container
> > > at some point.
> > > 
> > > I came up with a workaround in a few of my containers by creating a separate
> > > "nftables-early.service" systemd service which happens Before=network.target
> > > and is WantedBy=network-pre.target (if I recall correctly). However this is
> > > dependent on the container OS (e.g. non-systemd OSes) and will never be as
> > > robust as a fail-closed kernel option would be.
> > 
> > I'm using 'ip netns' for instance.
> > 
> > # ip netns add test
> > # cat x.nft
> > table inet global {
> >          chain input {
> >                  type filter hook input priority 0; policy drop;
> >          }
> > }
> > # ip netns exec test nft -f x.nft
> > # ... now attach your veth to your container
> > 
> > Would this work for you?
> > 
> 
> Thanks for the input. I thought about that; setting up the network namespace
> and policies before any processes have the chance to run in it. That is a
> reliable solution, if you are doing your own configuration of the network
> namespace and then providing it to the container manager.
> 
> However, you lose the convenience of letting the container manager
> automatically create a new anonymous network namespace for the container. I
> guess arguably it should be the container manager's job to set default
> firewall policies, but none of them support this afaik.

Then it's just a matter of updating the container manager.

> Whereas a sysctl option would work regardless of the container
> manager and guest OS.
> 
> > Or you mean: No ruleset inside container => drop packets.
> > 
> > ie. make ruleset mandatory inside your container.
> > 
> 
> Same difference. Effectively the default policy for new namespaces (and the
> host at boot time; and after `flush ruleset`) is accept everything. If the
> nftables script fails to load, all policies remain "accept" even after
> interfaces are brought up and network services are started. If the default
> policy was drop, then everything would be dropped until an nftables script
> is successfully loaded or administrator intervention.

If the container manager sets up the default policy, and the new
policy fails to be loaded, then the transaction infrastructure rolls
back to the existing ruleset. Therefore, a ruleset that is
successfully loaded replaces the default to drop all traffic that has
been set up by the container manager.

> I would expect such an option to be disabled by default of course, but it
> could be enabled in situations where security is more important than
> reliability.
> 
> I checked netfilter sysctl and Kconfig options, but didn't see anything
> about changing the default policy.
> 
> https://www.kernel.org/doc/html/latest/networking/netfilter-sysctl.html
> https://www.kernel.org/doc/html/latest/networking/nf_conntrack-sysctl.html
> https://github.com/torvalds/linux/blob/master/net/netfilter/Kconfig
> https://github.com/torvalds/linux/blob/master/net/ipv4/netfilter/Kconfig
> https://github.com/torvalds/linux/blob/master/net/ipv6/netfilter/Kconfig
