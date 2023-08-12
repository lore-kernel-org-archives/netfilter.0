From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: failing fail-over - commit still in progress
Date: Sat, 12 Aug 2023 23:08:39 +0200
Message-ID: <ZNf013cGy81TcxoN@calendula>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
 <ZNYTF+uCod++Htl9@calendula>
 <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Philipp Braun <pbraun@nethence.com>
Cc: netfilter@vger.kernel.org

On Sat, Aug 12, 2023 at 12:52:19PM +0300, Pierre-Philipp Braun wrote:
> 
> > Three nodes and FT-FW mode will not work. FT-FW would need to be
> > extended to maintain sequence tracking for more than one single node.
> > It is doable but this requires development effort.
> > 
> > For three node, you should try NOTRACK which means sync messages are
> > sent from active to passive nodes without any kind of sequence
> > tracking (best effort approach).
> 
> I switched to NOTRACK UDP but I get the same issue with the commit.
> 
> The inbound session is seen alright on all the nodes, although node3 (active vrrp) sees it both in internal and external cache.
> The host where the guest lives sees it only in the internal cache this time.

You should see:

- active: internal cache contains the flow that represents the SSH
  connection.
- backup: external cache contains the flow that represents the SSH
  connection.

on failover, what you see in the external cache in the backup node
will be visible in the internal cache.

By "inbound session", I guess you refer to the SSH connection you use
for testing, but is this a SSH connection to the guest VM? Is this
DNAT to the guest VM or simply routing?

Such guess VM gets migrated to the active node and the active node
forwards traffic to the guest VM?

From what you write, there is no state synchronization issue with
NOTRACK with three nodes.

If connection gets lost on failover, it might be also be related to
your firewall policy. If the state is not yet in conntrack, NAT
packets will be handled as local packet by the router, not the guess
itself, likely being rejecting them with TCP RST.

Dropping packets that are in invalid state is important to make sure
no races occur with state injection, your basechain policy is also set
to accept as default.

Please also check that you set:

/proc/sys/net/netfilter/nf_conntrack_tcp_loose

to zero to disable TCP connection tracking pick up on failover.
Otherwise, conntrack creates an entry from the middle.

Moreover, you will need to drop packets in invalid state in your
policy in combination with this sysctl toggle, both at input and
forward chains.
