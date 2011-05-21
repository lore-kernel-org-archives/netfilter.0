From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sat, 21 May 2011 22:41:09 +0100
Message-ID: <4DD83174.6070105@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD8158D.4040306@googlemail.com> <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=dURtk2cGVwAMA/lfq9mekJp7t46Cmyxv6ZkxEGG2ikc=;
        b=Bg8QUySwksGbTBlpjSU71p62iCuUrlN3WOfDygqhvIbZdRm/OQayEtFvbzVg6dkivH
         N7XvmP6zhLDZZc5x2ElNPl5tFmwF1mdEzoVvVfrJVPlXwAywWl+5I8V3eeP1sRcyPGly
         abmttxaMpr2w+x7zvx374PuQ7Ket8L7rWznuY=
In-Reply-To: <alpine.DEB.2.00.1105212323230.23769@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> You used the timeout variant of the hash type, and a mistypeing slipped 
> into the patch titled "Fix adding ranges to hash types", which made the 
> patch ineffective for the timeout variants :-(.
I am not sure what you mean by the above!

>  Please try the patch 
> below: apply to the source tree of the ipset package, recompile the kernel 
> modules, install them, remove from the running kernel and try again.
>   
I'll do it in the coming days as I ran out of time and already reverted 
to ipset 4.5 as I don't have any more time to play with this.

>> libmnl is 1.0.1. I have then tried to play a bit with the hashsize value, but
>> gave up when I reached 16777216! ipset though was still insisting that the
>> hash size is "full":
>>
>> maxelem 15000 hashsize 4194304
>>     
>
> As I wrote previously, that is because you reached the limit of the 
> maximal elements in the hash. Increase maxelem, it's a fixed parameter of 
> the hash. The hashsize parameter is an initial value and auto-tuned 
> (incremented) as required.
>   
Jozsef, the set I was referring to has just over 11 thousand members, 
where the maxelem value for that set was set at 15 thousand - I thought 
I have made that pretty clear, but I obviously haven't!

Look at the files I sent you and let me know in which set I have 
specified maxelem value which is less than the number of members I am 
trying to add? My guess is, there are none!
