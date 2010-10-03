From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sun, 03 Oct 2010 23:02:16 +0100
Message-ID: <4CA8FD68.9080907@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu> <4CA79133.3070608@googlemail.com> <alpine.DEB.2.00.1010032048470.26617@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=x1LKXU2C6MF3Df7ZSVWzU6QIvfB76tU9enqWN0izJB8=;
        b=e9pT1WtGZy8wXT3sCCLFIqqfR6JiK0kMvzNzhU00gbD8Pban1DE9PGnHWDSVk7Ooqx
         06fae88ub5vjR6G/bzm8YMdttgcOQOYpDhE51pJbZS2IIOnjSF4BZ3yUsxCpFPk3F7bn
         ErmbliVwt/OgaTNg6Egn1AuTPJPrbKWzFj8o0=
In-Reply-To: <alpine.DEB.2.00.1010032048470.26617@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>> This is a major headache for me for 2 reasons:
>>     
>
> Sorry, what I provide is a generic, distribution-independent package. I'm 
> aware that this can create a maintenance problem in a 
> distribution-dependent environment, but I cannot help at that.
>   
I have managed to find a solution, but it is pretty ugly! I can now 
package the compiled files (from BUILDROOT) into rpm, though what I will 
work on when I next have the time for it is to get the compilation 
process to execute in arch-independent environment. I will also 
fine-tune the rpm spec file and post it here so that whoever is 
interested in packaging xtables+ipset into rpm can use this file to 
prepare rpms instead of relying on the people from fedora who 'maintain' 
the repos to do it (I am still waiting for the 1.29 rpms to show up on 
fedora updates which is a disgrace really)!


>> I can give you of at least 2 uses based on my experience:
>>
>>     
> The present 4.x branch is in "maintenance" mode for me. I'll think on 
> adding such a type to 5.x.
>   
If I can help you out with some testing I would gladly do it.

Another feature you may add to your list is support for port ranges in a 
single set element, like "IP,port-port" for example. You already have 
similar support for multiple IP addresses (when subnets are used) - port 
ranges is another useful feature to have. One example where I can use 
this is when defining 'high-' (or unprivileged) ports - currently I 
'solve' this particular problem with enrolling a set consisting of 1024 
elements containing ports 0-1023 and then specifying a negative match 
(i.e. not privileged) on that set, which is not very convenient.

>> That's brilliant news! I take it you will be introducing protocol support for
>> all the constructs, is that right? How long would it take before you release
>> this?
>>     
>
> I'm going to release ipset 5.0 around the netfilter developer workshop 
> this month.
>   
Superb news!

