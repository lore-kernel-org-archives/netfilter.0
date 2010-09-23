From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 21:18:08 +0100
Message-ID: <4C9BB600.6020300@googlemail.com>
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
        bh=+Vrk6NJ5FL6x++IGCetG4pgO+ADYAMw45ZCIl0dqdCM=;
        b=IA89addMC0K8fwIcROxnU5rfZYxA4UK/SvahpaBU0kln48NaYeQ73wwkcWlGWyUdYn
         8gXJB/QhdpwGvPxDDjslooGO50O/d7pO0HNEdoGVzT/FNNUsn11mxKgXwajWcoS7YObY
         N8o3sxfcTLjKeqek0UzJW7UoQTDdFRT1Wge6w=
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
I've just read the above again. Are you actually suggesting that no 
program in userspace uses /proc/net/nf_conntrack? If so, you are 
mistaken my friend!

I use it a lot via 'cat' and Shorewall (via 'shorewall show 
connections'). I use it for one particular reason - to track SELinux 
contexts (text, NOT numbers!) on active connections.

So, am I going to see the SELinux context for each connection in text 
without the need to use conntrack-utils or not (simple 'yes' or 'no' 
answer will do)?
