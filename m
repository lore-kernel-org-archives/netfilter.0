From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: List chain during attack high CPU usage
Date: Wed, 7 Sep 2022 16:54:42 +0200
Message-ID: <YxiwsmThXAYt3kml@salvia>
References: <b5e3e3d3-9631-31a4-7fc0-7193bdc10176@brskt.be>
 <YxCKp2yQT1mu096e@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YxCKp2yQT1mu096e@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brskt <contact@brskt.be>
Cc: netfilter@vger.kernel.org

On Thu, Sep 01, 2022 at 12:34:15PM +0200, Pablo Neira Ayuso wrote:
> On Wed, Aug 31, 2022 at 02:18:17AM +0200, Brskt wrote:
> > Hello,
> > 
> > I'm using some filter which uses sets with meters. When the server is
> > receiving a lot of packets per seconds (~800k+) and using the command to
> > list the chain, it does take ~80% of CPU and take a long time to return an
> > output.
> > 
> > # cat /etc/issue
> > Welcome to Alpine Linux 3.16
> > 
> > # nft -v
> > nftables v1.0.5 (Lester Gooch #4)
> > 
> > # uname -r
> > 5.15.62-1-lts
> 
> Could you provide more information on your setup? ruleset?
> 
> Ruleset listing is also lockless.
> 
> It is hard to guess with this short notice.

For the record, the existing userspace cache logic in nftables is
retrieving the elements in your set, and I suspect you have a lot of
elements, that is why:

        nft list chain x y

is likely taking time there to show the listing.

It should be possible to improve this cache logic, it will only
require a userspace software update.
