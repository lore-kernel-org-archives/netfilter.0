From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables 0.9.2 | flow table] check whether it works?
Date: Sun, 22 Mar 2020 14:18:52 +0000
Message-ID: <41317d5f-a0b4-da4e-356b-45cf7677cf15@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584886742;
        bh=EwEVnJ81mn54kyVcKaokKREPW7yfoShsPWeDDNNus3g=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=Yn873LIYyefOqIR6+8j/F1+rQKSGw7TUjpOOgb+6M6AFifHlcvjNiVwKbBHx37Pau
         f90jMn8lG2Z/ieFXugUU/685WEkbsRdctFJeJKwko0J7bWof6zJ9pCS5GbyOoOV6FR
         P6pqqWvnPSVrpyjd2OHQuoRl3ar+O3KeykdzeIfM=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

How it is possible to check whether flowtable offloading actually works?

Can the populated flowtables somehow be dumped / observed / monitored?

If not mistaken the conntrack table would exhibit the [OFFLOAD] label
but observing the conntack table it does not show such label.

Reading https://lwn.net/Articles/738214/:

> Patch 5/5 Switches and NICs come with built-in flow table, I've been
>    observing out of tree patches in OpenWRT/LEDE to integrate this into
>    Netfilter for a little while. This patch adds the ndo hooks to
>    populate hardware flow table.

This node running OpenWrt with Marvell Armada 385 88F6820 (that
supposedly features Accelerated Data Path) with integrated NIC plus an
onboard Marvell 88E6176 switch, latter driven by DSA, I am wondering
whether flowtables offloading is even expected to work in such setup?

