From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 01:26:12 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C97D6D6.9040805@shorewall.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Eastep <teastep@shorewall.net>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>


On Monday 2010-09-20 23:49, Tom Eastep wrote:
>> printf("selctx %s ", info->u.sel.selctx);\
>
>That breaks iptables-save/-restore. The attached patch does not.

But still has the rogue \ at EOL.
