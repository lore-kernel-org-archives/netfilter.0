Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF68C4332F
	for <netfilter@archiver.kernel.org>; Tue, 31 Oct 2023 21:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbjJaV0x (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 31 Oct 2023 17:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjJaV0w (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 31 Oct 2023 17:26:52 -0400
Received: from px.funlab.cc (px.funlab.cc [159.69.251.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF575B9
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 14:26:49 -0700 (PDT)
Received: from [192.168.1.40] (83.10.249.109.ipv4.supernova.orange.pl [83.10.249.109])
        (Authenticated sender: doka@funlab.cc)
        by px.funlab.cc (Postfix) with ESMTPSA id 6EDDA60737;
        Tue, 31 Oct 2023 23:26:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=funlab.cc; s=dkim;
        t=1698787608; bh=mhyTE6Vgprkg0ZMQHkmZXPCm+KGlsW4WkaVR1atJlrs=;
        h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
        b=Q+WkdS9nJl/teZtcsa1koS0I0sMcMhCll8CBjOpKrMiGRxQENBStnuaMTc+vJ+NC3
         iNl38353pkVvpuHXRDylRpwCRraEZXUvDjj4XiK+dKYX81iR6q/z6cHGRiLZAmPUCW
         HC8pmyYC2IE0FSDZXCO9/j3K6HrMXPWIgzF49ebYGdxTuQHbxqE+LZOsjlpT8dwmGz
         A1UnqfBsqNWQ/frhAs8a3m1WmCWuQkuCU9VcPTu0JgshsROyBaosy3A8iS5/4iPwhI
         sKL3SjsQZsiJAk2HG4r7G/l1pAoMNmoAwlP1SVv5l++PVgHqSIpYY7F7up1xLRKVGe
         NcF2Hvarok93w==
Message-ID: <0d0602ef-362a-4150-b8ae-ca46ff63dea3@funlab.cc>
Date:   Tue, 31 Oct 2023 22:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Volodymyr Litovka <doka@funlab.cc>
Subject: Re: nftables / DHCP / NAT
To:     Pablo Neira Ayuso <pablo@netfilter.org>
Cc:     doka@funlab.cc, netfilter@vger.kernel.org
References: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
 <ZT9sQZw2hmkM5nh2@calendula> <2c86ff9c-9aee-41fc-94fd-0b9f2e911961@funlab.cc>
 <ZUEJrwuwr0tw+TNL@calendula>
Content-Language: en-US
In-Reply-To: <ZUEJrwuwr0tw+TNL@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi Pablo,

On 10/31/23 15:05, Pablo Neira Ayuso wrote:
> I see no duplicates, see below.
thank a lot for the help. You were right and, finally, it was my 
mistake. The difference is that when I use 'ip daddr set x.x.x.x' it 
rewrites packet and receiving host is the final destination, while 'fwd' 
is frame forwarding with original ip header so this packet, being 
received, was forwarded to the original destination and that's why I 
seen two copies - one from ingress, another one - from egress.

Thanks again!

-- 
Volodymyr Litovka
   "Vision without Execution is Hallucination." -- Thomas Edison

