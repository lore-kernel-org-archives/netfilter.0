From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables/geoip vs ipset
Date: Fri, 10 Dec 2010 13:13:18 +0000
Message-ID: <4D02276E.2050901@googlemail.com>
References: <4D0162F2.5050208@googlemail.com> <alpine.LNX.2.01.1012100053080.31690@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=bBqdkNg8N2Dcplzd2KfHdYOazSO5hBrzrynMzcudUs0=;
        b=MP7phh4KaabyAY1x1dPe7ZXZQWK4a00bVLiNvZd/KnLwNnHsTk7d+OKbjUMXbjN8ks
         FU6/hIGOgFhLmo0AU55swIHWjvwOF75+zWSgXvgxfLRoEEElg8Rds8yQGRFYes8ECQVb
         tUHwIyrX6bfIgzR+pe/snA3DZDEcgovkvrjSM=
In-Reply-To: <alpine.LNX.2.01.1012100053080.31690@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


> The geoip target uses a bisection search, so the US database's 
> 19000-something entries are testable in roughly 15 steps.
> Since it does not need any extra structures, it only takes as much 
> kernel memory as the .iv0 file on disk.
>   
I was much more interested in the performance of xtables/geoip vs ipset 
rather than how much memory it uses.
