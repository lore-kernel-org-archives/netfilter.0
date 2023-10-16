Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CF8CDB465
	for <netfilter@archiver.kernel.org>; Mon, 16 Oct 2023 23:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbjJPXbA (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 16 Oct 2023 19:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJPXa7 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 16 Oct 2023 19:30:59 -0400
Received: from mail.mutluit.com (mail.mutluit.com [195.201.130.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19C7A9F
        for <netfilter@vger.kernel.org>; Mon, 16 Oct 2023 16:30:56 -0700 (PDT)
Received: from [127.0.0.1] (mail.mutluit.com [195.201.130.20]:46184)
        by mail.mutluit.com (mail.mutluit.com [195.201.130.20]:50025) with ESMTP ([XMail 1.27 ESMTP Server])
        id <S17230A6> for <netfilter@vger.kernel.org> from <um@mutluit.com>;
        Tue, 17 Oct 2023 01:30:55 +0200
Subject: Re: [iptables/ipset] Bug? -m set --match-set myset src --packets-gt 2
 -j ...
To:     Jozsef Kadlecsik <kadlec@netfilter.org>
Cc:     netfilter@vger.kernel.org
References: <652D8D7C.4080803@mutluit.com>
 <c256ace-de63-e18-3386-132ee8a8d6c3@netfilter.org>
From:   "U.Mutlu" <um@mutluit.com>
Organization: mutluit.com
Message-ID: <652DC7AF.1090406@mutluit.com>
Date:   Tue, 17 Oct 2023 01:30:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101
 Firefox/40.0 SeaMonkey/2.37a1
MIME-Version: 1.0
In-Reply-To: <c256ace-de63-e18-3386-132ee8a8d6c3@netfilter.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Jozsef, thanks. I modified it slightly, but it still doesn't work.
Can you please inspect why this is not calling the MY_MISC chain?
The adding via the MY_ADD chain works fine, but the subsequent MY_MISC isn't 
get called.

firewall.sh :
-------------
#...
ipset destroy blacklist
ipset create blacklist hash:ip hashsize 4096 timeout 300 counters

iptables -N MY_ADD
iptables -A MY_ADD -j SET --exist --add-set blacklist src
iptables -A MY_ADD -j RETURN

iptables -N MY_MISC
#...
iptables -A MY_MISC -j RETURN

#...
iptables -A INPUT -m set ! --match-set blacklist src -j MY_ADD
iptables -A INPUT -m set   --match-set blacklist src --packets-gt 2 -j MY_MISC
#...



Jozsef Kadlecsik wrote on 10/16/23 21:54:
> On Mon, 16 Oct 2023, U.Mutlu wrote:
>
>> could a kind soul please check why the ipset "match-set" rule below isn't
>> working.
>>
>> It jumps to the chain MY2 only if "--packets-gt 0" or
>> "--packets-gt 1" is used, but not for any higher values! :-)
>>
>> I'm new to ipset, but this very much looks like a bug in iptables or ipset,
>> IMHO.
>>
>>
>> firewall.sh :
>> -------------
>> #...
>> ipset destroy blacklist
>> ipset create blacklist hash:ip hashsize 4096 timeout 300 counters
>> #...
>> iptables -N MY2
>> #...
>> iptables -A MY2 -j RETURN
>> #...
>> iptables -A INPUT -j SET --exist --add-set blacklist src
>> iptables -A INPUT -m set --match-set blacklist src --packets-gt 2 -j MY2
>
> Reverse the order of the rules above. With the first one you continuously
> (re)add the elements to the set with packet number 1.

