From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: Re: Re: Re: Re: Flowtable with ppp/bridge
Date: Mon, 10 May 2021 08:50:56 +0200
Message-ID: <trinity-abe9ce42-2ceb-416a-a3e9-b4ecc810df5f-1620629456214@3c-app-gmx-bs56>
References: <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
 <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
 <20210503213213.GA17087@salvia>
 <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
 <20210504114256.GA6473@salvia>
 <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
 <20210505225516.GB13833@salvia>
 <trinity-3bc0c812-7f83-491f-9845-5091c29526e6-1620294801192@3c-app-gmx-bap25>
 <20210506155134.GA28034@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620629456;
        bh=3MVbmm2U3AJP5O5PR//VANSWkWLpwsj4ZYNj65ga+JQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SnfumJTDT/tHyQXAuwfGvT4Ujmct4fO7BWKxFU/krJZU8Csa2FUDwAEkXDdqRuWPD
         V13i6Ue4hDZ3cISZwhVCdZshnyfF2pn0XZcSC+jOVz+31vJ3iLaCL7A2ngyuyaWDDp
         67Gr5gMoQ5ypadYmIttgSaa2xPcAKAJYdISvvxLo=
In-Reply-To: <20210506155134.GA28034@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi

> Gesendet: Donnerstag, 06. Mai 2021 um 17:51 Uhr
> Von: "Pablo Neira Ayuso" <pablo@netfilter.org>

> > >    chain FORWARD {
> > >         type filter hook forward priority 0; policy drop;
> > >
> > >         tcp flags syn tcp option maxseg size set rt mtu
> > >         ct state vmap { established : jump FORWARD_established, related : jump FORWARD_established, new : jump FORWARD_new }

tried this way, seems to work so far, i have only problem on removing my ruleset with iptables (have this to reset my complete firewall, not only nft).

iptables -X
iptables v1.8.2 (nf_tables):  CHAIN_USER_DEL failed (Device or resource busy): chain FORWARD_known

i guess iptables cannot delete chain cause it is linked by ctstate vmap any idea?

is order important of defined chains? maybe i can move the 2 new forward-chains below old with "ct state vmap"

regards Frank
