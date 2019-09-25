From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: queue bypass not working?
Date: Wed, 25 Sep 2019 16:24:30 +1000
Message-ID: <20190925062430.GB16766@dimstar.local.net>
References: <CAAV4SYYtrepDSWvV3KP=gE_5V609h-J_YGrPOFFxk4ctjXdBFA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAV4SYYtrepDSWvV3KP=gE_5V609h-J_YGrPOFFxk4ctjXdBFA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Sep 24, 2019 at 03:16:47PM -0400, Charles Eidsness wrote:
> Hi All,
>
> I'm using nftables v0.9.1 and kernel 5.2.10.
>
> I'm not sure if I'm using it properly but queue bypass doesn't seem to
> work the way I expected.
>
> I add a rule "queue num 10 bypass" to my chain, I don't run any
> listeners on queue 10 and all traffic is blocked (I installed counters
> before and after that rule).
>
> I was expecting all traffic to bypass the rule, but maybe I
> misunderstood what the bypass keyword is for?
>
> Thanks!
> Charles

I'm using bypass with nftables v0.9.2 / kernel 5.2.0 and it's working fine.

HTH,

Cheers ... Duncan.
