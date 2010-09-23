From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 22:38:17 +0100
Message-ID: <4C9BC8C9.2090504@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAG
 F7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com> <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=tpWx6FspsTc7RcFZhMDdZ+HK9rzVyCClpGo88MgZItA=;
        b=Say13nh5s2H2n61VnJRzrAudNMEhYEO0pT/Mcg1w0w9MdlgxxHuy1U9K6fLLFVPUxa
         XdtAxzDVFNUT9fAy0/bhfBdiU1uJNC4TX2NhlN03bvpM25XjeuFvvXMAufXqY3/XzNAI
         J7/ZVBIeDuUt3yZeUJ5rPKcS7WIEDbD4NvIQI=
In-Reply-To: <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


>> What is that suppose to mean? Are you suggesting that for the dubious privilege
>> of seeing secmark=<selctx> - the way it should have been developed in the first
>> place - as oppose to secmark=XXX as was the case up until now, I have to
>> install your set of tools? I don't think so!
>>     
>
> The trend is clear. If we were procfs fanboys, we would not need
> sysfs. Or securityfs. Or debugfs. We'd have everything in /proc.
>   
Please read again what I wrote above. Where did I state that I need 
"everything in /proc"? I am merely suggesting a fix for what should have 
been released in the first place by correcting the value of secmark to 
show the proper context instead of a number which means absolutely 
nothing to anyone.

> You can think whatever you want.
I find the above rather condescending - what is that supposed to mean? I 
think that you need a bit of help with anger management.


>  It's just hypocritical wanting to
> add a feature to an infrastructure that practically every developer
> consented to not abuse further.
>   
Again, read what I wrote above - I do not ask for an addition, just a 
simple correction of something which should have been done properly in 
the first place. How is that "hypocritical"?

