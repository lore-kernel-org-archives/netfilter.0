From: Frank Myhr <fmyhr@fhmtech.com>
Subject: nftables "stateful object" nomenclature
Date: Mon, 5 Apr 2021 13:19:47 -0400
Message-ID: <76bb6b11-8d1f-d2ae-21f9-1d95c4bf5d53@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Cc:Subject:From:To; bh=H+SycnkCzUjNxQZ9fz41gN3dZNSmCwQbkGUscTEWtmg=;
        b=V9uvoXzG58xPDr5eRDO+k2MHc2VRk76fjOCCkMkAQZUO+SZjI1ss1ou+eta9AEHjqjx4oTPkOIkylNidkdeUFwsHMhXcXb77KqI+6/QdmeX7eb71IV5OUe2i6lOdVsEXSqYTmdiXrvdWJ5qvt/WFIELU4HQVJd10Lkg0diudfhs=;
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Florian Westphal <fw@strlen.de>

Hi,

I hope a developer (Florian?) can weigh in on the following terminology 
question:

Linux kernel has in include/uapi/linux/netfilter/nf_tables.h:
#define NFT_OBJECT_UNSPEC	0
#define NFT_OBJECT_COUNTER	1
#define NFT_OBJECT_QUOTA	2
#define NFT_OBJECT_CT_HELPER	3
#define NFT_OBJECT_LIMIT	4
#define NFT_OBJECT_CONNLIMIT	5
#define NFT_OBJECT_TUNNEL	6
#define NFT_OBJECT_CT_TIMEOUT	7
#define NFT_OBJECT_SECMARK	8
#define NFT_OBJECT_CT_EXPECT	9
#define NFT_OBJECT_SYNPROXY	10
#define __NFT_OBJECT_MAX	11
#define NFT_OBJECT_MAX		(__NFT_OBJECT_MAX - 1)

The nft man page calls only 5 of these "stateful objects":
   ct helper
   ct timeout
   ct expectation
   counter
   quota

The wiki currently calls only 2 of these "stateful objects":
   counter
   quota
I'm fairly sure these are the only two that allow "nft reset".

So my question is: which of the 10 objects currently in nf_tables.h are 
properly called "stateful objects"? I mean, they're all named objects, 
they all carry state information, they follow much (but not all) of the 
same syntax...

I'm guessing that all are "stateful objects" and the presence of "reset" 
is just a special feature of 2 of them. But I'll wait on editing wiki 
until getting confirmation / clarification.

Thanks,
Frank
