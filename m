From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.11 released
Date: Sun, 15 Jan 2012 18:05:05 +0000
Message-ID: <4F131551.2090608@googlemail.com>
References: <alpine.DEB.2.00.1201141542490.26282@blackhole.kfki.hu> <4F130A03.7080208@googlemail.com> <alpine.DEB.2.00.1201151825570.29134@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=/87evKv2oMrE1Syz62WmLVh0Iq58SyYKGau8AHhDr54=;
        b=HMwI+Mc05YT8DzOR4HemniQxk5ff61dnHM3oHBxBUKb3Wn17FF0COqbo8Zh1h9AZSw
         rPGDkyG7V3cqPjpVNHapCSZyphLqJM7+sPR4YGYskAT+4hEuEZckRfzRq7vxAgWQjHBX
         ovI32XTG3EPB4CA2fRRFA1Bngm3qBSLriQ/PY=
In-Reply-To: <alpine.DEB.2.00.1201151825570.29134@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


>> Any chance of fixing this bug soon:
>>
>> ~# ipset n test hash:net family inet timeout 0
>> ~# ipset a test 10.1.0.0/16
>> ~# ipset t test 10.1.12.12
>> 10.1.12.12 is in set test.
>> ~# ipset t test 10.1.12.0/24
>> 10.1.12.0/24 is NOT in test.
>>     
>
> It's a feature which I'm not going to fix in any near future.
>   
It isn't a "feature", it is a bug: 10.1.12.0/24 is within the 
10.1.0.0/16 range, so the above test should return true, not false. 
Either that, or ip range values should be restricted/excluded from the 
"test" command in the ipset userspace binary.

