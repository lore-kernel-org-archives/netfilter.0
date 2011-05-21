From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 23:57:13 +0100
Message-ID: <4DD84349.5040407@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD83964.5050105@googlemail.com> <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu> <4DD83FDE.9000901@googlemail.com> <alpine.DEB.2.00.1105220044160.24174@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=klzxOPazHBgQNAAvAiLLxWSloOXhCZSBkA3I8cKVQKA=;
        b=w2hDZvGrYIC6GID9N1orD6XLtgUnmLuK8vxF4W7Vh9gH9YkdCygOyojS7ag/DT7tTq
         3vKOuYqknNk60/BRslQLmeeBH4hZdFIl6J69YlA6mqas6oZ+Ryg23xdzLxCBZMdD5vQ3
         IIuLsb+0nPPsf6Tztx0UAcKwF5du1pU9vrQtU=
In-Reply-To: <alpine.DEB.2.00.1105220044160.24174@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

>> Fair enough, is there any reason why I can't include them as part of the 
>> kernel (i.e. static) as I used to with 4.5?
> 
> I don't really understand what you mean here, sorry.
> 
> If you want the kernel part of the ipset package compiled statically, then 
> that's not supported out of the box. Manually doable: get a kernel tree 
> where ipset already included, copy over all *.[ch] files from 
> ipset-6.x/kernel/ to the corresponding kernel subtrees and then continue 
> configuring/compiling in the kernel tree.
OK, as you know I compile ipset - userspace and kernel modules - in two separate building streams. The kernel part of ipset I compile as part of the kernel itself - via the make oldconfig, make menuconfig or by simply copying already pre-defined .config file (I obviously apply the ipset 6.5 patches as well - as you know).

With ipset 4.5 I was able to include all ipset "modules" as part of the kernel (i.e. all ipset-related options in my .config were "y" as oppose to "m").

In ipset 6.5 I cannot do that - the only choice I seem to have is "m" or not include them at all. So, I was wondering why that is, that's all?

