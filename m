From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Mon, 21 Aug 2023 19:18:46 +0200
Message-ID: <29680eb6-1004-f1af-38bb-f9da49712d58@tana.it>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOKIl6qWCdLCTPPT@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
        s=epsilon; t=1692638327;
        bh=Ay7TcNhcfyzoOjIJhYu15iLz70EDL6Vl/EfJpVHWKbg=;
        h=Author:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=eeZp8bhzET2nUl0O8m6TV62tNYnFwWVmtviQ+rPHVwx56owfd6szZtmBy1oLyCfL/
         +F7GXyZLRVakURLvE7ICg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1692638327; bh=Ay7TcNhcfyzoOjIJhYu15iLz70EDL6Vl/EfJpVHWKbg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=DO7x270XgrDgOAEIaCVw99szpg/T3kO2TSjpUYfrpjfiz2FM8HQsZLcl6JVveD4V7
         0C5NTT2PMntsJQOCGFzg30wxOUHDYGT1TvmU4D9LLreBfYpQHJ1A5YQfpyPjxjT5y4
         sgHUHg7BbGu9/hqFDYsu9fyBxizeBD/7aBPEuYHQORj32coArZ9AgdNUW6HIX
Subject: Re: Extending an IPv4 filter to IPv6
Content-Language: en-US, it-IT
In-Reply-To: <ZOKIl6qWCdLCTPPT@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter@vger.kernel.org

On Sun 20/Aug/2023 23:41:43 +0200 Pablo Neira Ayuso wrote:
> On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
>> [...]
>>
>> So, the first question: Can I keep using these functions?  What is the alternative?
>
> The alternative is the libmnl-based API which is the way to go for new 
> applications.


The nf-queue.c[*] example that illustrates libmnl is strange.  It show a 
function nfq_nlmsg_put() (libnetfilter-queue).  I have two questions about it:

1) In the example it is called twice, the second time after setting attrs. 
What purpose does the first call serve?

2) Is it fine to use a small buffer?  My filter only looks at addresses, so it 
should be enough to copy 40 bytes.  Can it be on stack?


>> Second question: Is there a "mixed mode" parameter, besides PF_INET and 
>> PF_INET6, that allows to capture both types?  In that case, can a queue 
>> receive either packet?
>
> Using the 'inet' family in nftables, it should be possible to send 
> both IPv4 and IPv6 packets to one single queue in userspace.


Yes, or two calls to iptables and ip6tables.  However, nfq_nlmsg_cfg_put_cmd() 
takes a pf argument, AF_INET in the example.  Is that argument used at all?


Thanks
Ale
-- 
[*] https://git.netfilter.org/libnetfilter_queue/tree/examples/nf-queue.c



