From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Re: Re: Re: Re: Flowtable with ppp/bridge
Date: Wed, 5 May 2021 10:55:24 +0200
Message-ID: <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
References: <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
 <20210427234929.GA19570@salvia>
 <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
 <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
 <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
 <20210503213213.GA17087@salvia>
 <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
 <20210504114256.GA6473@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620204924;
        bh=hRsYZjdOjmuAGHSnZS4ESzWG6FVXjJri6n8zXbCLQsE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ab18J+0tBRiH/k2hMYIlrc684Li2mFiKy9yDghbip8SxwJoKZALSXMZSE9cvQOnWv
         mszW+zu/KKfBB0C6imVQTp8Kc98gSysV0TX1rtA2aOPlMlX7YBS74R2KCn77A2kGb0
         8V5dZQ5v0oTbDqqMIhVG3cq/lLqlil7ci0vy081M=
In-Reply-To: <20210504114256.GA6473@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi,
> Gesendet: Dienstag, 04. Mai 2021 um 13:42 Uhr
> Von: "Pablo Neira Ayuso" <pablo@netfilter.org>

> You also need TCP clamp MTU in a non-flowtable setup.
hi,
thats clear now, but i guess i had not much problems till now because of P=
ath discovery

> > $ifwan is my ppp8, and "tcp flags syn" imho should match syn and syn+a=
ck.
>
> syn+ack matches iifname $ifwan.

imho this depends on the initiator of the connection. if i try to establis=
h connection from my lan, this is true, and mss is set by oifname ppp0. Af=
air SYN-ACK from "Server" does use my size for syn-ack (if it is smaller t=
hat its size), or am i wrong?

if i initiate a connection from the public internet, i need to match iifna=
me ppp0, but only if my ISP does not modify mss on pushing the initial SYN=
-Packet through the ppp-tunnel. But afair in this case i modify mss with o=
ifname, but on response (SYN-ACK) i send back to the initiator.

> Only the two initial syn and syn+ack packets follow the classic
> forwarding path. Therefore, the FORWARD chain in your example above is
> evaluated only for the two initial packets of the TCP connection.
>
> You should add the 'flow add' rule at the bottom of your ruleset in
> your example above.

good to know, so flowtable does always "accept" matching packets (here all=
 udp/tcp), right?
and final foward-policy does neyer hit if flowtable condition matches.

regards Frank
