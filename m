Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0742CDB465
	for <netfilter@archiver.kernel.org>; Sat, 14 Oct 2023 10:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbjJNKhK (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sat, 14 Oct 2023 06:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjJNKhJ (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sat, 14 Oct 2023 06:37:09 -0400
Received: from mail.mutluit.com (mail.mutluit.com [195.201.130.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 474F3B3
        for <netfilter@vger.kernel.org>; Sat, 14 Oct 2023 03:37:07 -0700 (PDT)
Received: from [127.0.0.1] (mail.mutluit.com [195.201.130.20]:39540)
        by mail.mutluit.com (mail.mutluit.com [195.201.130.20]:50025) with ESMTP ([XMail 1.27 ESMTP Server])
        id <S1723036> for <netfilter@vger.kernel.org> from <um@mutluit.com>;
        Sat, 14 Oct 2023 12:37:06 +0200
Subject: Re: [libipset] How to read packet counter of a single item?
To:     netfilter@vger.kernel.org
Cc:     Jozsef Kadlecsik <kadlec@netfilter.org>
References: <65289DC7.9090603@mutluit.com>
 <64f2f344-e83a-cbbe-b8e8-a81dfacbca98@netfilter.org>
From:   "U.Mutlu" <um@mutluit.com>
Organization: mutluit.com
Message-ID: <652A6F4C.2040200@mutluit.com>
Date:   Sat, 14 Oct 2023 12:37:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101
 Firefox/40.0 SeaMonkey/2.37a1
MIME-Version: 1.0
In-Reply-To: <64f2f344-e83a-cbbe-b8e8-a81dfacbca98@netfilter.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote on 10/13/23 21:05:
> On Fri, 13 Oct 2023, U.Mutlu wrote:
>
>> 1) Which libipset function can be used for getting
>> the packet counter value of a single entry in the set/list?
>>
>> Using the function ipset_parse_line(ips, line) I can issue most of the
>> ipset functions, but I need also a method for getting the packet counter
>> for just a single item only, ie. not the output of all items as "ipset
>> save" does. I need to do this in C/C++ (hence libipset in Linux), ie.
>> not in script.
>
> There is no such functionality in ipset. You can test the existence of an
> element in a set or list/save all of them with all of the attached
> attributes.

I guess you mean just the ipset command line tool, whereas I explicitly stated 
libipset.

After researching it further I think it should be possible to read
the counter of a single item via libipset & co.,
or at least testing the item for having a counter value "gt" etc,
as is already possible in the iptables extensions, ie.
"-m set --packets-gt value" etc.

>> 2) man ipset says
>> "test SETNAME TEST-ENTRY [ TEST-OPTIONS ]
>>     Test whether an entry is in a set or not. Exit status number is zero if the
>> tested entry is in the set and nonzero if it is missing from the set."
>>
>> But the TEST-OPTIONS are not further described or documented.
>> What test options are possible?
>
> There's a single one in the case of list:set: to test the element before
> or after a reference one.

Can you give a practical example for this?


