From: Alex Flex <aflexzor@gmail.com>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 19:29:53 -0600
Message-ID: <5185B611.3080008@gmail.com>
References: <5185444B.3090602@gmail.com> <9a3b8ec43ac420e45247dd70d2a597e1.squirrel@sqrl.metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=eFBCYdksXKAb6NzlyMla0aXjmAst+0tgsD/6MkQ67Sw=;
        b=hQIJpqcmFr3yDgpTSasFv4WgY+KeYn+9wOOF5g5VYIyRdhuI+GzaPxf3qyHzrYFyZ8
         gGS2I0FoTd/X8Kx4N/Gm+r8t6ow5xlY2LIH2Dgw5ewHMaPu86REjLLCLVbbm+HumQPAp
         kBZxAiYydVTNeATmI1kncD2UPlQ7sP2umbORb+GRQRgu4GEjrnCGaN4uKuQEBmDsdxoB
         3cbwoi1kcfSBV710YrM8Mf61iyIpCUJ5nSollSjU+/hgqfMeZbgVfaRj9t1KLIljIMEG
         tw2d0syXaIRTcUmQ0EOuL5nlK+bjwq2IQaDze242/N/Dbcs86FWWNKdQrmjq/GtxEmFL
         zhaQ==
In-Reply-To: <9a3b8ec43ac420e45247dd70d2a597e1.squirrel@sqrl.metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hdemir,

I think that after thr attacks are over, iam going "back to the drawing 
board" ...

Can you please confirm if you are able to load test your server with 
hping3 for a syn flood? For some reason i have not been able to get more 
then 8k pps so far with the flood option.

Iam currently looking for ways to load test different scenarios as per 
Stevens advice.

Thanks
Alex

