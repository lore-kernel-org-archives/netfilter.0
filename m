From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] packet (filtering) flow NIC vs. PPPoE?
Date: Tue, 29 Sep 2020 16:08:00 +0000
Message-ID: <2a9c013c-5589-6b70-ceb3-83541a065726@gmx.net>
References: <dd201d62-d014-e9e3-254b-f7644bc759d7@gmx.net>
 <20200929150622.GA30270@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601395691;
        bh=avO31Hr7Iaj6/qI84CcIqj4IPi9iZTSdfsvLXxJxij4=;
        h=X-UI-Sender-Class:Reply-To:To:Cc:References:From:Subject:Date:
         In-Reply-To;
        b=ZoT8Th/zgYwpnXiszzizoSxrhCxdVHuNzJh38gmO7Goyq43ChqzhfS4iDBvYZeNrL
         uAv9AklEDsfKagbYo0GkgkaswkcQKEWwkeNmsYNgNwUIumV9kig8DRdW4urZjnzw+i
         DfmDffD+M0ZgCj7WvMoxPgLjYxq6S1edT1An77/8=
In-Reply-To: <20200929150622.GA30270@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 29/09/2020 17:06, Pablo Neira Ayuso wrote:
> On Mon, Sep 28, 2020 at 09:35:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> Whilst testing NFTables's flow offload on a node with a PPPoE subscrib=
er
>> line it turned out that the flow offload happens with the NIC netdev a=
nd not
>> (as I expected) the virtual PPPoE netdev.
>>
>> Just for reference this being the NFT config (eth2 being the NIC)
>>
>> flowtable fte=C2=A0=C2=A0=C2=A0 {
>>  =C2=A0 hook ingress priority -100
>>  =C2=A0 devices =3D { eth2 }
>>  =C2=A0 counter
>> }
> Could you describe your testbed?

The node being a router that may or may not (travelling) be on a xDSL=20
PPPoE subscriber line, which needs a bit of working around since nft=20
fails to init if the PPPoE netdev is in the config (netdev famility a/o=20
flowtable) but absent from the OS. For that purpose the workflow being:

* nft main conf file sans PPPoE (netdev famility a/o flowtable) when=20
booting the node
* loading a supplementary nft conf file in the event of PPPoE being up=20
with just PPPoE stanza for netdev and flowtable

Then monitored the logs about the flow offload and seen only entries for =

flow offloads with the NIC but not PPPoE.

I suppose supplementing the main conf file is not such a good idea. Now=20
I copied the main conf file and added the PPPoE parts and getting that=20
file loaded in the event of PPPoE being up. Since then the logs showing=20
the offload with PPPoE working.

>
>> ip protocol { 6, 17 } flow add @fte;
>> ip6 nexthdr { 6, 17 } flow add @fte;
> You can consolidate this rule with:
>
>    meta l4proto { tcp, udp } flow add @fte;

Thank you for the hint.

>
> You might also want to use the existing protocol definitions, instead
> of numeric protocols to make your ruleset more readable.
>
>> Why would the packet filtering have to take place on the PPPoE netdev =
but
>> the flowatable happens with the NIC instead?
> What would you like to achieve with the flowtable?


