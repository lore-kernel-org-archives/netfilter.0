From: Fernando Fernandez Mancera <ffmancera@riseup.net>
Subject: Re: Intermix ip,ip6 saddr
Date: Thu, 26 Sep 2019 14:53:52 +0200
Message-ID: <9ca5e3a5-d7eb-ba51-030d-7606d4ae93d7@riseup.net>
References: <20190925115451.ozhdsoykkkmdxnch@nisshoku>
 <CALOK-Oe8=+M-d8beCZyn6=Zkxq_d0P=faO5AoAV3P5KY=bCRow@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
        by mx1.riseup.net (Postfix) with ESMTPS id 46fFGs3MLzzFZkn;
        Thu, 26 Sep 2019 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1569502421; bh=UUupvXs0VXKQq2BqBH/emgUBH3cYoujTbhLbGkmwWZ0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qKBozt/T7XRQfa4UKmritXM5FnlT8kUpY9TMg5CuRMPMcj+5cvGXUFteB+7456/cj
         MTXCM1vm+DKUmdTyKec0FXhKCCjAVC50iN6VCHnorVXAMi0MuvR2xMT3NS8od5LVzy
         IUjMJH9qjh4K1VGrXPZddLSgmykbQ9KZXoxkNkmw=
In-Reply-To: <CALOK-Oe8=+M-d8beCZyn6=Zkxq_d0P=faO5AoAV3P5KY=bCRow@mail.gmail.com>
Content-Language: en-US-large
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fran Fitzpatrick <francis.x.fitzpatrick@gmail.com>, Anton Rieger <rieger@jikken.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

Hi,

On 9/26/19 1:52 PM, Fran Fitzpatrick wrote:
> I don't think this is possible with nftables. When you create a
> set/map, you need to give each element a type, so either `ipv4_addr`
> or `ipv6_addr`.
> 
> If you do find out a way, please let me know, because I would also
> like to do it. :-)
> 
> On Thu, Sep 26, 2019 at 4:31 AM Anton Rieger <rieger@jikken.de> wrote:
>>
>> Hi there,
>>
>> I'm trying to figure out the best way to apply a rule on a set of IP and IPv4 ranges.
>> My current workaround is to do the following:
>>
>> RULE jump customnet
>>
>> chain customnet {
>>   ip saddr {192.0.2.0/24, 198.51.100.0/24} drop
>>   ip6 saddr {2001:DB8:4::/48, 2001:DB8:7::/48} drop
>> }
>>
>>
>> I think it might be possible to do this somehow with maps and meta nfproto expressions.
>>
>> BTW:
>> It would be nice to have an ip4 alias to better match ip6/ip rules.
>> Also resetting the default address family might be useful.
>> For example I'm using more ip6 and inet than ip.
>>
>> Thank you,
>> Anton

Maybe it would be useful to implement a new inet_addr type that involves
ipv4 and ipv6 addresses. Pablo, do you think it would be feasible?

Thanks! :-)
