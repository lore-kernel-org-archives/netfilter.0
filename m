From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-5.0 released
Date: Thu, 23 Dec 2010 22:23:20 +0000
Message-ID: <4D13CBD8.3090007@googlemail.com>
References: <alpine.DEB.2.00.1012172259100.10231@blackhole.kfki.hu> <4D0CC3BB.8030801@googlemail.com> <alpine.DEB.2.00.1012182050280.11577@blackhole.kfki.hu> <4D0D2CF4.5070201@googlemail.com> <alpine.DEB.2.00.1012190105460.11753@blackhole.kfki.hu> <4D0E0E2A.3090604@googlemail.com> <4D0E22A5.8090808@conversis.de> <4D0E3B34.7090105@googlemail.com> <alpine.DEB.2.00.1012221146060.3482@blackhole.kfki.hu> <4D11F384.3070908@googlemail.com> <alpine.DEB.2.00.1012231558390.6044@blackhole.kfki.hu> <4D138C02.3050905@googlemail.com> <alpine.DEB.2.00.1012232008520.6582@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=81uGpArFDuXMwxTRs76RAZDm7Q3QNNSkBsJ8UTH7bfI=;
        b=S/R4eU5uNSy4mBIZvEVjmtVJEVsb75buTqGFZsf7B3ek+8xg4Bg1r225oV23Eya1h6
         Oh9iafqzQixgLrpqGy4Rb0xxFRtB9orswUJLnrmflMmtLaQwEK8K/KSGPK60Lt/TtjP8
         Mm9h0ebd1QTEb9/FkAwVARIEhgBIKJWh7zAWI=
In-Reply-To: <alpine.DEB.2.00.1012232008520.6582@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Dennis Jacobfeuerborn <dennisml@conversis.de>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org


> The implementation behind ipset looks up the  (ipaddr, proto, port) triple 
> in one step. Such packing don't work there.
>   
If that's the case how do you lookup IP address and port ranges then?

