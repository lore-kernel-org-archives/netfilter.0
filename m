Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543B1CDB47E
	for <netfilter@archiver.kernel.org>; Fri, 13 Oct 2023 14:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbjJMO5y (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 13 Oct 2023 10:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjJMO5w (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 13 Oct 2023 10:57:52 -0400
Received: from mout0.freenet.de (mout0.freenet.de [IPv6:2001:748:100:40::2:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A0495
        for <netfilter@vger.kernel.org>; Fri, 13 Oct 2023 07:57:48 -0700 (PDT)
Received: from [195.4.92.125] (helo=sub6.freenet.de)
        by mout0.freenet.de with esmtpa (ID b.ohnsorg@freenet.de) (port 25) (Exim 4.94.2 #2)
        id 1qrJbl-0047Xi-Ez; Fri, 13 Oct 2023 16:57:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
        s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v4Wgs3Inb61DZD4KLBFG87NGVPjOuRtz8ifPR5JyEHE=; b=ZoI9TDzW6SqggPZ/TE8x34bbXm
        UnvfaZ26ComOhdv/DBWdXpoFERVK9op3IUcRJ3VPPFkg0X0i/6QxNCxC3MWcbeR6qTmCWSG0B6lx0
        9hNZcdmMYMqQf7SESwT6ggysEd0Xm0lEcyAkG0mNRHPcg4TubYPouUelT/YdAWtwsrlB79TUGEYOA
        HoAsfmRC+2P3BBQ8Al8uED7DIwzgR1zEN3zHel8eL3IgfHD2T8bpvdGJUgI9vS3ZXnjGZ1+LgYdGQ
        zRtiv5Y1OiPHiZSgP7MyrCmGyPu16BhPyFnQORxKVzNsRVvlK284ZXE8XFaePXC1+ZedU1MiO8HJ1
        Zul2AZsA==;
Received: from dslb-094-217-225-143.094.217.pools.vodafone-ip.de ([94.217.225.143]:34328 helo=[192.168.2.50])
        by sub6.freenet.de with esmtpsa (ID b.ohnsorg@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.94.2 #2)
        id 1qrJbl-00AJlM-5Q; Fri, 13 Oct 2023 16:57:45 +0200
Message-ID: <7260b7b8-18b4-486d-a550-e408c3940106@freenet.de>
Date:   Fri, 13 Oct 2023 16:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Efficient and correct time based bandwidth monitoring
To:     Kerin Millar <kfm@plushkava.net>
Cc:     netfilter@vger.kernel.org
References: <87ce6944-cba9-0189-a55f-fe9e5e74b08f@freenet.de>
 <20231011225228.300e6c1d6621f22da6636b8e@plushkava.net>
Content-Language: de-DE
From:   Benno <b.ohnsorg@freenet.de>
In-Reply-To: <20231011225228.300e6c1d6621f22da6636b8e@plushkava.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FN-MUUID: 1697209065F1ABF352E2FBO
X-Originated-At: 94.217.225.143!34328
X-Scan-TS: Fri, 13 Oct 2023 16:57:45 +0200
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Thanks for the fast reply.

Am 11.10.23 um 23:52 schrieb Kerin Millar:
>>
>> table inet filter {
>>
>>     counter accept_https {}
>>
>>     tcp dport 443 counter name accept_https accept comment "accept https"
>> }
>>
>> Current state is to be queried with nft list ruleset | grep counter.
> 
> nft list counters inet would make more sense (--json is also supported).

Didn't try this firsthand but works. Valuable shortcut.

>>
>> define private_net = 192.168.2.0/24
>>
>> table inet nftmon {
>>           set ip4counters {
>>                   type ipv4_addr
>>                   size 65535
>>                   flags dynamic
>>                   counter
>>           }
>>
>>           chain forward {
>>                   type filter hook postrouting priority filter + 1;
>> policy accept;
>>                   ip saddr $private_net add @ip4counters { ip saddr }
>>                   ip daddr $private_net add @ip4counters { ip daddr }
>>           }
>> }
>>
> 
> In the absence of a timeout, it is probable that the set will become full.

Absolutely I simply postulated the timeout as part of the question. 
Nevertheless even with timeout and many IPs to route or fine grained 
metrics 65535 entries lasts only until 65534 plus one. (Distinguishing 
16 protocols leaves room for only 4096 entries.)

>>
>> 1. The first approach with a named counter and a diff logic in a later
>> stage (scraping script, piece of code) moves load from nftables
>> somewhere else. Is this recommended in comparison to the
>> timeout-flagging of set-variant? Will a counter overflow and break
>> subtraction from time to time? (Uptime is multiple months with
>> sufficient traffic.)
> 
> The manual indicates that they are signed 64-bit integers, which is quite generous. However, I am uncertain as to how they wrap around. My guess would be that they go as far as 9223372036854775807 ((1 << 63) - 1) before wrapping around to 0, because wrapping around to a negative number would be confusing. I would appreciate a confirmation from a Netfilter developer, one way or the other. Once the wrapping behaviour is confirmed, detecting such should be straightforward.

I could live with those since nagios. But the approach with sets and 
timeout makes this very rare.

> 
>>
>> 2. For the 2nd approach I assume the single packet matching the rule
>> will end up with a 15m timeout in the set. Thus no entry in the set is
>> older than 15min. So the metrics from this set only span a 15min
>> interval. Is this correct? Asked from a different point of view: when
>> will garbage collection take place clearing the timed out values from
>> the set?
> 
> Yes, this is correct. Once an element has timed out, it shall be unceremoniously removed. Further, the timeout value may also be defined by the set itself. A potential issue with this approach is that your data collector ends up racing with the exact time at which a given element is created and/or the exact time at which it is removed.

A small uncertainty remains according to Shannon theoreme. A 15min 
timeout scraped every 3-4min plus/minus a few packets is sufficiently 
precise.

> 
>>
>> 3. The pure counter approach cannot be improved with a garbage
>> collection configuration? This would create 24x4 15min-intervals when
>> running every 15min. Scraping this in between garbage collection runs
>> means missing bandwidth/ packets?
> 
> I'm not sure that I understand what a garbage collection configuration would entail. Do you mean for your collector to reset the counters after collecting their values? If so, I would not expect for anything to be missed, provided that the reset command is issued via the same invocation of nft(8) that instructs it to print the counters.
> 
>    nft -j 'list counters inet; reset counters inet'

Something like that or a fixed interval like 24h or fixed point in time 
like 02:00 (much larger than the scraping interval yet small enough to 
circumvent overflow or larger gaps).

> 
> Having said that, I may have uncovered a bug in the course of trying this. I shall explore the matter further.

Thanks in advance for fixing it.
