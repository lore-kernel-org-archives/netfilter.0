From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Intervals inside of maps?
Date: Mon, 19 Sep 2016 17:00:48 +0200
Message-ID: <20160919150048.GA4517@salvia>
References: <98f722ce-a936-015f-e90c-bd95eb27b9ba@foteviken.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <98f722ce-a936-015f-e90c-bd95eb27b9ba@foteviken.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Hainke <andreas.hainke@foteviken.de>
Cc: netfilter@vger.kernel.org

On Thu, Sep 15, 2016 at 02:13:55PM +0200, Andreas Hainke wrote:
> Hello,
> 
> does anybody know if it's possible to use intervals inside of maps?
> Pablo already pointed out that it is possible to use maps as follows to
> handle rule processing more efficient:
> 
> nft add rule test myChain ip saddr . ip daddr vmap { 10.10.10.15 .
> 10.10.20.5 : accept, 10.10.10.1 . 10.10.20.1 : accept}
> 
> table ip test {
>     chain myChain {
>         ip saddr . ip daddr vmap { 10.10.10.15 . 10.10.20.5 : accept,
> 10.10.10.1 . 10.10.20.1 : accept}
>     }
> }
>
> If I try to use intervals in maps the same way, I receive the following
> output:
> 
> root@fw:~# nft add rule test myChain ip saddr . ip daddr vmap {
> 10.10.10.0/24 . 10.10.20.0/24 : accept }
> <cmdline>:1:64-64: Error: syntax error, unexpected ., expecting colon
> add rule test myChain ip saddr . ip daddr vmap { 10.10.10.0/24 .
> 10.10.20.0/24 : accept }

Please, give a try to this:

# nft add rule test myChain \
        ip saddr and 255.255.255.0 . ip daddr and 255.255.255.0 \
                vmap { 10.10.10.0 . 10.10.20.0 : accept }

Note that this is not an interval, this is masking the ip saddr and ip
daddr, then concate both results. This concatenation is used to lookup
for a matching of this the result in the map.

Using a named set, you can do:

# nft add map test myMap { type ipv4_addr . ipv4_addr : verdict \; }
# nft add rule test myChain \
        ip saddr and 255.255.255.0 . ip saddr and 255.255.255.0 vmap @myMap
# nft add element test myMap { 10.10.10.0 . 10.10.20.0 : accept }

It should be easy to provide a more compact syntax using prefixes, eg.
ip saddr /24. I have a patch for this in a branch but I need to finish
the listing side to print a prefix from there too.

P.S: It would be great if anyone can add this to the nftables wiki.
