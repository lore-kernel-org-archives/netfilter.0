From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 12:44:40 +0100
Message-ID: <4DD8F728.6060706@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr> <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu> <4DD86081.1020703@googlemail.com> <alpine.DEB.2.00.1105221157540.25858@blackhole.kfki.hu> <alpine.DEB.2.00.1105221235150.26039@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=ToCuJabB1rzHnN9oHEPti9DVg3weLVSw3z7efFaRUSI=;
        b=MXOk8EQjmTe7AZunAjXU+yzK4CXykShFWZlflmBUcTdv1lB1go51agFSb8RRJyRY8Y
         GvAC07v4gb+1KSz152uwteRqEWyeT3+/bX8me/n+UyAkSQF3vQP9YEJbm0Lw49V/G7iO
         ubowv4nyZ6VFQ/ArlKZ5H4k9qxhvFCJcRmfwk=
In-Reply-To: <alpine.DEB.2.00.1105221235150.26039@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org


> And send me the architecture you run, maybe it's an architecture-dependent 
> issue. My test environment is x86_64.
>   
No, it is not. I tried this on i686 (P2 as well as P4) and x86_64 
(Core2) systems with the same effect and errors, so it is not 
arch-dependent error.

