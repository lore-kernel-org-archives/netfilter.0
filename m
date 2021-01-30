From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables typeof concatenation support for vmap?
Date: Sat, 30 Jan 2021 13:32:23 -0500
Message-ID: <88b3916e-ddd0-b2ae-3a5a-5fe1304656b8@fhmtech.com>
References: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
 <20210130182653.GA12443@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=CQjIK19d2xolC2VEJyJ6A+cHyUmkQJ60/5NbOpE7uRs=;
        b=sEODFoM6BDZg2plMxH3A9nS3f+CniEEXIxdynDUmsczK+hjUnoitwqBpbvGzeu3JF7cB64AUzzJnabvJGWRguV7RkNcMrWeSS3Pv/YohBzo/prqj6ldoiU1ivH/MRWwH1iUw1UWvlB5KD+uv0/W/nvF1G4n0yDsQpsq/sgP2Btc=;
In-Reply-To: <20210130182653.GA12443@breakpoint.cc>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On 2021/01/30 13:26, Florian Westphal wrote:
> Frank Myhr <fmyhr@fhmtech.com> wrote:
>> Are there any plans to support typeof concatenation for vmap? (Or maybe it's
>> already supported and I'm botching the syntax or otherwise doing something
>> silly?)
> 
> Its not supported yet, nft is missing some glue code.
> I will work on it next week.
> 
> Meanwhile you can use normal "type" as Laura suggested.

That will be great, thank you Florian. :-)

I'm thrilled to get such helpful responses, and that the vmaps I have in 
mind will work after all!

Best Wishes,
Frank
