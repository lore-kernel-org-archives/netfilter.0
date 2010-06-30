From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Wed, 30 Jun 2010 16:09:53 -0500
Message-ID: <4C2BB2A1.40406@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>	<4C262DA2.1040103@riverviewtech.net>	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>	<4C2805A3.4070801@riverviewtech.net>	<AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>	<4C2909D9.8010506@riverviewtech.net>	<AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com>	<4C2A49A3.1030600@riverviewtech.net>	<4C2A49F6.2060704@riverviewtech.net> <AANLkTinR6BX8jk6QRl3j-srd1_yprRQz30cKJjGNLtGd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinR6BX8jk6QRl3j-srd1_yprRQz30cKJjGNLtGd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/30/10 15:54, Anatoly Muliarski wrote:
> A nice idea.

;-)

> I have thought about it a bit earlier.

Nice to know that I'm either not (too) crazy or that I'm not alone in my 
thought process.

> BUT linux implementation of bridging has two limitations that makes 
> it impossible:

Hugh???

> 1. There cannot be nested bridge devices.

That would be a show stopper.

> 2. Each device can belong to only one bridge device.

I was aware of this second limitation.  But I don't think I was 
(directly) making a device more than one bridge.

> Eventually I have come to understanding that my problem has no fine 
> solution with no risks for performance. Partially I can solve it on 
> application layer, partially by using bridging.

*nod*

At least you now have a better understanding of what you are trying to 
solve, which is helpful when trying to solve it.

> And talking with you enlightened me on the ways of doing it.

I'm glad that I was able to help.  Even if I just held the flash light 
and you did the discovery on your own.

> Thanks for your efforts and ideas.

You are welcome.

I'm going to give another reply for an even more strange idea (extension 
of my earlier idea) that might get around your first point above.



Grant. . . .
