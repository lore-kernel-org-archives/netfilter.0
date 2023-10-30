Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DB3C4332F
	for <netfilter@archiver.kernel.org>; Mon, 30 Oct 2023 22:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjJ3WVE (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 30 Oct 2023 18:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjJ3WVC (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 30 Oct 2023 18:21:02 -0400
X-Greylist: delayed 37382 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Oct 2023 15:20:58 PDT
Received: from px.funlab.cc (px.funlab.cc [IPv6:2a01:4f8:c010:6bd5::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0112A103
        for <netfilter@vger.kernel.org>; Mon, 30 Oct 2023 15:20:58 -0700 (PDT)
Received: from [192.168.1.40] (83.10.249.109.ipv4.supernova.orange.pl [83.10.249.109])
        (Authenticated sender: doka@funlab.cc)
        by px.funlab.cc (Postfix) with ESMTPSA id E451060737;
        Tue, 31 Oct 2023 00:20:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=funlab.cc; s=dkim;
        t=1698704457; bh=TQHknMWRd96fC3RGnIMslfxbscwtFp1YjT+cNmXtAsM=;
        h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
        b=LxTprdjYLMm9OIBChNk3DjYbw56fXe9Ev0rTLu6W1MFAwB+J1LRAi38y7BB911VdL
         vXHh5IRn2ItG6w2ggMKLxh46H9IvsCYsDSLcU5sO/bKT59I/pcXBxBZXbV0HxBYX/f
         F7SOqH7MqEFO90RIpsYKyrmHD0xiz30bUSB4A8KNJ9rgjyQKLsApO1MDeQZsIeTTfr
         BWHUHJCj/v9X2L6QYpKhADRCZcZ9WzJt/RkLyE9VN9hOpYC0u76sGGF9FxI0aKwbyD
         uyDyEfKC4anlqJZU/41757PMXGI/ojvaqUvwHrpaL74BuRKlDUlv6cX4qhmEWf7jNh
         mGXekKmgy0S8A==
Message-ID: <2c86ff9c-9aee-41fc-94fd-0b9f2e911961@funlab.cc>
Date:   Mon, 30 Oct 2023 23:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc:     netfilter@vger.kernel.org, doka@funlab.cc
Subject: Re: nftables / DHCP / NAT
Content-Language: en-US
To:     Pablo Neira Ayuso <pablo@netfilter.org>
References: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
 <ZT9sQZw2hmkM5nh2@calendula>
From:   Volodymyr Litovka <doka@funlab.cc>
In-Reply-To: <ZT9sQZw2hmkM5nh2@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi Pablo,

On 10/30/23 09:41, Pablo Neira Ayuso wrote:
> Then, to forward packets to some other box from the 'netdev' family,
> use the 'fwd' statement:
>
>          udp dport 67 udp dport set 10067 counter fwd to 100.64.0.66 device "eth0"
>
> This rule above is mangling your UDP destination port from 67 to
> 10067, then it send the packet to 100.64.0.66 and device "eth0". The
> destination MAC address is updated by the neighbour layer so you do
> not have to bother with "ether daddr set ..."

This works, thanks. But - all packets are duplicated :)

If I run on the receiving host the command (in short - extract what I'm 
interested in)

tshark -i enp1s0 -l -f 'port 10067 and ether[42:1]==2' -d 
udp.port=10067,dhcp  -V -Y 'dhcp.option.dhcp==5' -V -E "separator=|" -E 
"quote=n" -E "occurrence=a" -T fields -e 
"dhcp.option.agent_information_option.value" -e "dhcp.ip.client"

then when using the old version of rules (just to check and compare) -
udp dport 67 meta pkttype set other ether daddr set 96:9f:7c:d3:c3:66 ip 
daddr set 100.64.0.15 udp dport set 10067 counter accept

then tshark shows everything is ok, but if using -
udp dport 67 udp dport set 10067 counter fwd ip to 100.64.0.15 device enp1s0

( which comes to
# nft list ruleset
table netdev inspan {
     chain rewrit {
         type filter hook ingress device "inspan" priority filter; 
policy drop;
         udp dport 67 udp dport set 10067 counter packets 9510 bytes 
4137201 fwd ip to 100.64.0.15 device "enp1s0"
     }
}

then every packet (same running tshark) is duplicated:

64702...31333430|x.x.x2.238
64702...31333430|x.x.x2.238
48522...312e3430|x.x.x4.168
48522...312e3430|x.x.x4.168
49534...312e3430|x.x.x5.119
49534...312e3430|x.x.x5.119
6c632...2f392d34|x.x.x5.183
6c632...2f392d34|x.x.x5.183

Linux 6.5.0-060500-generic #202308271831 SMP PREEMPT_DYNAMIC Sun Aug 27 
22:37:37 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
nftables v1.0.2 (Lester Gooch)

Any ideas why this can happen?

Thank you.

-- 
Volodymyr Litovka
   "Vision without Execution is Hallucination." -- Thomas Edison

