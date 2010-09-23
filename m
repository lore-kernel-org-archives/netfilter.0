From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 21:53:26 +0100
Message-ID: <4C9BBE46.8020106@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.169
 76@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <alpine.LNX.2.01.1009232234400.21529@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=5uFlkFVpFBC36PRRbQFaLvQqIQDeA9qCzlTBEST1ndg=;
        b=yGCA7I2b23WegJ8vuWZVnkUBkDgGiRAb49H6sIHFUIjykjgS3DHxFdvrOoRTk7mV4n
         cp2fFa1B6wR7qyspfXDsmtc+FAjLHwEDzV39mBTaeS+0NIrPEylQdspbL82eoraO30VV
         J2dsf/hQGp6WFVKu3RYXM5cHdvBgkbDSSg144=
In-Reply-To: <alpine.LNX.2.01.1009232234400.21529@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


> No program hard-depends on "secmark=" (not: no program depends on
> procfs/nfct). That field does not show up if you have SECMARK
> disabled - it is guarded by #ifdef - so any parsers out there
> have to cater for its absence. In other words, it is safe to
> remove the field from the output.
>   
Why should that field be removed though - please give me a valid reason? 
The earlier suggestion, by Eric, was to replace the value of it with its 
proper text - this is how it should have been done in the first place!


> I would prefer for the procfs interface to cease existing. At the
> very least to be not added to any more, per consensus
> http://markmail.org/message/h7qeomrtjjjtptio
>   
See my earlier reply - I do not see the need to bloat my images and add 
yet another set of tools for which I have no use whatsoever!

For what? For the dubious privilege to be able to see SELinux contexts 
in text when I could continue to use secmark in the form in which it 
should have been designed/developed in the first place - with its proper 
SELinux context showing instead of that useless number?
