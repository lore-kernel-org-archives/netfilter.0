From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: cross compilation of xtables fails
Date: Fri, 03 Dec 2010 19:52:46 +0000
Message-ID: <4CF94A8E.6060108@googlemail.com>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com> <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr> <4CF8FF76.8040709@googlemail.com> <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr> <4CF94596.4080002@googlemail.com> <alpine.LNX.2.01.1012032044120.26825@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=pC6W5Iks8MB0RYZvYcJhfeCPtL9VTl0bjLQU6Dubsmc=;
        b=A0njuaX22UkL2LNluS/4vyPUXvV1nUkIWrKE86I3UTRjtwq/nPwXGh8Dyjnf83tV3x
         2MQQuHoLgpjIMTlO/kD7GFNoUjqO1+JGbhlXX5jzubnXEYcjwgZzK1Pl+1Rfd4/9bcAA
         VNApcXyy5WU71ZKAAP5kdsT6+7yEKltc3F8OE=
In-Reply-To: <alpine.LNX.2.01.1012032044120.26825@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


> As I thought. You forgot LDFLAGS="-m32".
>   
Nice!!! It works now!

I presume I need to attach add "-march=i686 -mtune=pentium2" to LDFLAGS 
as well, seeing that gcc executes as "gcc -shared -m32 -o ..." if 
LDFLAGS="-m32", right?
