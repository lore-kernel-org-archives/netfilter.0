From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: OUTPUT: nat after filter (2nd nat). Please help :(
Date: Tue, 14 May 2013 11:37:11 +0530
Message-ID: <5191D48F.3010301@atc.tcs.com>
References: <CAJ1PRSnsV_cN0R6JK+8PYb=9u=Fnp_tbo9ufB1j0vUJPoP0cFQ@mail.gmail.com> <5191CBDC.6020603@atc.tcs.com> <CAJ1PRSnzBFnjd5hQbzVs0u2CSBH5ZfwmtUN05+DhvjrDmxWbqA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ1PRSnzBFnjd5hQbzVs0u2CSBH5ZfwmtUN05+DhvjrDmxWbqA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "krzf83@gmail.com" <krzf83@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05/14/2013 11:27 AM, krzf83@gmail.com wrote:
> Unfortunetly postrouting has not DNAT (only SNAT).

Oops.. I missed that.

> I figured only option is to rewrite all filters with conntrack and
> --ctorigdst --ctorigdstport, but contrack has to iprange. Only other
> option is to put filter rules in raw or mangle table. Both require
> huge rewrite of filter rules and thats only because iptables can't
> filter before DNAT :/ weird.

I think, if you give more details about your setup, people can help.


Regards,
Vignesh
