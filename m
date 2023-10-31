Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7944AC4332F
	for <netfilter@archiver.kernel.org>; Tue, 31 Oct 2023 14:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbjJaOFv (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 31 Oct 2023 10:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjJaOFq (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 31 Oct 2023 10:05:46 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A142BF1
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 07:05:42 -0700 (PDT)
Received: from [78.30.35.151] (port=53412 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qxpNA-00FFiV-Uw; Tue, 31 Oct 2023 15:05:39 +0100
Date:   Tue, 31 Oct 2023 15:05:35 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Volodymyr Litovka <doka@funlab.cc>
Cc:     netfilter@vger.kernel.org
Subject: Re: nftables / DHCP / NAT
Message-ID: <ZUEJrwuwr0tw+TNL@calendula>
References: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
 <ZT9sQZw2hmkM5nh2@calendula>
 <2c86ff9c-9aee-41fc-94fd-0b9f2e911961@funlab.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c86ff9c-9aee-41fc-94fd-0b9f2e911961@funlab.cc>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi Volodymyr,

On Mon, Oct 30, 2023 at 11:20:55PM +0100, Volodymyr Litovka wrote:
> Hi Pablo,
> 
> On 10/30/23 09:41, Pablo Neira Ayuso wrote:
> > Then, to forward packets to some other box from the 'netdev' family,
> > use the 'fwd' statement:
> > 
> >          udp dport 67 udp dport set 10067 counter fwd to 100.64.0.66 device "eth0"
> > 
> > This rule above is mangling your UDP destination port from 67 to
> > 10067, then it send the packet to 100.64.0.66 and device "eth0". The
> > destination MAC address is updated by the neighbour layer so you do
> > not have to bother with "ether daddr set ..."
> 
> This works, thanks. But - all packets are duplicated :)

I see no duplicates, see below.

> If I run on the receiving host the command (in short - extract what I'm
> interested in)
> 
> tshark -i enp1s0 -l -f 'port 10067 and ether[42:1]==2' -d
> udp.port=10067,dhcp  -V -Y 'dhcp.option.dhcp==5' -V -E "separator=|" -E
> "quote=n" -E "occurrence=a" -T fields -e
> "dhcp.option.agent_information_option.value" -e "dhcp.ip.client"
> 
> then when using the old version of rules (just to check and compare) -
> udp dport 67 meta pkttype set other ether daddr set 96:9f:7c:d3:c3:66 ip
> daddr set 100.64.0.15 udp dport set 10067 counter accept
> 
> then tshark shows everything is ok, but if using -
> udp dport 67 udp dport set 10067 counter fwd ip to 100.64.0.15 device enp1s0

I had to cleanup your snippet, it contains non-breaking space (0xc2
0x0a) which makes the parser unhappy:

test.nft:2:1-1: Error: syntax error, unexpected junk
    chain rewrit {
^

This is the cleaned up result:

table netdev inspan {
    chain rewrit {
       type filter hook ingress device "inspan" priority filter; policy drop;
       udp dport 67 udp dport set 10067 counter packets 9510 bytes 4137201 fwd ip to 100.64.0.15 device "enp1s0"
    }
}

> then every packet (same running tshark) is duplicated:
> 
> 64702...31333430|x.x.x2.238
> 64702...31333430|x.x.x2.238

I suspect this shows the packet coming in (ingress) and coming out
(egress) on the same device.

I can see this in tcpdump, I made a similar ruleset that matches on
udp dport 8000, it mangles it to udp 8888 and forwards it to the same
device:

14:52:32.753056 IP 192.168.210.137.51820 > 192.168.210.130.8000: UDP, length 4
14:52:32.753149 IP 192.168.210.137.51820 > 192.168.210.130.8888: UDP, length 4

The first packet is the packet shown by tcpdump at ingress, the second
packet is the packet that is forwarded and tcpdump shows it at egress.

On the collector, I can see one single packet with UDP port 8888.

> Any ideas why this can happen?

I think what you observe from tshark / tcpdump is the packet at
ingress and then (being reflected) at egress.
