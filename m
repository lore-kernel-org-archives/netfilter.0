From: seentr@at.encryp.ch
Subject: Re: nftables: How to stop further chain traversal after accept
 verdict
Date: Tue, 6 Jun 2023 15:59:15 +0000 (UTC)
Message-ID: <4e78b0e0-0e40-4b6e-b886-168f3b64d30e@at.encryp.ch>
References: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1686067158;
        bh=iv8YqmE2V1TLTb5du/FOMGW6lOLf///ORc6O0hz0A8U=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject;
        b=cciVjQAXDoIo8GErO7naN+nVsqkvd3eNxYN4oCBwtZaQWYfWStKimN+kPIQXioPna
         KZp/4dj4vkpYpbZV1FB4ItBQ75zGNo3uQzMD6i4RzNzb5sfUuhZpjuEsGpHd3Rf4Ry
         4gXlFGKVPPwIVCpVKikTx0Shyd63HRERQoY+Nw5M=
In-Reply-To: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tushar Shinde <mtk.tushar@gmail.com>
Cc: netfilter@vger.kernel.org

You can try to set mark as well as accept them. This way you will be able to determine in the following chains that some of previous ones had accepted it.

2023-06-06T15:40:03Z Tushar Shinde <mtk.tushar@gmail.com>:

> Hi,
> 
> I have asked the same question to super users. But I looks like I need
> help from experts.
> 
> https://superuser.com/questions/1787416/nftables-how-to-stop-further-chain-traversal-after-accept-verdict
> 
> Question is, If there are multiple tables (possibly owned by multiple
> teams/projects ), if a rule is accepted by one of the tables in the
> chain, how to stop looking into the next high priority chain. Right
> now my observation is ACCEPT just stops processing the current chain
> and jump to next table. If this is last table then only ACCEPT will
> work, otherwise this ACCEPT is useless.
> Logs are on SU post.
> 
> Kindly correct me if I am wrong.
> 
> Thank you,
> Tushar.
