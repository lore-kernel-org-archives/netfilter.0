From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset-5.0 released
Date: Thu, 23 Dec 2010 23:03:47 +0000
Message-ID: <4D13D553.8050907@googlemail.com>
References: <alpine.DEB.2.00.1012172259100.10231@blackhole.kfki.hu> <4D0CC3BB.8030801@googlemail.com> <alpine.DEB.2.00.1012182050280.11577@blackhole.kfki.hu> <4D0D2CF4.5070201@googlemail.com> <alpine.DEB.2.00.1012190105460.11753@blackhole.kfki.hu> <4D0E0E2A.3090604@googlemail.com> <4D0E22A5.8090808@conversis.de> <4D0E3B34.7090105@googlemail.com> <alpine.DEB.2.00.1012221146060.3482@blackhole.kfki.hu> <4D11F384.3070908@googlemail.com> <alpine.DEB.2.00.1012231558390.6044@blackhole.kfki.hu> <4D138C02.3050905@googlemail.com> <alpine.DEB.2.00.1012232008520.6582@blackhole.kfki.hu> <4D13CBD8.3090007@googlemail.com> <alpine.DEB.2.00.1012232337070.7027@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=jaronxpCORfmLAmtZ73OElzPwCaUmJGV02//2gl+dIc=;
        b=ZZrE2F2aEnEV1oK4q4lwMKfe8TWUJptqMVKlROgEWbReE9w83fKx31EtsEI6pRC6mA
         iWNK06U+Xalr35kC69DEuHYs4pMtnz16PwY/cQ2iUY7hPj41KJSDAQgHPGiwpGTVy8QN
         b6kakZhi0QS8sZoxCW6JGLYZDn6PEjlvTY6PI=
In-Reply-To: <alpine.DEB.2.00.1012232337070.7027@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Dennis Jacobfeuerborn <dennisml@conversis.de>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org


>>> The implementation behind ipset looks up the  (ipaddr, proto, port) triple
>>> in one step. Such packing don't work there.
>>>   
>>>       
>> If that's the case how do you lookup IP address and port ranges then?
>>     
>
> IP address and port ranges are exploded and the elements are inserted 
> one-by-one. And the exploded ranges are *not* converted back to ranges 
> when listing/saving the sets. At the bitmap types the ranges could be 
> converted back (not done yet), at the hash types it's not possible.
>   
If I understand you correctly, if I define hash:net,proto,port ipset and 
add a single element to it - 10.1.1.0/30,udp,80-83 - that translates (in 
primitive terms) to:

10.1.1.0,udp,80
10.1.1.0,udp,81
...
10.1.1.0,udp,83
10.1.1.1,udp,80
...
10.1.1.1,udp,83
...
...
10.1.1.3,udp,83

In other words, the set actually consist of 4 (subnet size) * 1 
(protocol) * 4 (port ranges) =16 'internal' elements, is that right?

One other question - if I insert the above element in the set what is 
shown when I execute ipset -L: "10.1.1.0-10.1.1.3,udp,80-83" or the 
various permutations I listed above?
