From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables multi-dimensional dictionaries
Date: Thu, 3 Sep 2015 18:35:25 +0200
Message-ID: <20150903163519.GA14100@salvia>
References: <DUB109-W834148D76D2B04B8469D05E1690@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DUB109-W834148D76D2B04B8469D05E1690@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Chapman <ajchapman88@hotmail.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Sep 02, 2015 at 10:17:12AM +0100, Alex Chapman wrote:
> Hi,
> 
> Are multi-dimensional dictionaries supported in nftables? For example:
> 
> nft add rule ip filter forward meta iifname . meta oifname { \ eth0 . eth1 : jump chain \ }

Currently we don't support oifname and oifname, the utility complains
since it's a variable length datatype. But I think we can fix this by
using the maximum length.

Anyway, meanwhile you can use iif and oif for device whose device
index is not expected to change.

So this is how what you need looks like:

        nft add rule ip filter forward \
                meta iif . meta oif vmap { eth0 . eth1 : jump test-chain }
