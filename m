From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 23:30:17 +0100
Message-ID: <4C9BD4F9.3020107@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@o
 bet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com> <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr> <4C9BC8C9.2090504@googlemail.com> <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=j04Z3ktHA5Wq6kPiiNPxJuND0j8Yzgg9fe19ZE+X17c=;
        b=spPoBmT0NPX11gTP9Nq9dqmUABCeP6hFDbHk9DPq0ZoNKGY/cG1I1KqLbbTGcgoSl2
         a+I6Gnaoa7+dJKH32Sv/OD/A9k+rQZa/bvzHJAuKV/HeiQoiy35471IEs22Bl5tsM5WY
         gcOoyCmloElOJOh62bRozl92m/FRgD6vdDo5g=
In-Reply-To: <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov


>> I am merely suggesting a fix for what should have been released in
>> the first place by correcting the value of secmark to show the
>> proper context instead of a number which means absolutely nothing to
>> anyone.
>>     
>
> Exactly. Since the number is useless to most people, the procfs file
> practically never had the feature "display useful secmark". Which
> means that changing it is a feature addition rather than a bugfix.
>   
Actually, no! The last time I checked this field was named secmark, not 
secnumber! By its very name, secmark should have been displaying ... 
well ... the secmark of that particular connection!

Whoever designed that part of the interface (it wasn't you by any 
chance, was it?) thought, wrongly, that secmark means 
'show-me-the-internal-number-the-kernel-uses-to-identify-that-security-mark-for-that-particular-connection'! 
That, as already Eric pointed out, was wrong - the kernel should never 
show its underpants in userspace (very well-put, I have to say!). So, by 
all definitions - this is a bug (and not an additional feature) and it 
has to be corrected.

What I cannot understand is this - why are you so stuck up on this not 
getting corrected - are you afraid that if the secmark field bug is 
fixed your precious conntrack-utils won't have as much appeal?
