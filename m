From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: cross compilation of xtables fails
Date: Fri, 03 Dec 2010 21:02:35 +0000
Message-ID: <4CF95AEB.50507@googlemail.com>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com> <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr> <4CF8FF76.8040709@googlemail.com> <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr> <4CF94596.4080002@googlemail.com> <alpine.LNX.2.01.1012032044120.26825@obet.zrqbmnf.qr> <4CF94A8E.6060108@googlemail.com> <alpine.LNX.2.01.1012032054100.26825@obet.zrqbmnf.qr> <4CF94D58.6080008@googlemail.com> <alpine.LNX.2.01.1012032116440.26825@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=zMV7bZB6X/n82bE1reuQI8Lg8XdEd4cnOQNW9R0GFYQ=;
        b=cgXiDVJMNuWhQjIwdhK+hOvhnKRygAGk1xeK9X6z2+TcWgj8ckXPVUVNG2OJa3X3PX
         1f6kdKx+AcLgTU2v1cmOW1OiXGE1xfPxVUrF/gbz+Bqsy+AJf4uy2vuaL6wF154Q13sB
         vkVxQAEeZjsRB2FGUTtjmH1H8kJ8WvfSEJRtk=
In-Reply-To: <alpine.LNX.2.01.1012032116440.26825@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


> It never used xtlibdir to determine what you want to build for.
> You tell it via --host and cflags/ldflags/etc.
>   
Right, I will probably get a new xtables version installed if/when 
Jozsef gets the ipset kernel bug fixed and see if I can build it for 
both platforms. Thanks again.
