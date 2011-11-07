From: Ed W <lists@wildgooses.com>
Subject: Re: libiptc or alternative
Date: Mon, 07 Nov 2011 07:58:20 +0000
Message-ID: <4EB78F9C.70907@wildgooses.com>
References: <j91h2m$sp4$1@dough.gmane.org> <20111107010219.GA30000@1984> <20111107010309.GB30000@1984> <j97eko$hs7$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j97eko$hs7$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On 07/11/2011 02:09, U.Mutlu wrote:
>
> Hmm. I think in my case this method is suboptiomal because my
> iptables rules do change very frequently (ie. banning individual
> ip's at different times and then unbanning each after say x minutes,
> again individually, ie. not as a group).
>
> I think in this case I should stick with libiptc since it's still
> part of the official iptables distribution.

This is starting to sound like something ipset could help with?

Ed W
