From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 16:18:05 +0100
Message-ID: <4DD291AD.7030300@googlemail.com>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu> <4DD256F7.7050007@googlemail.com> <alpine.DEB.2.00.1105171321190.31927@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=W3KVfEP3PTZPxXC8d3RiceLXGq6KN7AwM057qv2Ju6s=;
        b=e8XbQKzUsGP9mb3q991AUxqI5JVAQnI9lR3mESmiOfu+2vD9/SaTm/hELup3YLAxLF
         NXqMimdHlY3aspuO1RwgXpfLA63zvHkEclFv2GSBVtQjIuhShy42OpHbpFDOrelsAWxi
         YmTaoTbKjuLPieZ2l6x804/Hbad4L0Ii1yu/U=
In-Reply-To: <alpine.DEB.2.00.1105171321190.31927@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Denys Fedoryshchenko <denys@visp.net.lb>, netfilter@vger.kernel.org


> You can of course disable IPv6. But the functionality of IPv6 is required.
>   
Yep, you're quite right - on the build machine on which I compile and 
build everything (including ipset, of course) I have IPv6 installed (it 
is the full monty as far as netfilter apps are concerned). That 
functionality, however, is disabled on all machines on which ipset is used.
