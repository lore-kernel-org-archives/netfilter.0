From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.9.1 released
Date: Thu, 15 Sep 2011 10:51:13 +0100
Message-ID: <4E71CA91.5080402@googlemail.com>
References: <alpine.DEB.2.00.1109062143300.9388@blackhole.kfki.hu> <4E713E0F.1050403@googlemail.com> <alpine.DEB.2.00.1109150846290.5001@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=+ZxPEZovPB0cUn13B9caUOteqjymKNyvf66I7isD9YE=;
        b=gn36W/cB9F/WNWMIS56CiA5z6Xmq+/7+EhmUzgeBa+2yPY2GuGbzyenX0oYv8/u/wT
         SNAZuWnNOxcE5WbpnxqQvr8FysU2rivK5FYEqTvEmXccCV5MfqmPnkeEAuCpSWFL0/do
         RoCAPAfIahMDA3K+0tcLZwCqenq/3GhlS7ya8=
In-Reply-To: <alpine.DEB.2.00.1109150846290.5001@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> I suppose you are trying to compile the kernel part of the package 
> directly. What should be done is as follows:
>   
No, actually, I am building ipset as part of the kernel built - I patch 
the sources (i.e. "copy" most of the files in kernel/include and 
kernel/net to the kernel tree) and then (trying to) build the kernel 
itself in the same way as I did with 6.8. The difference this time is 
that I've got the above errors. These occur during the kernel built - 
sorry, I should have made this clear.

