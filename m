From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2 | flow table] check whether it works?
Date: Thu, 26 Mar 2020 07:17:12 +0000
Message-ID: <a549d215-7aa6-bc66-d004-a3b504bf2e17@gmx.net>
References: <41317d5f-a0b4-da4e-356b-45cf7677cf15@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1585207045;
        bh=B8UTnTJytkESfTJt0ltHNDYmb+cAuSKtUXOqTXS+TxY=;
        h=X-UI-Sender-Class:Reply-To:Subject:From:To:References:Date:
         In-Reply-To;
        b=Aq9zJTuoxek5DxZwWd9BBZeUD43TRHUjOSf7vWm39I44LE/kcIBapaBn69QGvQUps
         isUKIbuUJ5Y3pVW8pgduEFalNMRbWyzpe99YC6ZfTw20G6WfePu3NouH538QDUkb/H
         dFQGQUgkriiwKz8v8iuzhV73AKbv6NNu/D85Pdp4=
In-Reply-To: <41317d5f-a0b4-da4e-356b-45cf7677cf15@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 22/03/2020 14:18, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> How it is possible to check whether flowtable offloading actually works?
>
> Can the populated flowtables somehow be dumped / observed / monitored?
>
> If not mistaken the conntrack table would exhibit the [OFFLOAD] label
> but observing the conntack table it does not show such label.
>
> Reading https://lwn.net/Articles/738214/:
>
>> Patch 5/5 Switches and NICs come with built-in flow table, I've been
>> =C2=A0=C2=A0 observing out of tree patches in OpenWRT/LEDE to integrate=
 this into
>> =C2=A0=C2=A0 Netfilter for a little while. This patch adds the ndo hook=
s to
>> =C2=A0=C2=A0 populate hardware flow table.
>
> This node running OpenWrt with Marvell Armada 385 88F6820 (that
> supposedly features Accelerated Data Path) with integrated NIC plus an
> onboard Marvell 88E6176 switch, latter driven by DSA, I am wondering
> whether flowtables offloading is even expected to work in such setup?
>

There is no way to see/check whether flowtable offloading actually
works, or how to debug it?
