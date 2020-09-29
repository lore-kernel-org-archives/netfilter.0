From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] packet (filtering) flow NIC vs. PPPoE?
Date: Tue, 29 Sep 2020 11:23:00 +0000
Message-ID: <4e30f3b0-6e34-4957-62e9-898d8984fce0@gmx.net>
References: <dd201d62-d014-e9e3-254b-f7644bc759d7@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601379029;
        bh=L/oSYtoU/pSYF4OuPQk3nzquX3psHjN7/hv1ffzIL4A=;
        h=X-UI-Sender-Class:Reply-To:From:To:References:Subject:Date:
         In-Reply-To;
        b=gdZY9FGydtSAB0VWD3LRWDO3bCaHsi6CeQyHN/+GtltODx4pt/crPVfWzSaa9H68E
         0bC9dH6SUxYAiWNof+S2GfoENXMPKHbG+fj/p1MmyA9YCUHRiBgo42FApxz0+XT/8T
         u57JLKWZwMqa/f9CsZWgI2ozbYrCUvPicQrfESfg=
In-Reply-To: <dd201d62-d014-e9e3-254b-f7644bc759d7@gmx.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 28/09/2020 23:35, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> Whilst testing NFTables's flow offload on a node with a PPPoE=20
> subscriber line it turned out that the flow offload happens with the=20
> NIC netdev and not (as I expected) the virtual PPPoE netdev.
>
> Just for reference this being the NFT config (eth2 being the NIC)
>
> flowtable fte=C2=A0=C2=A0=C2=A0 {
> =C2=A0 hook ingress priority -100
> =C2=A0 devices =3D { eth2 }
> =C2=A0 counter
> }
>
> ip protocol { 6, 17 } flow add @fte;
> ip6 nexthdr { 6, 17 } flow add @fte;
>
>
> Why would the packet filtering have to take place on the PPPoE netdev=20
> but the flowatable happens with the NIC instead?
>

Is this perhaps due to:

nft_flow_offload -> NDO hook

utilising the NIC's hardware flow tables?=C2=A0 If so how is the NIC's=20
flow-table capability transparent to the user, querying the NIC with=20
ethtool for 'flow' does not produce anything.

