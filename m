Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB6CCDB474
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 22:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbjJQWgl (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 18:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjJQWgk (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 18:36:40 -0400
Received: from mail.mutluit.com (mail.mutluit.com [195.201.130.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F469BA
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 15:36:38 -0700 (PDT)
Received: from [127.0.0.1] (mail.mutluit.com [195.201.130.20]:39190)
        by mail.mutluit.com (mail.mutluit.com [195.201.130.20]:50025) with ESMTP ([XMail 1.27 ESMTP Server])
        id <S1723111> for <netfilter@vger.kernel.org> from <um@mutluit.com>;
        Wed, 18 Oct 2023 00:36:37 +0200
Subject: Re: [nftables/nft] nft equivalent of "ipset test"
To:     Florian Westphal <fw@strlen.de>
Cc:     netfilter@vger.kernel.org
References: <652EC034.7090501@mutluit.com>
 <20231017213507.GD5770@breakpoint.cc> <652F02EC.2050807@mutluit.com>
 <20231017220539.GE5770@breakpoint.cc>
From:   "U.Mutlu" <um@mutluit.com>
Organization: mutluit.com
Message-ID: <652F0C75.8010006@mutluit.com>
Date:   Wed, 18 Oct 2023 00:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101
 Firefox/40.0 SeaMonkey/2.37a1
MIME-Version: 1.0
In-Reply-To: <20231017220539.GE5770@breakpoint.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Florian Westphal wrote on 10/18/23 00:05:
> U.Mutlu <um@mutluit.com> wrote:
>> Florian Westphal wrote on 10/17/23 23:35:
>>> U.Mutlu <um@mutluit.com> wrote:
>>>> The "ipset" commandline tool has the "test" command
>>>> for testing whether a given item (ie. an IP) is in a given set.
>>>> Is there an equivalent for the "nft" commandline tool of nftables?
>>>> I unfortunately couldn't find the answer in the manpage of nft.
>>>
>>> nft "get element inet tablename setname { 1.2.3.4 }"
>>
>> But isn't that printing the whole item on stdout?
>> I just need to quickly test it only,
>> ie. need just a return code of 0 or 1, or so,
>> for use in a shell script (bash).
>
> ?
>
> nft "get element inet t s { 1.2.3.4 }" > /dev/null 2>&1; echo $?
> 1
> nft "add element inet t s { 1.2.3.4 }"
> nft "get element inet t s { 1.2.3.4 }" > /dev/null 2>&1; echo $?
> 0

Actualy I need to do this monster:   :-)

IP="1.2.3.4"
! nft "get element inet mytable myset  { $IP }" > /dev/null 2>&1 && \
! nft "get element inet mytable myset2 { $IP }" > /dev/null 2>&1 && \
   nft "add element inet mytable myset  { $IP }"

Ie. add it to the set myset only if it's not already present in any of myset 
and myset2.

A true "test" command w/o any output, much like in "ipset test", would be a 
better method, IMO.

I've not switched yet to nftables, just (dry-) evaluating it.


