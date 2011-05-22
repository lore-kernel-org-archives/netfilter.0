From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 02:01:53 +0100
Message-ID: <4DD86081.1020703@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu> <alpine.LNX.2.01.1105212331570.16146@frira.zrqbmnf.qr> <4DD83187.2060301@googlemail.com> <alpine.LNX.2.01.1105212349310.18080@frira.zrqbmnf.qr> <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Ws/RFt7lDSCrQJFVkLi8h0Sf1FC6SSpnz51C4M7RYV8=;
        b=Uvfid78rLAcOAXjNO1IRFJ1h/bZ5Lzsou67TU/spfNgd90+1btrqkDdKX/0/UY6iH2
         AVyjuZMB5zITijiR/lJZpVdRPr+ghQQo9u8j7tRiw9g8AYqrZUzWO+xYmaUrpSo5c7Uc
         LsSnbOml3rXB+1Y/m1im+n2vQSJiEf96DXOBY=
In-Reply-To: <alpine.DEB.2.00.1105220055320.24174@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org


> The uninitialized bytes are OK and there is no memory leak or corruption.
>   
I am able to now reproduce the error, having applied your patch Jozsef, 
rebuilt the kernel, updated the whole image on that machine and 
rebooted. This is what happens:

All sets are now loaded, *except* the last file where I get the 
segmentation fault error I described earlier, i.e, something like this:

May 22 01:25:20 dmz1 kernel: [ 1361.321376] ipset[2819]: segfault at 0 
ip 00e26655 sp bfdad710 error 4 in libmnl.so.0.0.1[e24000+4000]
May 22 01:26:39 dmz1 kernel: [ 1440.120529] ipset[2841]: segfault at 0 
ip 002d7655 sp bfbe7b10 error 4 in libmnl.so.0.0.1[2d5000+4000]

I started to narrow this down and the first culprit seems to be the 
following 2 statements:

n priviledged-ports bitmap:port range 1-1023 timeout 0
a priviledged-ports 1-1023

When I removed the above 2 statements I am then getting this:

ipset v6.5: Error in line 4: Internal protocol error

No segmentation fault! I narrowed the latest error down to the following 
2 statements:

n test-net bitmap:ip range 10.1.1.172/29 timeout 0
a test-net 10.1.1.172/29

I then removed those as well. Tried again - segmentation fault error. I 
then removed the following 3 statements, which were next in line:

n test-ports bitmap:port range 12770-19999 timeout 0
a test-ports 12770-12784
a test-ports 19999

Next, another segmentation fault error, it turns out the culprit this 
time was 2 statements which were further down the line from this file:

n test-port bitmap:port range 29950-29950 timeout 0
a test-port 29950

Removed these and guess what - segmentation fault error again, at which 
point I bloody gave up! ipset 4.5 it is!
