From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] packet (filtering) flow NIC vs. PPPoE?
Date: Mon, 28 Sep 2020 21:35:00 +0000
Message-ID: <dd201d62-d014-e9e3-254b-f7644bc759d7@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601328901;
        bh=8bj+DNNNqdBWngf7dtPrlm0EVmIjtA9JlzaBFm3VzGw=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=TSiOEGwFcc/F2mk7ZwE3UkhPjh8xUMyuHG30sth69SqGXbd8V+xU+AfO2Ni9jdu11
         Eg3H17afQnme4OI4HvneffBfeYdI5G/Nd631DJJMiMnVu3NQMd3CMU7JS9N2ucR+cf
         2IPLTXQ2Z1rGdter9vcnv1rAYPelKo8Bgv/zx4XA=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Whilst testing NFTables's flow offload on a node with a PPPoE subscriber =

line it turned out that the flow offload happens with the NIC netdev and =

not (as I expected) the virtual PPPoE netdev.

Just for reference this being the NFT config (eth2 being the NIC)

flowtable fte=C2=A0=C2=A0=C2=A0 {
 =C2=A0 hook ingress priority -100
 =C2=A0 devices =3D { eth2 }
 =C2=A0 counter
}

ip protocol { 6, 17 } flow add @fte;
ip6 nexthdr { 6, 17 } flow add @fte;


Why would the packet filtering have to take place on the PPPoE netdev=20
but the flowatable happens with the NIC instead?





