From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables "stateful object" nomenclature
Date: Mon, 5 Apr 2021 19:19:40 -0400
Message-ID: <64430ca1-35b8-5199-89db-cafffa6db181@fhmtech.com>
References: <76bb6b11-8d1f-d2ae-21f9-1d95c4bf5d53@fhmtech.com>
 <20210405215733.GB10493@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=CWVMpZRXjo57uc42Epb31Uvr0ph4F2PErzsp31AnnHY=;
        b=hBhQMjDuFLtranYVLEKipUI/48m8Q4gM+7ILTzMy3U1npi0H2m3hP21FsVxp8l7+EPoNYbVhzdaxNsv+mxCHtSEwGXPqtCg7EniakIrmB9VaiI6z1fHFQ4qc0/wyDbV1s0e6IzielWk6U/9TyP3J8LeBnyU2IWJJVSjtIYaBXv8=;
In-Reply-To: <20210405215733.GB10493@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>

On 2021/04/05 17:57, Pablo Neira Ayuso wrote:
> On Mon, Apr 05, 2021 at 01:19:47PM -0400, Frank Myhr wrote:
>> Linux kernel has in include/uapi/linux/netfilter/nf_tables.h:
>> #define NFT_OBJECT_UNSPEC	0
>> #define NFT_OBJECT_COUNTER	1
>> #define NFT_OBJECT_QUOTA	2
>> #define NFT_OBJECT_CT_HELPER	3
>> #define NFT_OBJECT_LIMIT	4
>> #define NFT_OBJECT_CONNLIMIT	5
>> #define NFT_OBJECT_TUNNEL	6
>> #define NFT_OBJECT_CT_TIMEOUT	7
>> #define NFT_OBJECT_SECMARK	8
>> #define NFT_OBJECT_CT_EXPECT	9
>> #define NFT_OBJECT_SYNPROXY	10
>> #define __NFT_OBJECT_MAX	11
>> #define NFT_OBJECT_MAX		(__NFT_OBJECT_MAX - 1)
> 
> ct helper, ct timeout, ct expectation, ct expect, tunnel, secmark,
> synproxy do not really have an internal state. They are actually
> (stateless) policy objects that can be "dereferenced" from the ruleset.
> 
> counter, quota, limit and connlimit are stateful policy objects in the
> sense that they store an internal state (number of packets/bytes,
> consumed quota in bytes, packets/bytes credit available in the
> ratelimiter and connection counter, respectively). These objects are
> updated by each packet that "hits" them.
> 
> counter and quota implement the reset command (which allows for an
> atomic dump and reset of their internal state). limit and connlimit do
> not, although they are stateful, I didn't find any use-case where
> reset of the internal state might be useful).
> 
> The infrastructure was originally made to support for the two initial
> stateful policy objects: counter and quota. Later on, it's been used
> to support for more (stateful and stateless) policy objects, although
> none of them do have a reset command.

Thank you very much for your thorough explanation and historical 
context, Pablo!


>> The wiki currently calls only 2 of these "stateful objects":
>>    counter
>>    quota
>> I'm fairly sure these are the only two that allow "nft reset".
>>
>> So my question is: which of the 10 objects currently in nf_tables.h are
>> properly called "stateful objects"? I mean, they're all named objects, they
>> all carry state information, they follow much (but not all) of the same
>> syntax...
> 
> counter, quota, limit and connlimit.

Got it. Thanks!


> reset is a command that is available to a subset of the stateful
> policy objects.

Understood. Thanks again. I'll update the wiki accordingly.

Best regards,
Frank
