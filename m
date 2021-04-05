From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables "stateful object" nomenclature
Date: Mon, 5 Apr 2021 23:57:33 +0200
Message-ID: <20210405215733.GB10493@salvia>
References: <76bb6b11-8d1f-d2ae-21f9-1d95c4bf5d53@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <76bb6b11-8d1f-d2ae-21f9-1d95c4bf5d53@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>

Hi,

On Mon, Apr 05, 2021 at 01:19:47PM -0400, Frank Myhr wrote:
> Hi,
> 
> I hope a developer (Florian?) can weigh in on the following terminology
> question:
> 
> Linux kernel has in include/uapi/linux/netfilter/nf_tables.h:
> #define NFT_OBJECT_UNSPEC	0
> #define NFT_OBJECT_COUNTER	1
> #define NFT_OBJECT_QUOTA	2
> #define NFT_OBJECT_CT_HELPER	3
> #define NFT_OBJECT_LIMIT	4
> #define NFT_OBJECT_CONNLIMIT	5
> #define NFT_OBJECT_TUNNEL	6
> #define NFT_OBJECT_CT_TIMEOUT	7
> #define NFT_OBJECT_SECMARK	8
> #define NFT_OBJECT_CT_EXPECT	9
> #define NFT_OBJECT_SYNPROXY	10
> #define __NFT_OBJECT_MAX	11
> #define NFT_OBJECT_MAX		(__NFT_OBJECT_MAX - 1)
> 
> The nft man page calls only 5 of these "stateful objects":
>   ct helper
>   ct timeout
>   ct expectation
>   counter
>   quota

ct helper, ct timeout, ct expectation, ct expect, tunnel, secmark,
synproxy do not really have an internal state. They are actually
(stateless) policy objects that can be "dereferenced" from the ruleset.

counter, quota, limit and connlimit are stateful policy objects in the
sense that they store an internal state (number of packets/bytes,
consumed quota in bytes, packets/bytes credit available in the
ratelimiter and connection counter, respectively). These objects are
updated by each packet that "hits" them.

counter and quota implement the reset command (which allows for an
atomic dump and reset of their internal state). limit and connlimit do
not, although they are stateful, I didn't find any use-case where
reset of the internal state might be useful).

The infrastructure was originally made to support for the two initial
stateful policy objects: counter and quota. Later on, it's been used
to support for more (stateful and stateless) policy objects, although
none of them do have a reset command.

> The wiki currently calls only 2 of these "stateful objects":
>   counter
>   quota
> I'm fairly sure these are the only two that allow "nft reset".
> 
> So my question is: which of the 10 objects currently in nf_tables.h are
> properly called "stateful objects"? I mean, they're all named objects, they
> all carry state information, they follow much (but not all) of the same
> syntax...

counter, quota, limit and connlimit.

> I'm guessing that all are "stateful objects" and the presence of "reset" is
> just a special feature of 2 of them. But I'll wait on editing wiki until
> getting confirmation / clarification.

reset is a command that is available to a subset of the stateful
policy objects.
