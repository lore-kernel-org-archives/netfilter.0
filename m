From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 21:51:02 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net>
 <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
 <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com>
 <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C9BA88E.7080507@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


On Thursday 2010-09-23 21:20, Mr Dash Four wrote:
>
>> `./conntrack -L` is then what you use to test the changes.
>
>Have I missed something? Are you actually suggesting that in order for me to
>see the new secmark changes (SELinux context shown in its full text glory
>instead of that useless number) I have to install conntrack-utils and use
>conntrack (the executable)?
>
>What happens to the new /nf(s)_conntrack

If anything, secmark=x be removed. Abusing procfs is deprecated.
No userspace program depends on it.

>and iptables -L?

As was said earlier (by Eric?), the secmark/u32 value is useless and
that secname (aka. selctx) should only ever be used. That is
already the case with x_tables.
