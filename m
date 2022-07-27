From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Subject: Re: Requirements for nft nat pre/postrouting chains?
Date: Wed, 27 Jul 2022 21:04:15 +0900
Message-ID: <YuEpv1o07HjUZgLk@atmark-techno.com>
References: <YuDxVBz7FVqk+FHz@atmark-techno.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YuDxVBz7FVqk+FHz@atmark-techno.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dominique MARTINET wrote on Wed, Jul 27, 2022 at 05:03:32PM +0900:
> I've boiled down the reproducer to this:
> 
> ---
> nft add table ip test
> nft chain ip test test '{ type nat hook prerouting priority -100; policy accept; }'
> nft add rule ip test test log prefix "test-pre-" counter packets 0 bytes 0
> 
> # at this point do some network activity;
> # since there is no match specified new connections should trigger
> # the log and increment counters for the rule
> nft list table test
> 
> # (and cleanup)
> nft delete table test
> ---

Florian Westphal replied off list (thanks!)

After a couple of mails the problem just boils down to conntrack not
being loaded by a log rule.
Adding a ct state rule in filter or any masquerade/redirect/snat/dnat in
here enables it and everything works well.

I was just double-confused because my initial test machine, which had
dnat rules was down to the other problem of older kernels:
> (I've also seen on the internet that for older kernels iptable_nat is
> incompatible with nft nat chains and tried taking it out, but that
> shouldn't be relevant anymore)


So all is cleared up now,
thanks!
-- 
Dominique
