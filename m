From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset v6.latest bugs?
Date: Wed, 27 Apr 2011 00:18:49 +0100
Message-ID: <4DB752D9.9010807@googlemail.com>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu> <4DB61410.4070202@googlemail.com> <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu> <4DB6DEFD.6020101@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=fYjisYk5gXzTsBv7PWhfzSqFRdaKpCzSqmzR1sxNcf4=;
        b=GSSS4UYnFJaVrJdlFfNpkKtRrXHvB7NVju4hlt/hwnr9kUY2UnK8LugKIUvCs1HH7u
         XeMtSocGSBbppCFMakAuMYJAcnLFS5zrcNFq4YnTQb6ESkuatawpcgM9EQd2CM+y5fHE
         gaPGC/duDPwQXdVb7uaSezMSEBnkw6nhxpNfo=
In-Reply-To: <4DB6DEFD.6020101@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>> Due to the restarting bug (add the first element again) and failing 
>> as it is already added, the resizing happened once.
> OK, I'll wait for this to be fixed then.
I ran into more problems, unfortunately!

This is what I executed after managing to use the same ipset revisions 
in both the kernel and userspace:

[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -L test
Name: test
Type: hash:net,port
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 16760
References: 0
Members:

[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4096
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -terse -L test
Name: test
Type: hash:net,port
Header: family inet hashsize 2048 maxelem 65536
Size in memory: 91448
References: 0

[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-6144
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -terse -L test
Name: test
Type: hash:net,port
Header: family inet hashsize 2048 maxelem 65536
Size in memory: 33144
References: 0
[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-5120
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4608
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4096
[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4352
[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4224
[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4480
[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4544
[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4607

[root@test1 ~]# ipset -F test
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4608

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4608

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4864

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-5120
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-5120
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4864

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-5119
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-5056
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4865
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4864
ipset v6.4: Element cannot be added to the set: it's already added

[root@test1 ~]# ipset -X test
[root@test1 ~]# ipset -N test hash:net,port
[root@test1 ~]# ipset -A test 10.4.0.0/14,1-4864
ipset v6.4: Element cannot be added to the set: it's already added


As evident from the above, there seem to be some, quite frankly, bizarre 
results:

1. Even though the maxelem value is 64k I seems to be restricted to add 
the amount of elements in the set which do not require the hash value to 
more than double (that may be related to the previous bug with hash:ip 
set though).

2. Take a note when I try to add 4608 elements to the test set - I did 
that 3 times with completely different results - it seems that ipset 
triggers an error when it feels like it.

3. Following on from the previous point, when I try to add more elements 
than the established "error threshold" in point 2 above, I also get 
mixed results (attempting to add 4864 elements gives me 2 successes and 
2 failures after 4 attempts made when I re-created the test set from 
scratch).

I am a bit baffled to say the least why on one occasion I am successful 
in adding more elements while previous attempts with less elements have 
triggered an error (adding 4864 elements successfully - twice, compared 
to 4608 unsuccessfully) - there is absolutely no logic in this!

There seems to be a serious issue or am I missing a trick here?

