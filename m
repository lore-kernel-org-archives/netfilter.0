From: Andrew <nitr0@seti.kr.ua>
Subject: Re: Kernel panic in 4.1.6 in nf_nat_redirect
Date: Sun, 4 Oct 2015 22:46:20 +0300
Message-ID: <5611820C.2050508@seti.kr.ua>
References: <560D9DDD.8000601@seti.kr.ua> <20151004190543.GA17688@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151004190543.GA17688@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hm, strange, gdb can't find debug info.

04.10.2015 22:05, Pablo Neira Ayuso wrote:
> Could you please do the following?
>
> $ gdb net/netfilter/nf_nat_redirect.o
> $ list *nf_nat_redirect_ipv4+0x24
>
> And post the result, thanks.

