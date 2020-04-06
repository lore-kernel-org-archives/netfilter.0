From: Florian Westphal <fw@strlen.de>
Subject: Re: validate IPsec outgoing packets using NFtables
Date: Mon, 6 Apr 2020 17:49:09 +0200
Message-ID: <20200406154909.GA10817@breakpoint.cc>
References: <6db313e5d1d7ff43bfbf5a3457b40059daf10c69.camel@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6db313e5d1d7ff43bfbf5a3457b40059daf10c69.camel@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Alabeatrix <oalabeatrix@gmail.com>
Cc: netfilter@vger.kernel.org

Olivier Alabeatrix <oalabeatrix@gmail.com> wrote:
> The postrouting chain secpath rule never matches:
> ip saddr 172.16.11.0/24 ip daddr 172.16.12.0/24 meta secpath exists
> counter accept
> 
> What may I be doing wrong? Any help is welcomed.

Outgoing packets do not have a secpath, you will need to use
'rt ipsec exists'.
