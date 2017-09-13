From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 11:34:03 +0200
Message-ID: <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Rosenstein <thomas.rosenstein@creamfinance.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 12 September 2017 at 08:00, Thomas Rosenstein
<thomas.rosenstein@creamfinance.com> wrote:
> Hello,
>
> I'm trying to setup L3 load balancing (with direct server return) which
> requires me to send back or receive packets with a certain src/dst address,
> but for these packets the dst address is replaced on the load balancer, then
> routed and are arriving on my linux container.
>


I guess you could do this with nftables. You can perform this kind of
load balancing with nftables out of the box [0].
Note that nftables should be able to work with DSCP, so you can
combine both things (matching, load-balancing) with the same
technology.

Please, read the docs in our wiki and do some tests.  After that, it
would be great if you come back here and report your experience :-)
Perhaps we can generate a concrete example and put it in the wiki for
future references.

[0] https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
