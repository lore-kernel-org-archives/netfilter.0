Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE43C4332F
	for <netfilter@archiver.kernel.org>; Wed,  1 Nov 2023 13:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344119AbjKAN2w (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 1 Nov 2023 09:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343771AbjKAN2v (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 1 Nov 2023 09:28:51 -0400
Received: from tootai.net (mail1.tootai.net [IPv6:2a01:4f8:a0:821b::58:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9945EFC
        for <netfilter@vger.kernel.org>; Wed,  1 Nov 2023 06:28:45 -0700 (PDT)
Received: from tootai.net (localhost [127.0.0.1])
        by mail1.tootai.net (Postfix) with ESMTP id F2170608142E
        for <netfilter@vger.kernel.org>; Wed,  1 Nov 2023 14:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1698845324; bh=tUs+/6eH2qQGs5Ek25CZaKFg7RWrR6wyR0lyGAda9pA=;
        h=Date:From:Subject:References:To:In-Reply-To:From;
        b=AVZV0Op27ogtnM/d+ZXNyn3uYgEnqAJCsTUCPnGUS5TOS0zmVytJs1WNe8/2E4vI7
         vX1BFIUYVbZgqvgdnhs6WpHA8jpKcDrMz6ebmtprBkdc+cLd/U90eMAQ1zsCC7h7Lo
         3AxhDf8fsqGPFtLaZnJA9xD/K8HQGBP7m4HA7QOI=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
        by mail1.tootai.net (Postfix) with ESMTPA id C2A256081A3F
        for <netfilter@vger.kernel.org>; Wed,  1 Nov 2023 14:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1698845323; bh=tUs+/6eH2qQGs5Ek25CZaKFg7RWrR6wyR0lyGAda9pA=;
        h=Date:From:Subject:References:To:In-Reply-To:From;
        b=Q4wj4kDa2BRIBIHgirsbZTx+0DBvxG9CQyL5/EnuLXN4N2bRVmA1A8INHA5pPYq7M
         DhjeHKw4HKSfZnE5wU77yoolfzOZGHsfsjfjC8xrSFl3c90q55zoMPpwUS/ySKYd/k
         KnI2012oFnmR6Lo543xiHftke//vIak56W0405fk=
Message-ID: <906a00d3-8d3c-4ea5-9bda-40ae905856a3@tootai.net>
Date:   Wed, 1 Nov 2023 14:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Daniel <tech@tootai.net>
Subject: Re: map problem with port range
References: <c0f8e0aa-93dd-46c6-9eda-7cb7934bf1c6@tootai.net>
 <ZUINFUf9id6w7YUI@calendula>
Content-Language: fr-FR
To:     Netfilter list <netfilter@vger.kernel.org>
In-Reply-To: <ZUINFUf9id6w7YUI@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org


Le 01/11/2023 à 09:32, Pablo Neira Ayuso a écrit :
> On Tue, Oct 31, 2023 at 07:38:30PM +0100, Daniel wrote:
>> Hi list
>>
>> nft 1.02 I have following map configuration:
>>
>> map forward_udp.lan {
>>      type ipv6_addr . inet_service : interval ipv6_addr . inet_service
>>      flags interval
>>      elements = { 2001:db8::1 . 20000-24999 : 2001:db8:16e:10::ffee .
>> 20000-24999 }
>> }
>>
>> ip6 chain prerouting
>>
>> add rule ip6 nat prerouting ip6 daddr . udp dport map @forward_udp.lan
> What is your intention with this rule?
>
> Are you looking up for a matching packet in this map using
>
>          ip6 daddr . udp dport
>
> as key?
Yes. dport 20000-24999 to 2001:db8::1 should be forwarded du same port 
range at 2001:db8:16e:10::ffee

-- 
Daniel
