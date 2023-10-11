Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBDECDB464
	for <netfilter@archiver.kernel.org>; Wed, 11 Oct 2023 16:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjJKQZS (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjJKQZR (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 11 Oct 2023 12:25:17 -0400
X-Greylist: delayed 308 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 11 Oct 2023 09:25:14 PDT
Received: from mout2.freenet.de (mout2.freenet.de [IPv6:2001:748:100:40::2:4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18CB8F
        for <netfilter@vger.kernel.org>; Wed, 11 Oct 2023 09:25:14 -0700 (PDT)
Received: from [195.4.92.127] (helo=sub8.freenet.de)
        by mout2.freenet.de with esmtpa (ID b.ohnsorg@freenet.de) (port 25) (Exim 4.94.2 #2)
        id 1qqbwJ-008HGR-Kc
        for netfilter@vger.kernel.org; Wed, 11 Oct 2023 18:20:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
        s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=H0pJj/crvsRuGp/ZIr+ucp9z8b4mj41YA7iq3EuBnFI=; b=XOKY4CdMzOEFFwilEUbroA0BVG
        Ozk8x+ef5SXPTGied7i0aLCBgPAPPvLgj2Eyftum529TRR9ZIDQsI61tp7jYFVUtA+ylLkZwv2cY+
        BOA315MhAEviLVOnq1UeAmZPlR6H9IErq1VXfTYUjNFfO9jfzjEzema9mENAwKyMZ7FSGyO+hOJve
        haZ0ok0c3TKBHz/lz854pQO16vjVk3MN20lazDcL7i6XwSH/5miBmw42Bu678S4eX18LyCAPa2iwj
        5triKRMGpKZ+LCR/wV5Joa/+YwIKWsZLywowNCHT/lj3sGV7EKvoMIxJhlAwbqcsiCfn9IVXX6U4P
        smsZT+dQ==;
Received: from dslb-094-217-225-143.094.217.pools.vodafone-ip.de ([94.217.225.143]:60824 helo=[192.168.2.50])
        by sub8.freenet.de with esmtpsa (ID b.ohnsorg@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.94.2 #2)
        id 1qqbwJ-00H5Tc-Ay
        for netfilter@vger.kernel.org; Wed, 11 Oct 2023 18:20:03 +0200
Message-ID: <87ce6944-cba9-0189-a55f-fe9e5e74b08f@freenet.de>
Date:   Wed, 11 Oct 2023 18:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To:     netfilter@vger.kernel.org
Content-Language: de-DE
From:   Benno <b.ohnsorg@freenet.de>
Subject: Efficient and correct time based bandwidth monitoring
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FN-MUUID: 1697041203B9829B5A142DO
X-Originated-At: 94.217.225.143!60824
X-Scan-TS: Wed, 11 Oct 2023 18:20:03 +0200
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi there,

I want to monitor bandwidth/ throughput (on a NAT-ing IPv4 router) in a 
sliding window of n minutes correctly. Just from the wiki or the docs 
some uncertainties remain.

Named counter could be a first approach:

table inet filter {

   counter accept_https {}

   tcp dport 443 counter name accept_https accept comment "accept https"
}

Current state is to be queried with nft list ruleset | grep counter. 
Such a counter will gather statistics from start of loading the ruleset 
until eternity. A delta analysis for a 15min window could be solved in a 
later stage by a little math of a scraping tool.

A set would serve a similar purpose. This example is already more 
sophisticated to distinguish (internal) IP(v4) addresses:

define private_net = 192.168.2.0/24

table inet nftmon {
         set ip4counters {
                 type ipv4_addr
                 size 65535
                 flags dynamic
                 counter
         }

         chain forward {
                 type filter hook postrouting priority filter + 1; 
policy accept;
                 ip saddr $private_net add @ip4counters { ip saddr }
                 ip daddr $private_net add @ip4counters { ip daddr }
         }
}

Querying it with:

nft list set inet nftmon ip4counters

is more straightforward listing only the relevant metrics.

I could further enhance this with flags timeout for the set and add a 
timeout of 15min in the add part of the rule filling the set:

ip saddr 192.168.1.0/24 add @ip4counters { ip saddr timeout 15m }

1. The first approach with a named counter and a diff logic in a later 
stage (scraping script, piece of code) moves load from nftables 
somewhere else. Is this recommended in comparison to the 
timeout-flagging of set-variant? Will a counter overflow and break 
subtraction from time to time? (Uptime is multiple months with 
sufficient traffic.)

2. For the 2nd approach I assume the single packet matching the rule 
will end up with a 15m timeout in the set. Thus no entry in the set is 
older than 15min. So the metrics from this set only span a 15min 
interval. Is this correct? Asked from a different point of view: when 
will garbage collection take place clearing the timed out values from 
the set?

3. The pure counter approach cannot be improved with a garbage 
collection configuration? This would create 24x4 15min-intervals when 
running every 15min. Scraping this in between garbage collection runs 
means missing bandwidth/ packets?


4. Is there a third more efficient/ cheaper approach to define a rule or 
rules to yield bandwidth/ througput metrics grouped by IP (or port or 
whatever the rule is made of) so that only the last n minutes are taken 
into consideration? (Precise to the minute.)

5. Querying conntrack would be later stage if bandwidth monitoring 
yields unusual activity. A counter or the set approach requires less 
ressources (CPU, memory). Is this correct?


Thanks in advance,

Benno
