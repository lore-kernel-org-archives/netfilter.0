From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Tue, 17 May 2011 19:36:08 +0100
Message-ID: <4DD2C018.9060800@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD255EF.1040209@googlemail.com> <alpine.DEB.2.00.1105171346350.31927@blackhole.kfki.hu> <4DD292FC.2020609@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=p0sA3b5h3JFnmXkwIG93jOwItlEvf28/AOfG86RDelc=;
        b=IlwRkLN4/kE6fPHadcSIY+UWfpFrmt78rnFkvy/0TnH/B0UU/XK4WwdvFoUtyFmKRK
         XPkb9eP3HSEdpU1Sh4UTCokwLHDp8SxsbdYERlPZoKkfoAJA+i4V4hEeXd4TV2VPFDsL
         MhdLSm/oG7EOFQbEqxtFYkE26/adUpF5CqFWQ=
In-Reply-To: <4DD292FC.2020609@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> Will attach these together with the above. I was quite pleased with it 
> as it enabled me to streamline the whole process (ipset 4.5 wasn't the 
> only thing I was building), so you may find this quite useful if you 
> decide to update v4.5.
Here is the test case, I'll attach the rest privately to avoid the wrath 
of the mail list daemon.

[root@test1 ~]# ipset -N slow_mirrors iptreemap --gc 300
[root@test1 ~]# ipset -L slow_mirrors
Name: slow_mirrors
Type: hash:ip
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 16512
References: 0
Members:
[root@test1 ~]# ipset -A slow_mirrors 212.219.56.128/26
[root@test1 ~]# ipset -A slow_mirrors 130.59.0.0/16
ipset v6.5: Hash is full, cannot add more elements
[root@xp1 ~]# ipset -L -terse slow_mirrors
Name: slow_mirrors
Type: hash:ip
Header: family inet hashsize 32768 maxelem 65536
Size in memory: 1006032
References: 0

The way I look at it, the "old" iptree(map) type sets should be 
converted to hash:net, not hash:ip to avoid this error.
