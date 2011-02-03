From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-6.0 released
Date: Thu, 03 Feb 2011 20:23:06 +0000
Message-ID: <4D4B0EAA.1040106@googlemail.com>
References: <alpine.DEB.2.00.1102031353130.31387@blackhole.kfki.hu> <4D4AE0B6.6040108@googlemail.com> <alpine.DEB.2.00.1102031914120.32002@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=HkRCv07lrP7BrEsUoys11zHmn3GHLfYWlPJcDz610C8=;
        b=u9z0qrXy3ndiC3c7Z1Rpo5pJ0BgOG0yD+46AsBRskHl45yuZqqhedsN2ziFZ2/EAbZ
         h7fqtrO7PqZZ5xxcJVhAPZY1RJ+HZQf8fYxKHqPfRxcPw0U0RIGGPXQaJml6d3HP7+NU
         xx5Z8gyOc6tgJtSHw/4CM+0juPjeEfCgjcD9w=
In-Reply-To: <alpine.DEB.2.00.1102031914120.32002@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> You still have to compile the kernel modules from the source tree of ipset 
> (unless you use the nf-next-2.6 or net-next-2.6 git trees of Patrick 
> McHardy or David Miller).
>   
That, I assume, is the .38-rc version of the kernel, right?

> When the kernel part will be available from the vanilla kernel tree, I'll 
> announce it and update the documentation in ipset as well.
>   
Thanks, that's good to know!

I assume that if I create a separate .spec file (in Fedora terms) and 
just try to build the userspace part of ipset v6.0 and then use the 
.38-rc version of the kernel I would achieve the same result - is that 
the case?

