From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset v6.latest bugs?
Date: Wed, 27 Apr 2011 13:00:57 +0100
Message-ID: <4DB80579.7090208@googlemail.com>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu> <4DB61410.4070202@googlemail.com> <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu> <4DB6DEFD.6020101@googlemail.com> <4DB752D9.9010807@googlemail.com> <alpine.DEB.2.00.1104270905450.5222@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=TWRh6fZada3hoYe70JND9aYhltWwgvHcLxonQuJNAkY=;
        b=qZRMYliOkrVS68vh9cXh17xHG6TNCJxk0iD7zYSnjOhEhq2E9NoTgP333VLXoovUNf
         FRuuHUatuO2cmyDnSk1Jl1x9K9aljzi7mw2pSR/qeEvjMFjwcNsacKvC9rcWk8uRf7sf
         eofuIacR9/5CEI7DYkIksd7gw6MkbC9awEf9Y=
In-Reply-To: <alpine.DEB.2.00.1104270905450.5222@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>> 2. Take a note when I try to add 4608 elements to the test set - I did that 3
>> times with completely different results - it seems that ipset triggers an
>> error when it feels like it.
>>     
>
> The hashes are created with a random hash key calculation parameter: if 
> the hash is lucky enough, you can stuff the data into it without reaching 
> the clashing limit and without the need to resize the hash.
>   
I see, so the error is triggered at random because the randomly 
generated hash sometimes is able to "stuff the data", as you put it, 
without reaching the limit, but sometimes it doesn't and this, then, 
triggers the error, is that correct?

>> 3. Following on from the previous point, when I try to add more elements than
>> the established "error threshold" in point 2 above, I also get mixed results
>> (attempting to add 4864 elements gives me 2 successes and 2 failures after 4
>> attempts made when I re-created the test set from scratch).
>>     
>
> The same as above: if the clash limit is not reached, the hash happily 
> can accept more data. If it's reached, resizing is triggered which is 
> successfully done, but adding elements starts again with the already added 
> element. That needs to be fixed.
>   
I think I understand it now, thanks for the explanation. I hope that you 
would be able to fix this bug.

On a separate note, two days ago I was finally able to split ipset from 
xtables-addons and build it as a separate package (i.e. construct a 
.spec file, then build and install rpm based on that) while building 
only the userspace part (assuming the kernel part will stay with the 
kernel). This is by no means finished (there are some things still left 
to be ironed out - kernel modules dependency check, changelog history to 
be added etc), but I thought you may be interested in this.

If so, let me know and I'll send it to you (the important part is the 
.spec file and a separate patch which removes the build routines for the 
kernel modules).

I am in a process of doing the same with version 4.5 of ipset (I was 
able to successfully build the .35-88 version of the kernel with ipset 
4.5 kernel modules happily integrated into it yesterday), even though 
ipset 4.5 does not have pkgconfig files I intend to create these - 
hopefully today.
