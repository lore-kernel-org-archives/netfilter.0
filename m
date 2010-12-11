From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 01:02:25 +0000
Message-ID: <4D02CDA1.6030408@googlemail.com>
References: <4D02C8D5.6080805@googlemail.com> <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=mC5a/8GPH7fLp5jxnOmrdY6StdhO5fU7FVqDRjJ1oKc=;
        b=S4ATadlkIiZCiZMZUDB7jW4Z97d0AAwoAtVjlQb+InZ1u6gdX2Io9kK8fXkwGkJDA0
         uVipdUQtNHdEf5qx3ScGGPS1GksVequmUyjZVjrsFkADZnlCSG6ioMLuhWd+zKfh/dSd
         PuxkjiYVPHVcRO9gGoBy1KL7QeP6pIlXoYRKA=
In-Reply-To: <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


>> Any ideas? From what I remember there was a similar problem with a couple of
>> files in 1.30!
>>     
>
> Hooray. Another victim to ALIGN. The problem is not xtables-addons,
> though. (Please complain to your distro if they have not updated
> linux-glibc-devel yet.)
> Further info:
> http://www.google.de/search?q=ALIGN+xtables+kernel
> http://bugs.gentoo.org/325257
>   
Erm, I am not sure! I have no problems compiling 1.30 and XT_ALIGN is 
used there. For reference:

uname -r = 2.6.34.7-61.fc13.x86_64
rpm -q glibc-devel = 2.12.1-4 (for both x86_64 and i686 as I am doing 
cross compilation a lot)

So, is there something wrong with the above versions, which needs to be 
fixed?
