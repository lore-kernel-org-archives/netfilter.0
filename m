From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons ACCOUNT
Date: Wed, 27 Oct 2010 22:28:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010272227040.27723@obet.zrqbmnf.qr>
References: <201010181712.03160.maarten@ba.be> <201010201503.14624.maarten@ba.be> <alpine.LNX.2.01.1010201927490.17703@obet.zrqbmnf.qr> <201010211331.44611.maarten@ba.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010211331.44611.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org, Bob Miller <bob@computerisms.ca>


On Thursday 2010-10-21 13:31, Maarten Vanraes wrote:
>> I fail to reproduce this in 64-bit and 32-compat environments.
>> Since ACCOUNT.ko and x_tables.ko do output appropriate messages
>> to dmesg along with returning EINVAL... I don't see much
>> possibilities.
>> 
>> One could be that you are using an overly old xtables-addons (< 1.27)
>> compat_xtables.ko with an overly new kernel (>= v2.6.35) -
>> combined with having ignored the compile warnings/errors (when
>> building from source, as DKMS unfortunately does).
>
>hmm, i'm using xtables-addons 1.26 (i thought this was the latest?) i built 
>this one from source.
>
>my kernel is 2.6.26 (so it's not overly new)
>
>since i compiled xtables-addons myself, i didn't see any compiler warnings

I can't boot pre-2.6.27 anymore with my userspace, and I don't feel like
spending time on installing a system. So unless someone has one for me
ready to toy on, I'll rip out the old support.
