From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset v6.latest bugs?
Date: Tue, 26 Apr 2011 16:04:29 +0100
Message-ID: <4DB6DEFD.6020101@googlemail.com>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu> <4DB61410.4070202@googlemail.com> <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=S5Y++ZEfP5Q/jVRmGJ91pLpu/4klFL2LX5aD08zIkUc=;
        b=p2Y7Q5SHxXFSKgOrjyhSdlZrxOYq36yipoeyC48kGIQ5sIsZfBNHSqpQnXnNOgQO6e
         UJCWo6CPiBqfifXCxax8EeAs6rYHNPaM9DMJy51/2vt5rJFdhvfGfI1GTvA4y1SmTTyx
         L55lEM4FNzXxyZ2ckscfIBTeYhO8eZllIIyLA=
In-Reply-To: <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> Due to the restarting bug (add the first element again) and failing as it 
> is already added, the resizing happened once.
OK, I'll wait for this to be fixed then.

> As I wrote, for a few weeks I won't have time to deal with adding new 
> features.
>   
No worries, I was just not sure why was this dropped as port ranges used 
to be part of other sets implemented in this version, not to mention 
that these features existed across the board in earlier ipset versions too.

In the meantime I may be sticking with 4.5 until this is implemented as 
I have boxes which I cannot upgrade to the new version of ipset due to 
constrains with the kernel, so I do not have the appetite, nor desire, 
to spend long hours altering my entire build just because the hash:net 
set in the new ipset version can't handle ip ranges - it would be a 
nightmare to maintain two different build paths simply because of that 
single issue. I suspect that was the reason why iptree(map) sets got 
"converted" to hash:ip instead of hash:net.

>> ipset -L on a iptreemap type set tells different - it contains a single
>> element - 10.1.0.0/16 - and that's it! It is even better because I could use
>> both forms - cidr and ranges alike - and it shows me the ip address ranges
>> when I list the actual set. In that respect iptreemap's implementation is much
>> better than what currently exists with hash:net set in 6.4!
>>     
>
> iptreemap is clever enough to collapse the successive elements into ranges 
> in the output. But internally all network, range added to an iptreemap 
> type is expanded into the individual IP addresses.
>   
Maybe that would explain the massive amount of time it takes to load all 
these address ranges and hog my entire system in the process?

