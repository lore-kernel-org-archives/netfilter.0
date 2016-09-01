From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nf_conntrack_max
Date: Thu, 1 Sep 2016 12:59:11 +0200
Message-ID: <20160901105911.GA2779@salvia>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <20160831224731.GP28999@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160831224731.GP28999@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

On Wed, Aug 31, 2016 at 05:47:32PM -0500, /dev/rob0 wrote:
[...]
> One more thing I can add: I believe it is possible to set different 
> conntrack timeouts based on protocol/port. 

Right, this is possible.

> I don't know exactly how to do that, but it would make sense for
> udp/53 to shorten that to something like 15 seconds; just a bit
> beyond the nameservers' and resolver clients' timeout values.

Setting custom timeout policies per address/protocol/port (any
selector basically) is possible through -j CT --timeout name from the
raw table.

You have to create the timeout policy in first place through 'nfct'
that comes in the conntrack-tools package. I think there are examples
for this already, otherwise let me know and we can place it on the
manpage.

Now that nft has come, the plan is to unify all these command line
tools such as conntrack and nfct into nft, so we end up using one
single tool to interface with the netfilter subsystem in the future.
