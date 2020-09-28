From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 18:08:09 +0200
Message-ID: <20200928160809.GB2605@salvia>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
 <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
 <20200928123213.GF20886@dimstar.local.net>
 <dc380b6d-4085-13c7-9687-405825585823@doubly.so>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dc380b6d-4085-13c7-9687-405825585823@doubly.so>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devin Bayer <dev@doubly.so>
Cc: duncan_roe@optusnet.com.au, "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 03:00:59PM +0200, Devin Bayer wrote:
> On 28/09/2020 14.32, Duncan Roe wrote:
> > 
> > It used to be the case with meters that you could have limit or counter but not
> > both.
> > 
> > I don't know if that is still the case with dynamic sets. If it is, you will
> > have to have 2 sets: 1 with limits and 1 with counters.
> > 
> > (counter with limit is ambiguous: do you want to count packets received or
> > packets accepted? Both are do-able with 2 sets).
> > 
> > Please post your rules that add set members if you have further questions.
> 
> I think it's clear enough in regards to sets in the manpage - I will submit
> a patch for that.
> 
> However the situation on the wiki is still unclear. It does show counters
> with limits, but for maps. However, it doesn't show how to create the maps
> or add to them.
>  I try something like this:
> 
>     map flood2 {
>         type ipv4_addr : counter;
>         size 100000;
>         flags dynamic, timeout;
>         timeout 1m;
>     }
> 
>     chain prerouting {
>         tcp flags syn tcp dport 80 \
>             add @flood2 { ip saddr limit rate over 3/minute } \
>             log prefix "MAP "
>     }
> 
> But no luck:
> 
> 
>   /etc/nftables.conf:49:9-14: Error: Could not process rule: Operation not
> supported

Something like this:

table ip x {
        set flood2 {
                type ipv4_addr
                size 100000
                flags dynamic,timeout
                timeout 1m
                elements = { 150.214.188.80 expires 54s752ms limit rate 1/minute burst 1 packets }
        }

        chain output {
                type filter hook output priority filter; policy drop;
                ct state new tcp dport 80 add @flood2 { ip daddr limit rate 1/minute burst 1 packets } log prefix "test: " accept
                ct state established,related accept
        }
}

Only one stateful expression is supported a this stage, either you
have ratelimit or you have counters per elements.
