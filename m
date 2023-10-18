Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8C8CDB483
	for <netfilter@archiver.kernel.org>; Wed, 18 Oct 2023 11:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjJRLbl (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 18 Oct 2023 07:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjJRLbh (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 18 Oct 2023 07:31:37 -0400
Received: from mx02.bht-berlin.de (mx02.bht-berlin.de [141.64.5.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A234010F
        for <netfilter@vger.kernel.org>; Wed, 18 Oct 2023 04:31:35 -0700 (PDT)
Received: from post.beuth-hochschule.de (exch1.beuth-hochschule.de [IPv6:2001:638:812:12::101])
        by mx02.bht-berlin.de (Postfix) with ESMTPS id 44C041FC75;
        Wed, 18 Oct 2023 13:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bht-berlin.de;
        s=dkim1-aes2048; t=1697628688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZJvt8qc3kDtMI9hEMo2vkpL2PBPLk1235m9posfdolo=;
        b=BYUMyEin8ss/1JiUJMy+FZC7+EVX6oUJVkFg6t6S5E+NhK+uBrBrkbpW0elH2HSU+ywu0I
        avtsPK+PFP++FoLA4duBdMtpSZMWskO6S+1hoVZ10gCKI3xQnuwLBIPw2PRK0uQFk3yayf
        Flc+dm84b2WrIOMZxmOOqoP7CMLZv3n/H7oRGHjTnai7FzTDqhV2Q05XiMR4GfW4mZSGTM
        6+REz4+up7S2TzFm6nEm2bBORIMDNqSFM1a6JT+GnazIq88BWUhQ8uiQB34pooO/tWvQZd
        TCNo1QzemNmPU5uF3p3bK7kKlmlP86u2tHcyBriKgIucMhe4r5FRItoKzxNl2w==
Received: from [10.128.255.2] (141.64.12.127) by EXCH1.beuth-hochschule.de
 (2001:638:812:12::101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.27; Wed, 18 Oct
 2023 13:31:27 +0200
Message-ID: <0f294468-d7c5-477c-b95f-6a5ce68fd79e@bht-berlin.de>
Date:   Wed, 18 Oct 2023 13:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: commit to kernel fails since Debian 12 (bookworm)
Content-Language: en-US
To:     Pablo Neira Ayuso <pablo@netfilter.org>
CC:     <netfilter@vger.kernel.org>
References: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
 <ZSlXJdqfKFxF0OcO@calendula>
 <6289ae8d-7d8e-40a5-a012-3e6e32251942@bht-berlin.de>
 <ZS0TvfCRySTWfdW6@calendula>
 <43708702-0f37-4ea6-9b3d-4dc8ac2913a1@bht-berlin.de>
 <ZS2qCnq6c+mKyDa3@calendula>
From:   Markus Wigge <wigge@bht-berlin.de>
In-Reply-To: <ZS2qCnq6c+mKyDa3@calendula>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EXCH2.beuth-hochschule.de (2001:638:812:12::102) To
 EXCH1.beuth-hochschule.de (2001:638:812:12::101)
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27942.006
X-TM-AS-Result: No-10--9.547600-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/tJFtr9dvFSJfHkpkyUphL9J7TAdoWYpOfkMnUVL5d0E0NK
        xNfKw7Si3yUMI3JRg8+mruCS2CN5rSd144Bsl1p5owvZ4t/MYW7YUDvAr2Y/11gLks93sG9t1we
        kTm8GZ3cyagPvoxWFg/iTV1io6Fjd1ZWTH/reat01yhbbA7We0yFq4bKNOR/1ABWQdS+vSZ6eAi
        CmPx4NwLTrdaH1ZWqCZYJ9vPJ1vSDiaBcE8wFw3o2j49Ftap9Eymsk/wUE4hqCQhop20yfUBpw/
        2I7plwkMwr/eoeTAUJ8JHiFUV6LZpNAIHOA8Vgi
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.547600-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27942.006
X-TM-SNTS-SMTP: 349373658D49160EF9AFA2B7AF840797D0522ED6AB585C8ECC8BC2C12C878D442000:8
X-Rspamd-UID: 5c0fce
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hello,


> So VLAN interfaces are distributed between nodes and, on failover, one
> node picks up the VLAN interfaces of the node that is failing? I am
> trying to understand if, in your setup, one node is active but is is
> also at the same time a backup for the flows that are handled by the
> other node.
Yes, the VLAN interfaces are available on both nodes but only one nodes 
has configured IP addresses on the interface. The other nodes only takes 
over the address with keepalived if necessary.

So could it be possible, that the kernel notices flows on the passive 
VLAN interface?



> This is how it works with net.netfilter.nf_conntrack_tcp_loose = 1,
> that toggle enables "poor man" connection pickup, that is, the kernel
> infers from the middle of the connection the current state.
But why does the kernel see this connection at all when it flow over the 
other node?


>>> Is your ruleset dropping invalid packets?
>>
>> Only for smurfs as far as I can see:
>>>   203M   19G smurfs     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID,NEW,UNTRACKED
>>
>>> Chain smurfs (7 references)
>>>   pkts bytes target     prot opt in     out     source               destination
>>>    19M 6211M RETURN     0    --  *      *       0.0.0.0              0.0.0.0/0
>>>      0     0 smurflog   0    --  *      *       0.0.0.0/0            0.0.0.0/0           [goto]  ADDRTYPE match src-type BROADCAST
>>>      0     0 smurflog   0    --  *      *       224.0.0.0/4          0.0.0.0/0           [goto]
> 
> This RETURN means you take back invalid packets to the chain where the
> jump to smurfs happen.
Yes and there are dedicated chains for the configured zones which each 
drop INVALID packets.

>> Following the logs it appears to me that every single entry is getting
>> late then. I doubt that and don't see where state should come from
>> beforehand.
> 
>  From datapath itself, from the _loose mechanism that is enabled.
What datapath? The passive node should not be involved with the flows of 
the other node?

Kind Regards
Markus
