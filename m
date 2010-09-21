From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 23:29:48 +0100
Message-ID: <4C9931DC.8000800@googlemail.com>
References: <4C9696E5.4030803@googlemail.com>	<alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>	<4C973A6A.9010809@googlemail.com>	<alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>	<4C9756AB.5040304@googlemail.com>	<4C97D6D6.9040805@shorewall.net>	<alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>	<4C988214.6050600@googlemail.com>	<4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=cQmDP202TvvPh3eJZDGtuk6gKL2pOF34/1z+T30O08Y=;
        b=YjiGDucBtJI8r4jXNQJ479e+GdJyF6TC3KbvJBYNSOSkAaIZz9APfHzppZIgsAMO68
         EiOpKjrslK6XnCQV/oDmMtq+yLPPFaQhebaKWWgQexHvEw31zJfKqMQYIyVLa7F1urwB
         OCZOFe3/ThwcUMHPsACu47+fXY8E4lZtI6+2c=
In-Reply-To: <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Paris <eparis@parisplace.org>
Cc: netfilter@vger.kernel.org


> No disagreement that Tom's patch is better than what we have today, I
> just claim that what we have today is completely wrong, so this is
> only slightly better   :)
>   
No argument there!

> sids, secids, secmarks, or whatever you want to call that u32 is just
> a dynamically generated number which should only exist inside the
> kernel and should never be shown to userspace.  Loading secmark rules
> uses a full context string and then uses that string to generate a u32
> which the kernel can efficiently use.  When we display things back to
> userspace we should always be converting that u32 back to a string.
> I'm working on a patch to do this (actually it's compiling while I
> type)
>   
Again, we are in agreement - 100%

What baffles me really is how has this survived for so long?

The secmark field number has been there, I assume, for ages and yet 
nobody could make sense of that number let alone, as you rightly pointed 
out, raise the issue that this number should not be there in the first 
place!
