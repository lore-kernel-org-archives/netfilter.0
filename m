From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset-4.4 on 2.6.16.60 kernel
Date: Sat, 06 Nov 2010 22:58:34 +0000
Message-ID: <4CD5DD9A.8000608@googlemail.com>
References: <alpine.DEB.2.00.1010012214250.19669@blackhole.kfki.hu> <4CD5B85A.4050007@googlemail.com> <alpine.DEB.2.00.1011062230030.31105@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=kz3qF7JD+o87cVaq2jIyvJ06g1tgJhXUqtbLMGmx7hc=;
        b=E6vQ9aV1G/6sDR018YCUdcNPsASLTb66LAp4QIEiOwgGUUW0gEvtjFfLTIdXeCAG6Y
         sFDjUANc9XskMwJQfi7I4bwDevCqLBVcIs1c//dr07Cd0FDZZoaV/s9Sj+qD+CzivQxn
         y5WZXeRw46PxKrwRinEYRPmPiK3DS1RpZ7pzo=
In-Reply-To: <alpine.DEB.2.00.1011062230030.31105@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


>> =================
>>  CC [M]  /root/ipset-4.4/kernel/ipt_set.o
>> /root/ipset-4.4/kernel/ipt_set.c: In function `ipt_ipset_init':
>> /root/ipset-4.4/kernel/ipt_set.c:244: warning: implicit declaration of
>> function `ipt_register_match'
>> /root/ipset-4.4/kernel/ipt_set.c: In function `ipt_ipset_fini':
>> /root/ipset-4.4/kernel/ipt_set.c:249: warning: implicit declaration of
>> function `ipt_unregister_match'
>> ================
>>     
>
> No, you cannot solve the compatibility that way. Please write back the 
> kernel version check to KERNEL_VERSION(2,6,16) and manually modify all 
> xt_register_match|target, xt_unregister_match|target calls in ipt_set.c 
> and ipt_SET.c speficying two arguments, the first one filled out as 
> AF_INET, eg:
>
> static int __init ipt_ipset_init(void)
> {
>        return xt_register_match(AF_INET, &set_match);
> }
>   
That is exactly what I did, and it compiled without error. After that I 
did KERNEL_DIR=... make install and installed the whole thing.

HOWEVER, it still does not work!

After reboot, when I try 'ipset --version' it tells me it does not know 
the kernel version, so I looked at /lib/modules/2.6.16.60/ and saw that 
in a directory called 'extra' there were all the ipset modules sitting. 
So what I did is modprobe all .ko files to load them into the memory. 
lsmod confirmed it that they are loaded without errors.

So, hopeful that I finally cracked it I executed 'iptables -I blacklist 
1 -m set --match-set test dst -j DROP' (I created the treemap called 
'test' prior to that) and got this message:

iptables v1.3.7: Unknown arg `--match-set'
Try `iptables -h' or 'iptables --help' for more information.

Looked in /usr/lib/iptables/ and there are two additional files 
libipt_set.so and libipt_SET.so, which were installed by the newly 
compiled version of iptables so don't know why it does not work!

