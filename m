From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: limit module timer precision issue
Date: Thu, 13 Oct 2011 00:57:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110130056330.28029@frira.zrqbmnf.qr>
References: <20111013014310.4369d65e@wwwwww-701SD>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111013014310.4369d65e@wwwwww-701SD>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abirvalg@lavabit.com
Cc: netfilter@vger.kernel.org

On Thursday 2011-10-13 03:43, abirvalg@lavabit.com wrote:

>Hi, it seems to me that limit module has issues with timer precision.

Yes, such issues are known from earlier reports. Which is why there is 
the -m rateest/-j RATEEST pair that is supposed to be more accurate.
