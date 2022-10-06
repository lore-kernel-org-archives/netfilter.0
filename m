From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 16:06:31 +0300
Message-ID: <740D71A8-710D-4445-B215-99C0AFA592FF@gmail.com>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
 <20221006111811.GA3034@breakpoint.cc>
 <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
 <BDFD3407-955E-4FB4-B124-229978690BFF@gmail.com> <Yz7SWCDFjFLommZY@salvia>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=WNVZGKjo+uE7F/ccvbkuviPpZXjJ8VIWrqX3EooaZAQ=;
        b=FgQSACS3apPzm23eyqVnydhinYOI0GEJss9V2IovMJfTRhm2K2YtxUu80f4jsEvDFX
         /KYU4tWyw3ovWA2NGNlFizqRrC4OD6FxiCWpWUufCp1FeiZctjL6aD7jgvY4SvRWAQ8t
         RhXFwcGZ0HRFwEhqYRgH+TyKIu7uZ/1ZipS+tdf81g5BqPQ3OOyyRb52tMGw1PNmrQJp
         lsj8rVENFS6LImevBF9VtAtDfkByELxK3bbI1FTLu5cjbW9y2FQLaFt7LlBlEMgREvN9
         3PlSjGx67JyCb+2GCBibbbJx4r1dCUaJKGCBPwzTQRCgjmdvJcFHJ0m3M+KXf8hwRLes
         8kcg==
In-Reply-To: <Yz7SWCDFjFLommZY@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Pablo : 

conntrack -E expect
conntrack v1.4.6 (conntrack-tools): 0 expectation events have been shown.


m

> On 6 Oct 2022, at 16:04, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> On Thu, Oct 06, 2022 at 03:57:23PM +0300, Martin Zaharinov wrote:
>> Hm.. in kernel 6.0-rc7 
>> 
>> Pablo Neira Ayuso (2):
>>      netfilter: nfnetlink_osf: fix possible bogus match in nf_osf_find()
>>      netfilter: conntrack: remove nf_conntrack_helper documentation
> 
> No, it was earlier in the 6.0-rc process.

