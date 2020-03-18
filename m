From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Advantage(s) of static over dynamic nftables sets?
Date: Wed, 18 Mar 2020 18:11:27 -0400
Message-ID: <bc6f84a4-6599-eb7b-cc1c-e82f88d79ee0@fhmtech.com>
References: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
 <20200318213528.GL979@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=JFetwJ/Ky1y8dCuh6B2/M7MKvjmgwElxcKBKe0tzYG0=;
        b=jOVX/12NmdHQPiQqIWju76vjCl69I4YsawjThFTjrSqMdS1fqUNJ23XQgMlacKHB/01c3A1ibM73bjTcoeB3mwOGWAF8Nnx9c1FQ37E4AJq4toYY9wUsaZdAaM+LgTAOself3U/9FOaqi49tLPOYSddYMXKZgsdwOZMeqhJ4MnQ=;
In-Reply-To: <20200318213528.GL979@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/18 17:35, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> So now I wonder: why not define every set as dynamic?
> 
> Sets that are made static allow kernel to pick a more efficient
> representation for the set type.

Thanks, Florian. Good to know.


>> Would performance and/or memory usage take a significant hit by
>> [defining all sets dynamic]?
> 
> I don't think so, but this will probably depend a lot on the
> system in question and on the type of elements stored.

Makes sense, thanks. I suppose efficiency gets progressively worse for 
element types with larger possible ranges (# of bits), something like?:

inet_proto < inet_service < mark, ipv4_addr < ether_addr < ipv6_addr

I suppose intervals are more efficient than an equivalent group of 
single elements?

Is a concatenation like ipv4_addr . inet_service as efficient as a pure 
data type with the same number of bits?

Thanks,
Frank
