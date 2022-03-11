From: Florian Westphal <fw@strlen.de>
Subject: Re: NAT translation problem - leakage of packets with original
 source address
Date: Fri, 11 Mar 2022 13:53:26 +0100
Message-ID: <20220311125326.GA10646@breakpoint.cc>
References: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
 <20220310120809.GD26501@breakpoint.cc>
 <613d3843bf5e37cdf890b64b416471f3@smarthost.pl>
 <20220310145331.GD13772@breakpoint.cc>
 <039c7dc8fed7947df5a7e72ead9a9627@smarthost.pl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <039c7dc8fed7947df5a7e72ead9a9627@smarthost.pl>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Marcin Kabiesz <marcin.kabiesz@smarthost.pl> wrote:
> Chain POSTROUTING (policy ACCEPT 1170K packets, 1616M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 84216 8212K ACCEPT     all  --  *      eth0.2  192.168.10.0/24
> 0.0.0.0/0
>  552K   46M ACCEPT     all  --  *      eth0.2  192.168.11.0/24
> 0.0.0.0/0
>     0     0 ACCEPT     all  --  *      eth0.2  192.168.12.0/24
> 0.0.0.0/0
>     0     0 DROP       all  --  *      eth0.2  192.168.0.0/16
> 0.0.0.0/0
>     0     0 DROP       tcp  --  *      eth0.2  0.0.0.0/0
> 0.0.0.0/0            state INVALID

I suspect you need to move the INVALID rule to the beginning,
else packets might get accepted by earlier rule.

