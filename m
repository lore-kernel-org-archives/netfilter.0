Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D505DC4332F
	for <netfilter@archiver.kernel.org>; Wed,  8 Nov 2023 09:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbjKHJrm (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 8 Nov 2023 04:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHJrl (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 8 Nov 2023 04:47:41 -0500
Received: from tootai.net (mail1.tootai.net [IPv6:2a01:4f8:a0:821b::58:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950BA199
        for <netfilter@vger.kernel.org>; Wed,  8 Nov 2023 01:47:39 -0800 (PST)
Received: from tootai.net (localhost [127.0.0.1])
        by mail1.tootai.net (Postfix) with ESMTP id 2BB75608142E;
        Wed,  8 Nov 2023 10:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1699436857; bh=l47gApTNmr5JnU+hkAgirbXAw/eZh7n53ZodgfX1Gdw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MhfLgwoqhKacEg9FAsYIWZmMl1BMcgMUR4Mc9klVBr6J7FOo4Z6SO45Uy8rHyN2TO
         Om7SRmuE7hXhm+1wmo6ITkP+zGtf76qpKTpXgczjnB3UCYr+yQSr3zjms1vX10/AWL
         hIgyldoqlqld0vsoliHBYoVacBCtE4Fdia52A/Z4=
Received: from [IPV6:2001:67c:1298::14] (unknown [IPv6:2001:67c:1298::14])
        by mail1.tootai.net (Postfix) with ESMTPSA id D94F36081A3F;
        Wed,  8 Nov 2023 10:47:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1699436857; bh=l47gApTNmr5JnU+hkAgirbXAw/eZh7n53ZodgfX1Gdw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MhfLgwoqhKacEg9FAsYIWZmMl1BMcgMUR4Mc9klVBr6J7FOo4Z6SO45Uy8rHyN2TO
         Om7SRmuE7hXhm+1wmo6ITkP+zGtf76qpKTpXgczjnB3UCYr+yQSr3zjms1vX10/AWL
         hIgyldoqlqld0vsoliHBYoVacBCtE4Fdia52A/Z4=
Message-ID: <fde3f97b-c58b-400f-978a-7b4810507da3@tootai.net>
Date:   Wed, 8 Nov 2023 10:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Redirect doesn't do the job as dnat does
Content-Language: fr, fr-FR
To:     Florian Westphal <fw@strlen.de>
Cc:     Netfilter list <netfilter@vger.kernel.org>
References: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
 <20231105152753.GA21055@breakpoint.cc>
 <a7f19ab3-5fc8-4816-a403-9ae2a4b51358@tootai.net>
 <20231108093300.GD5721@breakpoint.cc>
From:   Tech <tech@tootai.net>
In-Reply-To: <20231108093300.GD5721@breakpoint.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org


Le 08/11/2023 à 10:33, Florian Westphal a écrit :
> Tech <tech@tootai.net> wrote:
>> Le 05/11/2023 à 16:27, Florian Westphal a écrit :
>>> Tech<tech@tootai.net> wrote:
>>>> in another terminal I run nc -vl :: 58198 Listening on :: 58198 
>>> Please also spawn tcdump -n "tcp port 58198 or tcp port 58194" 
>> Sended per PM 
> The dump was very boring, shows SYNs without any replies. redirect is 
> the same as dnat, except that redirect just takes the first address 
> that it finds on the given interface. So I'd guess that it picks an 
> unusable one, e.g. link-local. Can you post 'ip -6 addr show dev $dev" ?
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state 
UP group default qlen 1000
     altname enp0s3
     altname ens3
     inet6 ::ffff:100.64.229.29/96 scope global
        valid_lft forever preferred_lft forever
     inet6 2a01:4f8:c0c:9e5b::1/64 scope global
        valid_lft forever preferred_lft forever
     inet6 fe80::9400:2ff:fe39:962c/64 scope link
        valid_lft forever preferred_lft forever

-- 

Daniel Huhardeaux +33.368460088@tootai.net sip:820@sip.tootai.net 
+41.445532125@swiss-itech.ch tootaiNET
