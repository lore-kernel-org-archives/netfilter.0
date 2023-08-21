From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: failing fail-over - commit still in progress
Date: Mon, 21 Aug 2023 11:26:02 +0200
Message-ID: <ZOMtqtvQLZE38sfm@calendula>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
 <ZNYTF+uCod++Htl9@calendula>
 <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
 <ZNf013cGy81TcxoN@calendula>
 <18a0e2b8-dc7c-b9c6-77a7-8cfbe5fddb68@nethence.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <18a0e2b8-dc7c-b9c6-77a7-8cfbe5fddb68@nethence.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Philipp Braun <pbraun@nethence.com>
Cc: netfilter@vger.kernel.org

On Mon, Aug 21, 2023 at 09:19:21AM +0300, Pierre-Philipp Braun wrote:
> > - active: internal cache contains the flow that represents the SSH
> >    connection.
> > - backup: external cache contains the flow that represents the SSH
> >    connection.
> 
> I started from scratch a new PoC with two simple debian nodes and with only
> three interfaces, which eventually let me do the drop policy.
> 
> Before, I could see the states being synced on the internal/external cache.
> As far as I remember, I could see the states in the previous PoC even if it
> was only doing NAT, without any filtering.  Now it's even worse.  The backup
> node doesn't even see the states in its external cache (both with FTFW/UDP
> and NOTRACK/UDP).
> 
> Are tracking rules in the filter table absolutely mandatory to make the
> states known to conntrackd?  I ask that because, conntrack -L can see the
> local states without anything specific.

As I said before, you have to have a stateful ruleset which does not
pick up states from the middle.

> If so, does tracking rules initiated with nftables also work, or do I have
> to use iptables instead?

nftables is completely irrelevant in this picture. State
synchronization relies on ctnetlink and userspace conntrackd for state
synchronization. nftables is only the packet classification framework.

> If so, on which chains should I have absolutely have a drop policy (input /
> forward / output)?
> 
> Is there a MWE with nftables rules somewhere that I could test?
>
> > By "inbound session", I guess you refer to the SSH connection you use
> > for testing, but is this a SSH connection to the guest VM? Is this
> > DNAT to the guest VM or simply routing?
> 
> Yes, I was talking about a connection from the outside to a guest system
> behind DNAT.  Same goes for the new PoC, it's just that the VRRP nodes are
> now guest systems themselves.  To simplify the PoC (and have way less
> network interfaces, no bonding, no bridges, no vlans), I've put the gateways
> as guest and they now have only three interfaces.
> 
> eth0 -- front-facing
> eth1 -- internal network
> eth2 -- cluster network for the sync
> 
> so I could afford using a drop policy without too much headache.

Rule of thumb is: You have disable nf_conntrack_tcp_loose from
conntrack and a stateful ruleset which drops packets that are in
invalid state.

Otherwise, state synchronization does not make sense because conntrack
can pick connections from the middle, ie. you can implement "poor man"
failover and let conntrack recover the history from the middle.

> Ok, that helps not to loose SSH the connection immediately, but still, with
> the newer simple PoC I cannot even see the states replicated.

Can you see events on the active node with `conntrack -E`?

Did you debug with tcpdump on both ends to check to see if conntrackd
delivers the synchronization messages?

What do conntrackd stats tell you? There is a good number of options
that allow you debug your setup.

> I also noticed this setting, is that required?
> 
> net.netfilter.nf_conntrack_helper = 0

How are conntrack helpers related to the issue you describe?

> It would be nice to have a fully working MWE tutorial available, to be able
> to test the simplest active/passive setup.  I will be glad to document mine,
> if I finally manage to get it working.

Documentation is available here:

http://conntrack-tools.netfilter.org/manual.html
