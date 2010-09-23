From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 21:05:18 +0100
Message-ID: <4C9BB2FE.4040201@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+
 7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=1qPac9S8JqKEgj3/m3omBtS0y1tHoY6yHLYf/HTP4pY=;
        b=Cu2Sy25TDbTApqUWFyRrjCbRPpi93/QvQp88fTJx4ukVjvK3uvl7cUv4nAaFIqMjoR
         KWK7Tt+5BD9XVggU2jAMBv1yLOoCuD08dHHjSOUxcTi4lSm70OlfGspo7DfogPZkbU8L
         JijqFAgIX/tU1L9PO/42i5l+i++BmSATLfUhQ=
In-Reply-To: <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


>> What happens to the new /nf(s)_conntrack
>>     
>
> If anything, secmark=x be removed. Abusing procfs is deprecated.
> No userspace program depends on it.
>   
Sorry, but I've never suggested that useless number be kept in any shape 
or form anywhere (please read my posts on this very thread)!

There was a patch from Eric (I think about 2 days ago) showing 
secmark=<selctx> in the output of nfs_conntrack and I assumed that will 
be adopted. Is that no longer the case and if so why?
>   
>> and iptables -L?
>>     
>
> As was said earlier (by Eric?), the secmark/u32 value is useless and
> that secname (aka. selctx) should only ever be used. That is
> already the case with x_tables.
>   
I've never suggested that the u32 was ever useful (it was actually you, 
who asked me to devise a patch translating it into the actual text when 
I suggested that this number is pretty useless, remember?).

Again, I assume that when I use "cat /proc/net/nf(s)_conntrack" I would 
be able to see the proper translation of the SELinux context for all 
connections and not that useless number (the whole reason for me 
starting this thread). I think I've made myself perfectly clear on this.
