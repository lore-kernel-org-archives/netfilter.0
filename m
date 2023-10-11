Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA40DCDB47E
	for <netfilter@archiver.kernel.org>; Wed, 11 Oct 2023 21:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbjJKVwf (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 11 Oct 2023 17:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjJKVwe (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 11 Oct 2023 17:52:34 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFB29E
        for <netfilter@vger.kernel.org>; Wed, 11 Oct 2023 14:52:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E8DC332009DE;
        Wed, 11 Oct 2023 17:52:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 11 Oct 2023 17:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1697061151; x=1697147551; bh=5ipdpGiO7z1eqPYbfUtVN7/KU
        ILQd2INFvNzxnH1WQc=; b=ReznmOxEojNKHpY152XdPJO7MjoJtcyPtEXpZ8LAi
        DiUwDhoxjwl+FhxdqMHX9Jifupu/SokSD1E+3CE8oBQjL+jJSlUiEo1yUPL667XV
        qGNsvQRO01xfsI7M9giUYuSC1WdKDxgtM0XIE/LNdFZCIlE24AqbEtHR13Qz/nSs
        w6e9Hjohn7cM6sdrQZVAY/2gjgY0S8aQ9HqD/z5+HHFNNBgpWacjs09wCCn3Wttu
        RZXzurC358yEqw1xnscc3WIcMdqVdPODkzRVJuTx9jumOWVQLWPD0+m6eSNYOH1A
        y9C9agiCKdlc1sp0NWpVo4CxzIPxOlVIB/+Nw1MIlRCCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1697061151; x=1697147551; bh=5ipdpGiO7z1eqPYbfUtVN7/KUILQd2INFvN
        zxnH1WQc=; b=Hiu7x6Wq7aTajpTJncOgps8lx2LsHSwe7qO1Zpfh6crKsdcueiF
        7K/vKLccOfsgzCnVJ/zAe5/JHcERQ0+kgMWizmjGzJ5HrkfCLPRfWmKVRD5aYSKF
        +s5ey1WbbPTiCa6eicblfI/VLzdrkOdkJFj8+82l/XjbKN9EHwoIzAlcwImsaxwN
        S+qB6STQpN5HhOeSAiN/HcbcboXe3Pc7RJIbasvsQ8Q+/To52p4xO33lSS3JRuyV
        1a6Dtb7ciOIa86I+k9p99Jwzx/b3u2BQTw7OuWyirZ18ufHCwW5ljllCNMRi7ucw
        +1qRmRzYiglqBaAdU0Jwegg+Tj8J4ZHyeCQ==
X-ME-Sender: <xms:HhknZYV2zOq7xoJ0E3amW6AGXB4w0aUdEqc5rN02iR4g7O_pa8rUJw>
    <xme:HhknZckQHIxf4vaW6fI1BCuyd6AMmZlJfg_mKhEUrw2_BU4C8jaKQHumr_EtlXxlh
    TY8RsyqSHdXj7ga>
X-ME-Received: <xmr:HhknZcYTtJ0FblScJLXXMJzK_-vlrDh6QwVytZqYBebEmuuivWXNrK-wV6VVWFLbxJfFNe2lY1xurZqOYnJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheelgddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkjghfofggtgfgsehtje
    ertdfjtddvnecuhfhrohhmpefmvghrihhnucfoihhllhgrrhcuoehkfhhmsehplhhushhh
    khgrvhgrrdhnvghtqeenucggtffrrghtthgvrhhnpeeihfettefhgeeftefgheeugeeffe
    ehkedukeefffejgeeutdeggeejtdeihefhveenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehkfhhmsehplhhushhhkhgrvhgrrdhnvght
X-ME-Proxy: <xmx:HhknZXW72yLpYB21FQxfJAjOqvXgxA9PjWkvZZ8gno0wuN5RTTkkQA>
    <xmx:HhknZSmzGcQziPmzd68XZZR54To5U_v0LwgBe0HtBPDvPUfH74FuNw>
    <xmx:HhknZce6ms7cTnoam6tBKBQp9bUxuzo3ZGwRjhgw0pHGiQ3RjBN3Rg>
    <xmx:HxknZZujaSo4H3-uuYVYAMo7f5c9H-n1NYaGNvXspquHbXq35YGH-A>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Oct 2023 17:52:30 -0400 (EDT)
Date:   Wed, 11 Oct 2023 22:52:28 +0100
From:   Kerin Millar <kfm@plushkava.net>
To:     Benno <b.ohnsorg@freenet.de>
Cc:     netfilter@vger.kernel.org
Subject: Re: Efficient and correct time based bandwidth monitoring
Message-Id: <20231011225228.300e6c1d6621f22da6636b8e@plushkava.net>
In-Reply-To: <87ce6944-cba9-0189-a55f-fe9e5e74b08f@freenet.de>
References: <87ce6944-cba9-0189-a55f-fe9e5e74b08f@freenet.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Wed, 11 Oct 2023 18:17:42 +0200
Benno <b.ohnsorg@freenet.de> wrote:

> Hi there,
> 
> I want to monitor bandwidth/ throughput (on a NAT-ing IPv4 router) in a 
> sliding window of n minutes correctly. Just from the wiki or the docs 
> some uncertainties remain.
> 
> Named counter could be a first approach:
> 
> table inet filter {
> 
>    counter accept_https {}
> 
>    tcp dport 443 counter name accept_https accept comment "accept https"
> }
> 
> Current state is to be queried with nft list ruleset | grep counter.

nft list counters inet would make more sense (--json is also supported).

> Such a counter will gather statistics from start of loading the ruleset 
> until eternity. A delta analysis for a 15min window could be solved in a 
> later stage by a little math of a scraping tool.
> 
> A set would serve a similar purpose. This example is already more 
> sophisticated to distinguish (internal) IP(v4) addresses:
> 
> define private_net = 192.168.2.0/24
> 
> table inet nftmon {
>          set ip4counters {
>                  type ipv4_addr
>                  size 65535
>                  flags dynamic
>                  counter
>          }
> 
>          chain forward {
>                  type filter hook postrouting priority filter + 1; 
> policy accept;
>                  ip saddr $private_net add @ip4counters { ip saddr }
>                  ip daddr $private_net add @ip4counters { ip daddr }
>          }
> }
> 
> Querying it with:
> 
> nft list set inet nftmon ip4counters
> 
> is more straightforward listing only the relevant metrics.

In the absence of a timeout, it is probable that the set will become full.

> 
> I could further enhance this with flags timeout for the set and add a 
> timeout of 15min in the add part of the rule filling the set:
> 
> ip saddr 192.168.1.0/24 add @ip4counters { ip saddr timeout 15m }
> 
> 1. The first approach with a named counter and a diff logic in a later 
> stage (scraping script, piece of code) moves load from nftables 
> somewhere else. Is this recommended in comparison to the 
> timeout-flagging of set-variant? Will a counter overflow and break 
> subtraction from time to time? (Uptime is multiple months with 
> sufficient traffic.)

The manual indicates that they are signed 64-bit integers, which is quite generous. However, I am uncertain as to how they wrap around. My guess would be that they go as far as 9223372036854775807 ((1 << 63) - 1) before wrapping around to 0, because wrapping around to a negative number would be confusing. I would appreciate a confirmation from a Netfilter developer, one way or the other. Once the wrapping behaviour is confirmed, detecting such should be straightforward.

> 
> 2. For the 2nd approach I assume the single packet matching the rule 
> will end up with a 15m timeout in the set. Thus no entry in the set is 
> older than 15min. So the metrics from this set only span a 15min 
> interval. Is this correct? Asked from a different point of view: when 
> will garbage collection take place clearing the timed out values from 
> the set?

Yes, this is correct. Once an element has timed out, it shall be unceremoniously removed. Further, the timeout value may also be defined by the set itself. A potential issue with this approach is that your data collector ends up racing with the exact time at which a given element is created and/or the exact time at which it is removed.

> 
> 3. The pure counter approach cannot be improved with a garbage 
> collection configuration? This would create 24x4 15min-intervals when 
> running every 15min. Scraping this in between garbage collection runs 
> means missing bandwidth/ packets?

I'm not sure that I understand what a garbage collection configuration would entail. Do you mean for your collector to reset the counters after collecting their values? If so, I would not expect for anything to be missed, provided that the reset command is issued via the same invocation of nft(8) that instructs it to print the counters.

  nft -j 'list counters inet; reset counters inet'

Having said that, I may have uncovered a bug in the course of trying this. I shall explore the matter further.

> 
> 
> 4. Is there a third more efficient/ cheaper approach to define a rule or 
> rules to yield bandwidth/ througput metrics grouped by IP (or port or 
> whatever the rule is made of) so that only the last n minutes are taken 
> into consideration? (Precise to the minute.)

Short of implementing a custom tool in userspace, I don't think so. Sets are particularly powerful, as they allow for elements to be a tuple of varying data types.

> 
> 5. Querying conntrack would be later stage if bandwidth monitoring 
> yields unusual activity. A counter or the set approach requires less 
> ressources (CPU, memory). Is this correct?

Based on my own experience, I would expect for conntrack(8) scraping to be less efficient.

-- 
Kerin Millar
