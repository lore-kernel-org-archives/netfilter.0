From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 22:53:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com>
 <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com>
 <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com>
 <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Paris <eparis@parisplace.org>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


On Thursday 2010-09-23 22:34, Eric Paris wrote:
>>
>>I use it a lot via 'cat' and Shorewall (via 'shorewall show
>>connections'). I use it for one particular reason - to track
>>SELinux contexts (text, NOT numbers!) on active connections. So, am
>>I going to see the SELinux context for each connection in text
>>without the need to use conntrack-utils or not (simple 'yes' or
>>'no' answer will do)?

That's like saying we need /proc/self/df just so that we can know the
fill state of disks without resorting to a userspace tool (oooh~ god forbid!).
