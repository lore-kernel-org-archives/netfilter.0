From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 21:38:36 +0100
Message-ID: <4C9BBACC.4080906@googlemail.com>
References: <4C9696E5.4030803@googlemail.com>	<4C9756AB.5040304@googlemail.com>	<4C97D6D6.9040805@shorewall.net>	<alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>	<4C988214.6050600@googlemail.com>	<4C9911CE.6090209@googlemail.com>	<AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>	<AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>	<alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>	<AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com>	<alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr>	<AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com>	<alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr>	<AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com>	<alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr>	<4C9BA88E.7080507@googlemail.com>	
 <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr>	<4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=fhbTytQpQUZjhl61UKaigxn0KTah4MgZiIYOt8OFhjI=;
        b=xHzXD97q5JS177KL2lMehKqUrlkjm6fGvFRwxPp26pTTJbyIURlTH/9gJrudN7lIN3
         cBvUSgc5WYN9eix8cT+vdUNEJpmy5FFcgGPV8V369nsOg7aLnl4Laj43cIA357rWSp6w
         GO10MHsqVzK9wxkFeIgSVZtXvG+Ca1WhZ8xFI=
In-Reply-To: <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Paris <eparis@parisplace.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


> I will send a patch series for which the answer is 'yes' and we shall
> see what everyone agrees to commit.
>   
Thank you Eric!

Seeing the SELinux context (as text!) is vital in my line of work and I 
don't see the need to bloat (no offence, Jan!) my distros unnecessarily 
with additional tools for which I have no use whatsoever!
