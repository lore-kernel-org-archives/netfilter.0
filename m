Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B51C4332F
	for <netfilter@archiver.kernel.org>; Mon, 30 Oct 2023 11:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbjJ3L6t (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 30 Oct 2023 07:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJ3L6s (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 30 Oct 2023 07:58:48 -0400
Received: from px.funlab.cc (px.funlab.cc [159.69.251.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17D19D
        for <netfilter@vger.kernel.org>; Mon, 30 Oct 2023 04:58:46 -0700 (PDT)
Received: from [192.168.1.40] (83.10.249.109.ipv4.supernova.orange.pl [83.10.249.109])
        (Authenticated sender: doka@funlab.cc)
        by px.funlab.cc (Postfix) with ESMTPSA id 6A90C60739;
        Mon, 30 Oct 2023 13:58:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=funlab.cc; s=dkim;
        t=1698667125; bh=nWftXLkBZxyOpwBkadIqTj6YQp8udXDjJpGPvoaWCEA=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
        b=oRERFmS4TdxuAVs1n/WLS2Wq2iHiFg05PnkKoteYVytHzkuJAG9ilwjJH2u41lbHm
         RvM1OzZmo34zFONq7kaz1vVedMDt6bVqZW0m9Hlkp/e3r7OzCZegDctHJq2rmOrYDS
         8CRGa9G45LY18rgwnIYwYnovfV+gwdwuehcM2UJgrd7Crcos1Ms/rtDAkD37ioR1qv
         R46CDh+cHcM3P332k+uJ1NCeNxdaoq2KPDD3CYpxjNNX1zQqJBVYxMNB4ROuFLBq+L
         WpW+jNBdXUqMoaCz23k7Q4TFKXdEt5mMdHlKcYgvguostv10/XgN8mBeGyK21JXjCM
         VWm7iTK6V4aVw==
Message-ID: <dc369ef0-9eb3-4e38-92aa-b80e0ebdaa73@funlab.cc>
Date:   Mon, 30 Oct 2023 12:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Volodymyr Litovka <doka@funlab.cc>
Subject: Re: nftables / DHCP / NAT
To:     Pablo Neira Ayuso <pablo@netfilter.org>
Cc:     doka@funlab.cc, netfilter@vger.kernel.org
References: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
 <ZT9sQZw2hmkM5nh2@calendula>
Content-Language: en-US
In-Reply-To: <ZT9sQZw2hmkM5nh2@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi Pablo,

On 10/30/23 09:41, Pablo Neira Ayuso wrote:
> iifname "inspan" ...
>
> is not really required, because you chain is already hooked at
> "inspan" device see your chain declaration:
thanks for that.

> Then, to forward packets to some other box from the 'netdev' family,
> use the 'fwd' statement:
>
>          udp dport 67 udp dport set 10067 counter fwd to 100.64.0.66 device "eth0"
>
> This rule above is mangling your UDP destination port from 67 to
> 10067, then it send the packet to 100.64.0.66 and device "eth0". The
> destination MAC address is updated by the neighbour layer so you do
> not have to bother with "ether daddr set ...".

the basic idea of this construction is to use later load balancing 
(https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing) 
between multiple destinations, in the section

table ip todos {
     chain enat {
         type nat hook prerouting priority dstnat;
         udp dport 10067 counter dnat to 100.64.0.15:10067
         udp dport 11813 counter dnat to 100.64.0.15:11813
     }
}

so on the first step (netdev) I'm setting dst mac to local (so packet 
will not be dropped as "alien", because I receive on this box mirrored 
(SPAN) traffic, where dst mac is not this box) and then load-balance it 
between multiple destinations using NAT/LB. As far as I understand, 
'fwd' is for forwarding to a single destination.

I will appreciate any suggestion on how to solve this task - either fix 
what I'm trying to do or using another way :-)

Thank you.

-- 
Volodymyr Litovka
   "Vision without Execution is Hallucination." -- Thomas Edison

