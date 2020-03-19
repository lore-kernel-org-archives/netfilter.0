From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Advantage(s) of static over dynamic nftables sets?
Date: Wed, 18 Mar 2020 20:21:56 -0400
Message-ID: <12b8ee6e-cfb1-48d8-5a14-bdb59766f1da@fhmtech.com>
References: <a2d41bb9-2cbe-8b5e-99d9-a00cb086ca0b@fhmtech.com>
 <20200318213528.GL979@breakpoint.cc>
 <bc6f84a4-6599-eb7b-cc1c-e82f88d79ee0@fhmtech.com>
 <20200318225153.GM979@breakpoint.cc>
 <490f10f9-33fa-c85d-9fd3-4dfae823166a@fhmtech.com>
 <20200319000834.GN979@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=O2Imdod+wdZ9PczoUqn7yVIQzMmP57nug0/rOVsI+24=;
        b=UzXSrLFsbhAClcx/8VEXTFZ49QTYwo8+ogczq4cy1zDEvt5xsIFhvFUb92v4Ogm3/Gxuw+gpY50Q480yEUKao2opBz32fhMSVKNbRgRofzkNGILjt+zhnZmwnmEip/fidLo8CkeJ6qpk1f0q5nWy+ttCUho8t0HMRRIH1ow2nzI=;
In-Reply-To: <20200319000834.GN979@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/18 20:08, Florian Westphal wrote:

> Yes, dynamic set always uses 'rhashtable' backend, thats the only type
> that supports insertion from the packet path.
> 
> We have 3 hash tables, a simple one for 32bit keys, one for static sets
> (table size decided at creation time) and rhashtable (table size is
> auto-resized as needed).

Thank you! I now have a much better idea of what's going on "behind the 
curtain." I'll stop pestering you with questions, for now. :-)
