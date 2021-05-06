From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: Re: Re: Re: Flowtable with ppp/bridge
Date: Thu, 6 May 2021 11:53:21 +0200
Message-ID: <trinity-3bc0c812-7f83-491f-9845-5091c29526e6-1620294801192@3c-app-gmx-bap25>
References: <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
 <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
 <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
 <20210503213213.GA17087@salvia>
 <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
 <20210504114256.GA6473@salvia>
 <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
 <20210505225516.GB13833@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620294801;
        bh=nb9f+qVXFSa72ivp9y35KrnU2Q2F6KBx7cR/ATpHZO0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cfukRcVD3qFKDbMBdf/OJm5mPEGVYUyRHrxQwbPr5fiC6RGFWKMx20EkXqjXW2OTd
         7Xs1uxEG+88p0KKR9wix/dWdOUzyQBKlomdFoupx7x/w8g65SXXM8MK1oan5vjB3+r
         6wVWOV3Bbtbmhtpgs8WADpz7pBWgHYvzNkNWfwGE=
In-Reply-To: <20210505225516.GB13833@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi
> Gesendet: Donnerstag, 06. Mai 2021 um 00:55 Uhr
> Von: "Pablo Neira Ayuso" <pablo@netfilter.org>

> rfc6691 says that TCP MSS is:
>
>    The maximum number of data octets that may be received by the
>    sender of this TCP option in TCP segments with no TCP header
>    options transmitted in IP datagrams with no IP header option

right, tell receiver which size of tcp-payload sender can handle, wonder a=
bout "IP datagrams" which remembers to udp but have nothing to do with tcp=
. i think mss does nothing for udp, am i right?

> By "flowtable condition" I'm not sure if you're refering to the "flow
> add" statement through.

right, the "flow add" line with the condition (in my simple example all tc=
p/udp)

>    chain FORWARD {
>         type filter hook forward priority 0; policy drop;
>
>         tcp flags syn tcp option maxseg size set rt mtu
>         ct state vmap { established : jump FORWARD_established, related =
: jump FORWARD_established, new : jump FORWARD_new }
>    }
> }

Thanks for the example, i wonder about this:

established : jump FORWARD_established, related : jump FORWARD_established

so established and related are moved to the established-chain, so far so g=
ood, but you wrote in previous mail, that forward-chain is only processed =
for syn-packets only (first 2: syn and syn-ack), so imho there should be n=
o established connections there.

regards Frank
