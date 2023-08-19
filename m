From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Extending an IPv4 filter to IPv6
Date: Sat, 19 Aug 2023 11:46:06 +1000
Message-ID: <ZOAe3rziTGTkTyfi@slk15.local.net>
References: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
Reply-To: duncan_roe@optusnet.com.au
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692409570; x=1693014370;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:reply-to:message-id:subject:to:date:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nM+2llEA85PsaQ/s+aVG/FYcLBsCH+FjIpOvV94ZDA=;
        b=rqVqdTD2QGg5ilnM8kB5E/aqUV0OvFk8DSFeuTVzhmsDq5l7j2PwgKMzFjtVuF/vPJ
         qhjTY+U1l5UKNyg3OZXwaGYlsJ3RMxXCHMYREXIgcI+6rbxuzb2fcJ+KD+rxv9pjLIsv
         thR0/6DEnjc3cF9SJHOssvcUGM1qE4xsK1x2GGWdpDVdIkqeCcsrPnT/slDHdFw1Ac1y
         NTDT33CHv+uK8hjSutg8UbsrAdRl9ky1KOOSZTG1yxoYGrju5ISDDeXLOqNwl+9QvWix
         Og7EXCC5/a8pIAnLv4M1CjBKoxk1JXhMfAniHrXhohFa7AshS8TH5hNSSfyodZG6poyb
         ja8w==
Sender: Duncan Roe <duncan.roe2@gmail.com>
Content-Disposition: inline
In-Reply-To: <9d98b203-b22a-898c-1a4f-c83e706bc411@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Ale,

On Fri, Aug 18, 2023 at 12:56:38PM +0200, Alessandro Vesely wrote:
> Hi all,
>
> I have an old program (ipqbdb) which filters IPv4 packets using
> libnetfilter_queue.  I want to extend it to also filter IPv6, now that at
> last I can use some of those addresses.
>
> The program obtains a handle by nfq_open(), and then (after unbind) binds by
> nfq_bind_pf(h, AF_INET).  Afterwards it creates the configured number of
> queues and filters the packets it finds there.
>
> There is a big DEPRECATED in the documentation, and the generated doc for
> nfq_bind_pf() parameters says "This call is obsolete, Linux kernels from 3.8
> onwards ignore it" (which is obviously false).
> https://netfilter.org/projects/libnetfilter_queue/doxygen/
>
> So, the first question: Can I keep using these functions?  What is the alternative?
>
> Second question: Is there a "mixed mode" parameter, besides PF_INET and
> PF_INET6, that allows to capture both types?  In that case, can a queue
> receive either packet?
>
>
> Any other suggestion about extending to IPv6 is probably going to be appreciated.
>
>
> Thank you
> Ale
> --
>
There are 2 separate APIs in libnetfilter_queue, examplified by
utils/nfqnl_test.c (your program) and examples/nf-queue.c (newer, has functions
for packet mangling).

DEPRECATED was an unfortunate choice of label for the older API: the functions
are not deprecated but the underlying library that they currently use is
deprecated. In answer to your questions:

1a Can I keep using these functions?: Certainly.

1b What is the alternative?: No need to change if your current program does all
you need. I assume here that you don't access the IPv4 header fields: the new
API has functions for that (and IPv6) but the old API has nothing of that
nature.

2 ...can a queue receive either packet?: Yes. utils/nfqnl_test.c works fine
with IPv6. nfq_bind_pf() really *is* obsolete - I'll explain:

In libnetfilter_queue:
  In libnetfilter_queue.c:
    493 int nfq_bind_pf(struct nfq_handle *h, uint16_t pf)
    494 {
    495         return __build_send_cfg_msg(h, NFQNL_CFG_CMD_PF_BIND, 0, pf);
    496 }

In Linux kernel:
  In net/netfilter/nfnetlink_queue.c
    1380     case NFQNL_CFG_CMD_PF_BIND:
    1381     case NFQNL_CFG_CMD_PF_UNBIND:
    1382       break;
    1383     default:
    1384       ret = -ENOTSUPP;
    1385       goto err_out_unlock;

Cheers ... Duncan.
