From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: Re: NFQUEUE/iptables and kernel warning messages for net/ipv4/tcp_output.c
Date: Tue, 18 Feb 2020 13:59:56 +0100
Message-ID: <CABLYT9j6a+QT=7BdeSbJY2AnbHhKz72OQTJ8x5nL6_4TBeZT3Q@mail.gmail.com>
References: <CABLYT9gNPFh7RpwE8P3uZyLKBM-_6ctpg7_8BPo4iCN3PWMQOQ@mail.gmail.com>
 <20200218123958.GJ19559@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wnj5Tqet5dMfyuJyMnMDbeP5ExV9WxQrvbQPdq9dkYk=;
        b=EA3i5fzm3RQyQe5l/jEL9TVSu0AS+cEpdElhaDZxii1irZgsePRQLryMJaZe/lIzga
         aild4CJiAlmYFZzy25BO0+pREC2gdIsYXJGip/gu8DrxUhNVXte+cEtUUgHIeUv9hEou
         3BUzNJIMItOCI7fRSTxAh657lwXflw2IbOU/5P2lWh1f1LMdyz3/lRvZ+Fy2FBbVs8DN
         O8X875Fpx7bbA66SAod3h7Rr6R/hWzBgXyN7p/b2oMG5e0ZK4vpgfSE8vGger0t2jc2m
         tZ2fWccldul6nAqj0M7OLKHV0PhsWVs7O4g5tY451fJFWnCzQn/OPJox2X9PF6QNCamN
         0fRQ==
In-Reply-To: <20200218123958.GJ19559@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On Tue, Feb 18, 2020 at 1:39 PM Florian Westphal <fw@strlen.de> wrote:
>
> get this patch working (untested)

> +static uint32_t nfq_get_pktinfo(struct nfq_data *nfad)
> +{
> +        return ntohl(nfnl_get_data(nfad->data, NFQA_SKB_INFO, uint32_t));

I applied the patch, but I get this compilation error:

In file included from suricata-common.h:180,
                 from source-nfq.c:28:
source-nfq.c: In function 'nfq_get_pktinfo':
source-nfq.c:404:48: error: 'NFQA_SKB_INFO' undeclared (first use in
this function)
  404 |         return ntohl(nfnl_get_data(nfad->data, NFQA_SKB_INFO,
uint32_t));
      |                                                ^~~~~~~~~~~~~

I'll post to the suricata ML asap.

Thanks,

Vieri
