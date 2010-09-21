From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 10:59:48 +0100
Message-ID: <4C988214.6050600@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=uJI0+osRUnPH68bWfyhDYh0fONthpIZpo4zPu8/4qC8=;
        b=teYrnYwxslMoP9t8LTwUD+VX2HP+3+y7eqQu3VoJWGWJnMVETxm3wgwXgi7AriyAj3
         wAO23crAHe5zINm6rJXKwHJiaObaZ9osNZyhC5vPOogqzZN+K3pRphxkWA16H9x9FoaW
         TDyR4qbsAKJvi36U9o/PqrKxwRi1ikUIeMwpo=
In-Reply-To: <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Tom Eastep <teastep@shorewall.net>, netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>


>>> printf("selctx %s ", info->u.sel.selctx);\
>>>       
>> That breaks iptables-save/-restore. The attached patch does not.
>>     
>
> But still has the rogue \ at EOL.
>   
Splitting hairs!

The real question is - when would these pairs (SELinux/SELsid) be 
included in the new release of iptables/netfilter (as I posted before - 
ideally, as a separate branch in /proc/net)?
