From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 21:11:50 +0100
Message-ID: <4DD81C86.9010805@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212154180.23473@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=o3riCJG9Mj/mGzxzmgfoZTZBStUQHJawy4PL+bOzLsA=;
        b=b4orEKzkI/JvdzDp+nyu/ztomSZRqLqCEO2eJtm/Uso3QY19ZtUTOK8gLpvXsjhL0s
         q1HrRNCaegeIq128Dm2lhkrA5DmP9XPh9q2oz6+xPQzM37Nir1FMOiUR+1sEb9RVZRmJ
         pmPnjyGLdtBfUZ+DhNuzuC6DR84UPbqHUJK48=
In-Reply-To: <alpine.DEB.2.00.1105212154180.23473@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> You still have "maxelem 15000". That means there can be at the maximum 
> 15000 element in the hash, and in another words, ipset regards the set 
> full when its elem count reaches 15000.
>   
I have no disagreements over that at all. The set in question contains 
just over 11k members, the maxelem value is 15k, so plenty to spare. My 
grief is with the (seemingly) random error messages and failures I am 
getting - just like in 6.4, plus the new added segfault error with 
libmnl as of ipset 6.5. The memory isn't an issue and neither is the 
hashsize or the maxelem values.

