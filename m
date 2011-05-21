From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 22:41:27 +0100
Message-ID: <4DD83187.2060301@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=0glkP2oPTq0SsLfHGa8uhraJ0TCSx/lONbp65MPMXCQ=;
        b=eaqIX93a7Hol9TTpj12eRQrxuSAStthY0C78Dx7ucDrOuq6ZfqmRTnfvqT0h74OKPp
         1YVLNIRe2eGg1dW0WUUKzAYLIFB0N+ZtlnT1QZe26vv6oxvbqKFloopd5F86VK0ZeiTW
         2HDqKKpu6JdkrHCJgFqU6ImmXnWZL1GJHz0hA=
In-Reply-To: <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


>> I could not get such segfaults at all.
>>     
>
> Nevertheless, I would recommend to mr-4 to have a ipset and libmnl 
> compiled with debug info, point to it via LD_LIBRARY_PATH, and then feed 
> it through valgrind with the same input. That may give some more 
> insight.
>   
I am willing to help if you let me know what I need to do, though this 
will be done in the coming days as I have other things I need to take 
care of and ran out of time, unfortunately.
