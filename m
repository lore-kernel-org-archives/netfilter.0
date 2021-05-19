From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fail-closed option? (Make all policies "drop" by default for
 newly created namespaces)
Date: Wed, 19 May 2021 13:49:31 +0200
Message-ID: <20210519114931.GB2151@salvia>
References: <u11ahpbsujy4632sneges8wa3@onionmail.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <u11ahpbsujy4632sneges8wa3@onionmail.info>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mose@onionmail.info
Cc: netfilter@vger.kernel.org

Hi,

On Tue, Apr 13, 2021 at 11:25:49PM +0000, mose@onionmail.info wrote:
> Hi,
> 
> Is there any option to make newly created namespaces start in a fail-closed
> (policy drop) state by default? For example a sysctl option perhaps? I want
> traffic to be dropped in case nftables fails due to a syntax error or a
> missing interface or any other problem. The assumption being that a valid,
> atomically-loaded, nftables.conf will override it from inside the container
> at some point.
> 
> I came up with a workaround in a few of my containers by creating a separate
> "nftables-early.service" systemd service which happens Before=network.target
> and is WantedBy=network-pre.target (if I recall correctly). However this is
> dependent on the container OS (e.g. non-systemd OSes) and will never be as
> robust as a fail-closed kernel option would be.

I'm using 'ip netns' for instance.

# ip netns add test
# cat x.nft
table inet global {
        chain input {
                type filter hook input priority 0; policy drop;
        }
}
# ip netns exec test nft -f x.nft
# ... now attach your veth to your container

Would this work for you?

Or you mean: No ruleset inside container => drop packets.

ie. make ruleset mandatory inside your container.
