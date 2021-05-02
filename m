From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Flowtable with ppp/bridge
Date: Sun, 2 May 2021 15:51:08 +0200
Message-ID: <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
 <20210426172924.GA3178@salvia>
 <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de>
 <20210426175703.GA3590@salvia>
 <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
 <20210427234929.GA19570@salvia>
 <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
 <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619963468;
        bh=TxQyGWpGTFQYMeLqCCErcr0EEEvz2BWwvMWT0ed/Lpo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=h/FB4r4A1ofqHAGcj5R0BgX7QxGLaYxSwBMR3S6T3egLfBpFRus+7dNsNw78g3R0l
         xTAph7kw7k0bJcfu3c21W/pWty9OrxK5v3zPYC1WSAffHsAqgCB18TyNWY0u7X2Sse
         ZiAOTLhZHHLOLFJGo17mdOOmF57L1Hhmbi6WeW9M=
In-Reply-To: <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hi,

i got a bit further and it looks like an MTU-Issue

i tested now with my 5.10 bridges,vlan and pppoe

first 2 working without problems, pppoe works only if i reduce mtu to e.g. 1480 (pppoe has 1492).

i tried with this patch (found as difference between my 5.10 and 5.12 hnat trees), but this does not solve it.

https://github.com/frank-w/BPI-R2-4.14/commit/5f7d57280c1982d993d5f4ff0edac310f820f607 (bpf: Drop MTU check when doing TC-BPF redirect to ingress)

any idea? i wonder why mtu is a problem here, as with 1500 default i still got internet-connection (over pppoe on main-router too) and due to Pathdiscovery it should fragment. Seems this is not working in 5.10 for flowtable. Without flowtable (disable "flow add" line, disabling "flags offload" is not enough) i have no issues.

any idea?

regards Frank
