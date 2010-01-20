From: Carsten Aulbert <carsten.aulbert@aei.mpg.de>
Subject: Re: SNAT and FIN/ACK packets after a long time
Date: Wed, 20 Jan 2010 16:39:53 +0100
Message-ID: <201001201639.53692.carsten.aulbert@aei.mpg.de>
References: <201001201513.35390.carsten.aulbert@aei.mpg.de> <4B572009.9020105@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B572009.9020105@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday 20 January 2010 16:23:53 Mart Frauenlob wrote:

> -t filter ... -m state --state INVALID ... -j DROP
> 

That's it, you nailed that one.

Sorry, that we missed it, maybe we have just too many well written/behaving 
programs ;)

Cheers

Carsten
