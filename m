From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same
 ip/subnet.
Date: Thu, 2 Sep 2010 18:34:30 +0200
Message-ID: <20100902183430.03fb9ceb@catus>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
	<4C7D11F5.1010105@riverviewtech.net>
	<AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
	<4C7D1F05.4050704@riverviewtech.net>
	<AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
	<20100901091426.216b1778@catus>
	<AANLkTin_-r=hw-Lz7xa-=vW4BxLPgTLsq1=Bw-AZmSEm@mail.gmail.com>
	<20100902175625.2126d7d3@catus>
	<AANLkTin96+ZfAjKmpcgqY+tcxNYYHoMGZz+8bsAb1R2W@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin96+ZfAjKmpcgqY+tcxNYYHoMGZz+8bsAb1R2W@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

>Anyway, conceptually the whole problem look very simple to me...
>Ideally, I'd just need to apply the following pseudo-code that
>overwrites the IP fields... isn't there a simple way to do this trick
>with netfilter&c.?

I don't think you'll be able to simultanously communicate with all
three devices using just one network stack/namespace. The reason is you
can have just one arpcache entry for 10.0.0.1. Correct me if I'm
wrong. Anyone?

Best regards,
Marek
