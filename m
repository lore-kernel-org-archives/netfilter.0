From: Tim Mooney <Tim.Mooney@ndsu.edu>
Subject: Re: converting iptables/ip6tables to efficient nftables rules
Date: Wed, 2 Aug 2023 13:48:35 -0500 (CDT)
Message-ID: <3334ffcd-fa0-de56-408f-9d519fce87__45535.3486280487$1691002152$gmane$org@ndsu.edu>
References: <924b35f-bda5-6ae5-efe-d05a8de7aec@ndsu.edu> <20230731125739.GC7056@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230731125739.GC7056@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

In regard to: Re: converting iptables/ip6tables to efficient nftables...:

> For the record, nft -o suggest to merge into one rule:
>
> nft -o -f example
> Merging:
> Y:3:3-68:               ip saddr 10.2.0.0/16 tcp dport 80 counter packets 0 bytes 0 accept
> Y:4:3-69:               ip saddr 10.2.0.0/16 tcp dport 443 counter packets 0 bytes 0 accept
> Y:5:3-68:               ip saddr 10.20.30.40 tcp dport 80 counter packets 0 bytes 0 accept
> Y:6:3-69:               ip saddr 10.20.30.40 tcp dport 443 counter packets 0 bytes 0 accept
> into:
>
> ip saddr . tcp dport { 10.2.0.0/16 . 80, 10.2.0.0/16 . 443, 10.20.30.40 . 80, 10.20.30.40 . 443 } counter accept
>
> depending on the number of elements you might want to use
> a named set for this, so you can add/remove to it later.

Thanks Florian!

I really appreciate you taking the time to answer my questions.

The version of nft I've mainly been working with (0.9.3 on RHEL 8) doesn't
document '-o' (--optimize), but I see the version on RHEL 9 does document it.

I'm probably going to proceed with the named set approach, mainly because
it will be easier for my coworkers to read.  The sysadmins I work with
are all very smart people, but many of them don't work with Linux as much
as I do.  Using named sets (one for IPv4, one for IPv6) is a little more
"obvious".

Thanks again,

Tim
-- 
Tim Mooney                                             Tim.Mooney@ndsu.edu
Enterprise Computing & Infrastructure /
Division of Information Technology    /                701-231-1076 (Voice)
North Dakota State University, Fargo, ND 58105-5164
