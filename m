From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 08 Jun 2011 11:07:58 +0100
Message-ID: <4DEF49FE.4080708@googlemail.com>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu> <4DEECD8C.6050302@googlemail.com> <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=saDw+hCvaDLe2kJ27WrAbKFVDzuUBHXCYKQdNYBXAyU=;
        b=aUtnFjaSGIOVpO4zACxjSPTB5Tl+X+QpvtKP4sw+pPWcMOBY7c0S7O8rzCxNFOL1UL
         0Ze/Kl89lHJ6TQll11w+Q34UsBjrfeOa/BHzmRKCjWYXf9t9MdDRdQJDURwCTaA4Zpk/
         oilMvejo299yRIXYbUXi6ke8Nzw8uajzydSio=
In-Reply-To: <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>> [root@test1 ~]# ipset n test hash:net family inet timeout 0
>> [root@test1 ~]# ipset a test 10.16.0.0-10.16.255.255
>> [root@test1 ~]# ipset l test
>> Name: test
>> Type: hash:net
>> Header: family inet hashsize 1024 maxelem 65536 timeout 0 
>> Size in memory: 16832
>> References: 0
>> Members:
>> 10.16.0.0/16 timeout 0
>> [root@test1 ~]# ipset t test 10.16.224.0/24
>> 10.16.224.0/24 is NOT in set test.
>> [root@test1 ~]# ipset t test 10.16.224.1   
>> 10.16.224.1 is in set test.
>>
>> That is plainly wrong!
>>     
>
> No, that's a feature: it makes possible to check from userspace how the 
> kernel would match an IP address in the set.
You can't be serious! How could this be a "feature"?! It is a bug, clearly!

The /24 subnet (10.16.224.0-10.16.224.255) clearly covers the single IP 
address (10.16.224.1) and the test should be positive in both cases, as 
the /16 member of the set (10.16.0.0-10.16.255.255) covers both the 
single IP address as well as the /24subnet range tested. Apparently, 
that seems not to be the case. How am I suppose to test subnet ranges then?

I presume if I have 10.16.224.0/24 as a member and do a test with 
10.16.0.0/16 that would also return a negative match, isn't that the case?

>  Maybe it's badly worded in 
> the manpage: "When testing entries, if a host address is tested, then the 
> kernel tries to match the host address in the networks added to the set 
> and reports the result accordingly."
>   
That's all well and good for hosts, but ip ranges should either be 
tested properly or testing of those should be disabled altogether 
(which, if introduced, would be a severe restriction for me - I am not 
going to run a couple of thousand "ipset t" tests just to see that all 
of the single IP addresses in the range I am interested in match - that 
simply isn't going to happen!).

