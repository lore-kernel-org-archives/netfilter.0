From: Florian Westphal <fw@strlen.de>
Subject: Re: NAT translation problem - leakage of packets with original
 source address
Date: Thu, 10 Mar 2022 15:53:31 +0100
Message-ID: <20220310145331.GD13772@breakpoint.cc>
References: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
 <20220310120809.GD26501@breakpoint.cc>
 <613d3843bf5e37cdf890b64b416471f3@smarthost.pl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <613d3843bf5e37cdf890b64b416471f3@smarthost.pl>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Marcin Kabiesz <marcin.kabiesz@smarthost.pl> wrote:
> My question is where do I create a rule for invalid packets? in NAT
> POSTROUTING? or MANGLE POSTROUTING or other place leaving the server? I am
> waiting for your opinion.

INVALID packets do not traverse NAT table, so NAT POSTROUTING won't
work.

I would suggest mangle postrouting or filter forward, depending on
wheter you want to include locally generated packets or not.
