From: Ed W <lists@wildgooses.com>
Subject: Re: NFQUEUE looses packets between arrival and verdict
Date: Wed, 11 May 2011 23:56:46 +0100
Message-ID: <4DCB142E.90106@wildgooses.com>
References: <1304489658.32272.19.camel@compot-mob>	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>	 <4DC26A0A.8050402@tana.it> <1304587479.6402.3.camel@compot-mob> <4DCAC715.3090206@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DCAC715.3090206@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: nowhere <nowhere@hakkenden.ath.cx>, netfilter@vger.kernel.org

On 11/05/2011 18:27, Alessandro Vesely wrote:
>   For a shot in the dark, packets seem to get
> lost if they arrive between the first one and the corresponding call
> to nfq_set_verdict.  

I know absolutely zero about your problem, but the bit above reads
exactly like a buffer overflow somewhere?

Good luck

Ed W
