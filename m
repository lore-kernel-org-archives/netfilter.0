From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Advantage(s) of static over dynamic nftables sets?
Date: Wed, 18 Mar 2020 19:14:45 -0400
Message-ID: <490f10f9-33fa-c85d-9fd3-4dfae823166a@fhmtech.com>
References: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
 <20200318213528.GL979@breakpoint.cc>
 <bc6f84a4-6599-eb7b-cc1c-e82f88d79ee0@fhmtech.com>
 <20200318225153.GM979@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=tvGI+kdLfhVWThzBODjxQTcxDOLbAzEiO2NJ2uRm0UU=;
        b=GWm3Lsv1nD2pBxjtKMF2jUA2O3+lKbHdyPr4NcBS4KqoRAMlGxdL5HURi5qEe+Rebz3TN6bItiYX7YGC85xH7yzXeJPxvJrEU7b0ht1Hwp86IjXISKIqDxfqnyVTYBV/lLw3ReqN45S8sMSAxq3JA6Up4gtzrv/GhAyOYYuAc4s=;
In-Reply-To: <20200318225153.GM979@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/18 18:51, Florian Westphal wrote:

> Right now (assuming static), size <= 16 bits is most efficient,
> then <= 32 bit, rest uses hash table.

Very good to know. Thanks so much.


>> I suppose intervals are more efficient than an equivalent group of single
>> elements?
> 
> Memory-wise yes, performance-wise no.

Also good to know.


>> Is a concatenation like ipv4_addr . inet_service as efficient as a pure data
>> type with the same number of bits?
> 
> Yes, as it makes no difference for the storage.  The kernel doesn't know
> what its storing, it only knows the size of the element.
> 
> It does store a 'type' information, but that is only used by nftables
> so it knows how to format the elements when listing the ruleset.

Thanks for confirming, and for all of your detailed answers.

If you find the time (and if it's comprehensible to a non-kernel 
programmer): How does a dynamic set change the above situation? Does it 
use a hash table for everything?

Thanks,
Frank
