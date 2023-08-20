From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sun, 20 Aug 2023 11:09:13 +1000
Message-ID: <ZOFnuYFoHUt5uRwY@slk15.local.net>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
 <ZOAe3rziTGTkTyfi@slk15.local.net>
 <3a010f66-7229-54f9-9f9c-b5bb81b44ea5@tana.it>
Reply-To: duncan_roe@optusnet.com.au
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692493758; x=1693098558;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:reply-to:message-id:subject:to:date:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yU4HMHztrl4fHxGtEkJAd6g6CHqsslngF23Ep+/K4c=;
        b=eT8LwloZasZSoH7bzmBw3cJNkN1aSlQmFwf21/pwFe8PiWkAli0G+6MA4yIxyWfLPb
         bqvi0wPwg2SPIIaR5FEEwVUiDnjzU0vGwo+x9gTQfb/s89+6raFQfAE+V7Hb8Q0Pl1OK
         cuImRDfgB7ftmdlihM9D6nJxngzcGrVPtkDjEEtCkbRxgXeClwc/eTzdoXS0bZ8Ov52Y
         jWjHBQOcIUHMx9T0o70X59Og7NNWxtRD089rM6XPoJEmnz5xvLRzuzmIvTXgmSQLtSSe
         LD8HdEoITR3EfaggOlKRXmoMsydLgX0cpUqLwPDox4Nzwkgej0b3pjog3Q7anSthKSsi
         6t3w==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <3a010f66-7229-54f9-9f9c-b5bb81b44ea5@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Aug 19, 2023 at 11:53:19AM +0200, Alessandro Vesely wrote:
> Hi Duncan, thank you for your reply.
>
[...]
>
> > 2 ...can a queue receive either packet?: Yes. utils/nfqnl_test.c works fine
> > with IPv6. nfq_bind_pf() really *is* obsolete - I'll explain:
> >
> > In libnetfilter_queue:
> >    In libnetfilter_queue.c:
> >      493 int nfq_bind_pf(struct nfq_handle *h, uint16_t pf)
> >      494 {
> >      495         return __build_send_cfg_msg(h, NFQNL_CFG_CMD_PF_BIND, 0, pf);
> >      496 }
> >
> > In Linux kernel:
> >    In net/netfilter/nfnetlink_queue.c
> >      1380     case NFQNL_CFG_CMD_PF_BIND:
> >      1381     case NFQNL_CFG_CMD_PF_UNBIND:
> >      1382       break;
> >      1383     default:
> >      1384       ret = -ENOTSUPP;
> >      1385       goto err_out_unlock;
>
>
> Heck, I see.  In particular, the cmd->pf argument is never used.  That means
> that the type of packet a filter receives only depends on what iptables of
> nft are shoving at its queue, irrespective of compile and runtime config.
> Correct?
>
Yes, correct.
>
> Best
> Ale
> --
>
Cheers ... Duncan.
