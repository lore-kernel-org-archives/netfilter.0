From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset kernel oops
Date: Mon, 25 Apr 2011 20:19:25 +0100
Message-ID: <4DB5C93D.9090502@googlemail.com>
References: <4DB1F58B.9080500@googlemail.com> <alpine.DEB.2.00.1104232026240.23429@blackhole.kfki.hu> <4DB3FE63.1030305@googlemail.com> <alpine.DEB.2.00.1104251929001.30748@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=viY39JKQMjm+Q7BTTb9lCDVKMD5RQh07fVsFxUG9Hu8=;
        b=cdi99Iiwpn5dwMTBmXugbyzxi4Or+PI5na7wsoYxMt9HqBaZA6mceBOK55PJbnyVfP
         4aXl+NXy1zbBOOIIzHyUW3KP43b6PavDwG+IhDdU4vKOirMfe4H8vpGvbU/zsDxxFFpW
         Iuyd5qWAiyDV5VlMmIYYay/Od4ne7Wzn1RHI8=
In-Reply-To: <alpine.DEB.2.00.1104251929001.30748@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


> That 30k addresses alone need roughly 30MB non-swappable memory, ~10% of 
> all of the physical RAM. Depending on what else's running on that machine, 
> the required memory can be significant.
>   
The system, when it boots, has more than 150MiB of RAM available (that 
excludes about 80MiB of "cached" memory), so RAM is clearly not an issue 
I don't think. I forgot to mention that I executed the whole sequence 
(which triggered the bug) as soon as I booted up, so no other 
applications were loaded (yet).

> I have never tested iptree(map) with so many elements, so it's surprising 
> for me that it takes so many time.
It is the single most frustrating issue I've always had with ipset - I 
am more than pleased with everything else, apart from the initial 
loading, which, as I already pointed out even on a fast machine with 
lots of RAM (Core2 with 4GiB RAM) takes about 20 or so seconds for these 
ipsets to load. That goes to about 5 minutes on less-powerful, but 
equally well-equipped P4 (3.3MHz) with 1GiB RAM.

>  But if the 30k addresses are quite 
> different then the iptreemap has to build up a four-level tree with 30k 
> branches from the second level down.
>   
So, do you have an idea what is causing this bug and how could it be 
avoided/fixed?

I have tried the new version of ipset, but didn't have luck with it 
either - see my other post on this list with regards to that particular 
set of problems.

