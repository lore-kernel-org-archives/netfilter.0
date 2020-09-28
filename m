From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 22:32:13 +1000
Message-ID: <20200928123213.GF20886@dimstar.local.net>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
 <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devin Bayer <dev@doubly.so>
Cc: "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 12:01:52PM +0200, Devin Bayer wrote:
> On 28/09/2020 04.10, Duncan Roe wrote:
> >
> > Hi Davin,
>
> Thanks for the reply Duncan.
>
> > a) from b):
> > > Note that the meter keyword is obsolete, the dynamic set and map syntax is now preferred for consistency.
>
> I see. In that case, I would like to update the man page to use the new
> syntax. The examples there use meter, but without any explanation.
>
>
> For example the blacklist example:
>
>
>
> 	nft add rule ip filter input tcp flags syn tcp dport ssh meter flood size
> 128000 { ip saddr timeout 10s limit rate over 10/second} add @blackhole { ip
> saddr timeout 1m } drop
>
> So would this be the set equivalent?
>
>     set flood {
>         type ipv4_addr;
>         size 128000;
>         flags dynamic, timeout;
>         timeout 1m;
>     }
>     ...
>     tcp flags syn tcp dport ssh \
>         add @flood { ip saddr limit rate over 10/second } \
>         add @blackhole { ip saddr timeout 1m } drop
>
>
> Is there a map equivalent? I couldn't get anything to work.
>
> > b) Still documented at https://wiki.nftables.org/wiki-nftables/index.php/Meters,
> >     but the examples are updated to use dynamic sets.
>
> It's quite confusing and doesn't work as described though.
>
> > c) counters in dynamic sets are special: you get a counter for each set member.
>
> Right - but how can I see the counters? If you look at my example I just see
> this:
>
> 	3.10.95.11 . 22 expires 14s492ms limit rate 10/second,
>
> ~ Devin

It used to be the case with meters that you could have limit or counter but not
both.

I don't know if that is still the case with dynamic sets. If it is, you will
have to have 2 sets: 1 with limits and 1 with counters.

(counter with limit is ambiguous: do you want to count packets received or
packets accepted? Both are do-able with 2 sets).

Please post your rules that add set members if you have further questions.

Cheers ... Duncan.
