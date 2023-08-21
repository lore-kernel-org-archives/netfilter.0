From: Pierre-Philipp Braun <pbraun@nethence.com>
Subject: Re: failing fail-over - commit still in progress
Date: Mon, 21 Aug 2023 09:19:21 +0300
Message-ID: <18a0e2b8-dc7c-b9c6-77a7-8cfbe5fddb68@nethence.com>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
 <ZNYTF+uCod++Htl9@calendula>
 <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
 <ZNf013cGy81TcxoN@calendula>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nethence.com;
        s=aug2022; t=1692598758;
        bh=AVmhyCCkbCwIVT+lrWGNogO47l+EfFimCfJjWCj7LN8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ghJwAiIEM2pUaGHKq8hGywE3y+PVd0M54LejUzKzOoqtl+C4PlHFw1w8BgMaUcBLO
         aDd4CpLo7/nhBvrpi8OMyeLZ7lwUmx9SC2gMDStaApzOQW7o3Pc3euvGjAj3dkNYRq
         V/1ZfIkXarsGin9X6iwrpV//drXBCu0vpZswBW3RGVYVy4rmcB6iSFqby7vT0piJE1
         CxbHmufywvRRvuwW7uzL+tP6sTfEGWqG8KaXEvGl/DMBxMx7mXGyokzg35buKo2ag1
         JCVaH2MPu125daj9INmk53yB/WfNgkLiiMDd20FV6aKwNPr33Np8fosUFxHN6Q4m3l
         Ghm9iAGR+gDYw==
Content-Language: en-US, fr
In-Reply-To: <ZNf013cGy81TcxoN@calendula>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> - active: internal cache contains the flow that represents the SSH
>    connection.
> - backup: external cache contains the flow that represents the SSH
>    connection.

I started from scratch a new PoC with two simple debian nodes and with 
only three interfaces, which eventually let me do the drop policy.

Before, I could see the states being synced on the internal/external 
cache.  As far as I remember, I could see the states in the previous PoC 
even if it was only doing NAT, without any filtering.  Now it's even 
worse.  The backup node doesn't even see the states in its external 
cache (both with FTFW/UDP and NOTRACK/UDP).

Are tracking rules in the filter table absolutely mandatory to make the 
states known to conntrackd?  I ask that because, conntrack -L can see 
the local states without anything specific.

If so, does tracking rules initiated with nftables also work, or do I 
have to use iptables instead?

If so, on which chains should I have absolutely have a drop policy 
(input / forward / output)?

Is there a MWE with nftables rules somewhere that I could test?

> By "inbound session", I guess you refer to the SSH connection you use
> for testing, but is this a SSH connection to the guest VM? Is this
> DNAT to the guest VM or simply routing?

Yes, I was talking about a connection from the outside to a guest system 
behind DNAT.  Same goes for the new PoC, it's just that the VRRP nodes 
are now guest systems themselves.  To simplify the PoC (and have way 
less network interfaces, no bonding, no bridges, no vlans), I've put the 
gateways as guest and they now have only three interfaces.

eth0 -- front-facing
eth1 -- internal network
eth2 -- cluster network for the sync

so I could afford using a drop policy without too much headache.

> Such guess VM gets migrated to the active node and the active node
> forwards traffic to the guest VM?

No, my experiments so far have nothing to do with guest migrations.  I 
was only testing that the SSH connection remains during VRRP fail-over.

There are other interesting use-cases where we could consider using 
conntrack-tools which are specific to virtualization, but that's a whole 
different story.  And given the problems I face with the most KISS setup 
even with this MWE new PoC, I guess I would use something else for that 
purpose (NetBSD PF+PFSYNC+CARP just works out-of-the-box and is 
active/active by default, which is what I need for that other use-case).

> /proc/sys/net/netfilter/nf_conntrack_tcp_loose

Ok, that helps not to loose SSH the connection immediately, but still, 
with the newer simple PoC I cannot even see the states replicated.

I also noticed this setting, is that required?

net.netfilter.nf_conntrack_helper = 0

It would be nice to have a fully working MWE tutorial available, to be 
able to test the simplest active/passive setup.  I will be glad to 
document mine, if I finally manage to get it working.
