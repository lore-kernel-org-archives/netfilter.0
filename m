From: Brskt <contact@brskt.be>
Subject: List chain during attack high CPU usage
Date: Wed, 31 Aug 2022 02:18:17 +0200
Message-ID: <b5e3e3d3-9631-31a4-7fc0-7193bdc10176@brskt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brskt.be;
        s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6tz9wXp5JJGPQP4PdHRLy79ecyb1CAQK9CHCX9FQIS8=; b=irAaJ7cfvuEKBhjmcXxtkxKgj4
        7uzZ9zIierZRsEhv34CsVjvR0uZZN4PWHZ14td5ovIeAGDBoVYhMLAWehAskpCV94a1p1cvNgIHrl
        HgG8RItOZuv/PLHEs3EbC5hUk046tk4Wj+tpmiQ1CMOQLf8Sz5n468+gZemMJynJ3EGyi6MTavhTr
        3sj/wOecmbqunPDRa3Ik47MGc3CsmX4RoFCpcBQrjDrGDiN/G2I0G8Pj1pHl+kPMmZt5/wTEKbFly
        tI425aayiIPBdeoqCDdQj9mx5CT0vJVOHmc+qg7nuaw9JYBVjpgkwVx3koBau18zkkrIygspLNS6N
        uk9eRTcg== 
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm using some filter which uses sets with meters. When the server is 
receiving a lot of packets per seconds (~800k+) and using the command to 
list the chain, it does take ~80% of CPU and take a long time to return 
an output.

# cat /etc/issue
Welcome to Alpine Linux 3.16

# nft -v
nftables v1.0.5 (Lester Gooch #4)

# uname -r
5.15.62-1-lts

