From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables-addons "--without-kbuild" not listed in ./configure
Date: Wed, 27 Apr 2011 13:20:55 +0100
Message-ID: <4DB80A27.3080501@googlemail.com>
References: <4DB758F4.8010000@googlemail.com> <alpine.LNX.2.01.1104271405380.12564@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=TqkOd6FdN89Cu0SIRX7apCgLbBCBG+NTxc6EfStUjoA=;
        b=m2hEQQ/U0It9pUjma+09mLBeLxBNBV7ybvvEPzXa1VzKK9UyPxGlEcBhUmrPjxcdhI
         lzG6KoVpmpRhpzULMXMFob8AN19LELnImg9gKPd6vyIEeZxWmahsZgFAo7ukQeNIroRe
         z93DYX48LdpPjjAIqoYVbv93TaqeRHeuu99as=
In-Reply-To: <alpine.LNX.2.01.1104271405380.12564@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>> I have just discovered this option by looking at the changelog on v1.35 
>> (yeah, I know!). Is there any reason why this option isn't listed in 
>> ./configure --help?
>>     
>
> The option was not officially supported in xt-a.
>   
Is it officially supported in 1.35? Is it going to be dropped in future 
releases? Using that option seems to do the job (and helped me remove 
two of the patches I used to apply to preventing building of the kernel 
modules).
