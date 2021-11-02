From: Florian Westphal <fw@strlen.de>
Subject: Re: nft named set address types
Date: Tue, 2 Nov 2021 20:53:52 +0100
Message-ID: <20211102195352.GA11415@breakpoint.cc>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> I'd like to use the "inet" address family in a named set. I see nft
> supports the following address families [AF] (among others):
> 
>        ip       IPv4 address family.
> 
>        ip6      IPv6 address family.
> 
>        inet     Internet (IPv4/IPv6) address
>                 family.
> 
> However, looking at the named sets, I do not see the "inet" AF:
> 
> type  string: ipv4_addr, ipv6_addr, ether_addr, inet_proto, inet_service, mark
> 
> Are there plans to add "inet_addr" AF to the types of named sets?

No.

> Any feedback about combined ipv4 and ipv6 address families in named
> sets? or why an inet family does not exist for named sets?

There is no ip family either, only data types, and all must have a fixed
length.

nft describe ip saddr
