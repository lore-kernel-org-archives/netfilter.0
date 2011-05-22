From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 22:32:31 +0100
Message-ID: <4DD980EF.9010901@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr> <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu> <4DD86081.1020703@googlemail.com> <alpine.DEB.2.00.1105221157540.25858@blackhole.kfki.hu> <4DD8F71E.2010004@googlemail.com> <alpine.DEB.2.00.1105222319130.27638@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=DJ4AYSUlSEz83L8T/YMwuuh8ImZdrxBZiJurUdQhitI=;
        b=GNhITqegSJoiUfOaFGVMObDOrxEepTxvrk3ebX5/NiruVREMWfVmuuUeoK00bJy4xO
         tIbRlpQ+RYOxqd1ZEQd7uOFVwl98cH/yCP+w//yfeaQs2NnBYYnbdXfAZcYVOoN86ZoT
         V0xqZrXDscTP+pzl0gqAGbxTI1/S35axus7qs=
In-Reply-To: <alpine.DEB.2.00.1105222319130.27638@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org


> Thanks, that helped a lot! The ipset binary doesn't handle different sets 
> in a single restore file. I'll fix it in the next days.
>   
Interesting! The file I had with the 3 hash:net sets in it seems to be 
restored OK without any problems after applying the patch I've got from 
you yesterday (the sets I enclosed in the post you quoted were from a 
different file though). The problematic statements seem to be bitmap 
sets (bitmap:ip as well as bitmap:port)- it also looked to be choking on 
IP addresses specified as cidr (i.e. x.x.x.x/x). Anyway, let me know if 
you need anything else from me.
