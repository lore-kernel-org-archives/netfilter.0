From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Tue, 17 May 2011 12:03:11 +0100
Message-ID: <4DD255EF.1040209@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=VPKGrWlPRMEpjlvHLF7Qr98Z7PyEvlABOxLdXiW5XE8=;
        b=WNkUuzkVmrsjXVD/HlXE5FiqFV6YkDp0ddAV6oFh7gDFqfVcxVo2fWwhfSbBqwERfU
         Vll1zUw8YKw0wK4sDn2+UHpbhziplNSUcAE9jKLp37czPDCM545W7SqI1itGco++w+kK
         aSmKTLhcBKdA9qMRqkf6hKc8F7lM7FWzPS538=
In-Reply-To: <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>> That's great news! Should I assume that the (more-than-double) hash bug I
>> reported a while ago has also been fixed?
>>     
>
> Yes, it was fixed, the last one ("Fix adding ranges to hash types") covers 
> that.
>   
Thank you Jozsef.

I have quickly tried the new version last night on a freshly compiled 
kernel (with ipset kernel modules included into the kernel - not as 
modules though) - the loading performance of "bulk" ranges is much, much 
better now, though I've got an error when trying to load a set which 
consisted of just 3 different subnet ranges (that set was using the 
"old" treemap syntax). When I have some more time - probably later this 
evening - I will post details of that error (I think it was to do with 
hashes again).

Also, I don't know whether you will be interested in this, but when I 
modified ipset 4.5 in order to split the kernel modules from the 
userspace tool and include these in two separate building streams for my 
systems, I managed to change ipset 4.5 to enable the use of 
autogen/automake tools and then the execution of "./configure" as part 
of building that package. As part of that process I introduced 2 extra 
"parameters" to it - "--hash-size" and "--max-elements". I could send 
you this patch to "refresh" the ipset 4.5 version or just have a look at 
it, if you so desire - just let me know. ipset 4.5 has served me very 
well since I started using it and was a vital contributor to the 
improved stability and performance on all my systems.
