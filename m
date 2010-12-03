From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: cross compilation of xtables fails
Date: Fri, 03 Dec 2010 20:04:40 +0000
Message-ID: <4CF94D58.6080008@googlemail.com>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com> <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr> <4CF8FF76.8040709@googlemail.com> <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr> <4CF94596.4080002@googlemail.com> <alpine.LNX.2.01.1012032044120.26825@obet.zrqbmnf.qr> <4CF94A8E.6060108@googlemail.com> <alpine.LNX.2.01.1012032054100.26825@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=t4zwR6QYIELHz8YVxncO90czCTBc8SK4cDgBzzEVf24=;
        b=hUnzn77ycH24Fi/sbBS6a6JrY9h+PD/TeVGrNaKB1MFFzN0FWxOk80LCq2CkTlCxwH
         OUmVvsyM9jndPtPbBolviuJ90RRm4KCYbhhy0v8Th6LsRUQJLqLlsgMqqCr9eRzljnDj
         y7DaqmgoXaL00kzrtKenAkOmTl5/Jonh2dQPw=
In-Reply-To: <alpine.LNX.2.01.1012032054100.26825@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


>> I presume I need to attach add "-march=i686 -mtune=pentium2" to LDFLAGS as
>> well, seeing that gcc executes as "gcc -shared -m32 -o ..." if LDFLAGS="-m32",
>> right?
>>     
>
> No, -march and -mtune are compile flags.
>   
OK, I am perfecting it now...Thanks a bunch for helping me out!

On a side note I see that in 1.31 --with-xlibdir is removed - how would 
xtables know what I am compiling/building for (x86_64 or i686)?
