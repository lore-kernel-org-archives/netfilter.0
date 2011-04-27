From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables-addons "--without-kbuild" not listed in ./configure
Date: Wed, 27 Apr 2011 14:48:56 +0100
Message-ID: <4DB81EC8.8050907@googlemail.com>
References: <4DB758F4.8010000@googlemail.com> <alpine.LNX.2.01.1104271405380.12564@obet.zrqbmnf.qr> <4DB80A27.3080501@googlemail.com> <alpine.LNX.2.01.1104271452260.19268@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=4HEYtr6iyoXrYCGuEuNsX47RX08C1PFMdH92pzvfQMg=;
        b=kf5v46Ql1w48TGuFFbpC5Cbbapj9ngtMCp5yiA4r6WhOPdZ2fPjznJLVSXTdGvcV4d
         issuKGw5PMNSUJIG6LL0LWms0onMEq55n+1ZYjDgylprWZloQ0DtRnSPNNp+DG0daj91
         YVZW78vPLkbN5+zh6Wo7RCpYT5ZdDMkMaVhfI=
In-Reply-To: <alpine.LNX.2.01.1104271452260.19268@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>>> The option was not officially supported in xt-a.
>>>       
>> Is it officially supported in 1.35?
>>     
> After reviewing the situation, it can be declared supported in 1.34 and 
> up. The documentation will be updated.
>   
Excellent, thank you! There is one thing which is still overlooked 
though - Makefile.am has a line with "depmod" in it, which would also 
needs to be removed if "--without-kbuild" is used. I have a patch, which 
is applied in my version of xtables-addons.spec dealing with that 
particular issue - thought to mention that too so that it could be fixed.

