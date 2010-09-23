From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Fri, 24 Sep 2010 01:59:01 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr>
 <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com>
 <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com>
 <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr> <4C9BC8C9.2090504@googlemail.com> <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr> <4C9BD4F9.3020107@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C9BD4F9.3020107@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


On Friday 2010-09-24 00:30, Mr Dash Four wrote:
>>> I am merely suggesting a fix for what should have been released in
>>> the first place by correcting the value of secmark to show the
>>> proper context instead of a number which means absolutely nothing to
>>> anyone.
>>>    
>>
>> Exactly. Since the number is useless to most people, the procfs file
>> practically never had the feature "display useful secmark". Which
>> means that changing it is a feature addition rather than a bugfix.
>>  
> Actually, no! The last time I checked this field was named secmark, not
> secnumber! By its very name, secmark should have been displaying ... well ...
> the secmark of that particular connection!

In a way, it did display the secmark. :-) Just like ipt_LOG prints
nfmark or IP addresses. The values may not mean much to the outside
world, but that's what we have DNS and selctx (James's original
naming) for.

>What I cannot understand is this - why are you so stuck up on this
>not getting corrected - are you afraid that if the secmark field bug
>is fixed your precious conntrack-utils won't have as much appeal?

It is not "my" conntrack-utils by any means. If users would not
constantly insist on using outdated interfaces (and I _do_ grant
things their transition time), and if maintainers would not always
give in to these users, we would have less code to worry about, or
even have these discussions.
