From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: RE: libnftnl vlan type filter
Date: Tue, 7 Jul 2020 07:53:28 +0000
Message-ID: <VI1PR06MB463989A099199212CD894CEAC5660@VI1PR06MB4639.eurprd06.prod.outlook.com>
References: <VI1PR06MB4639357B62CE26537FF54FE6C56A0@VI1PR06MB4639.eurprd06.prod.outlook.com>
 <20200704002847.GA1529@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0OMEPuYUN9AzeSFPGkp0Mbt9yHGRs73/BENgBIC7Mc=;
 b=GwgpN6sOPhSjvObG3/znhg4ffd5noWgl4/DHYNLaKVJW9INgFBudSZpwodP2LWH+7GXbp/WZdtuzG1qEm2HR4wKOCxiMMqkGCnknEWAPGkxbkvisHxOIPeRZkeUJHNyfbdY5Xe8o3j0Wco+l3VwNCtvoxID+wtDQrGqHlM75JQI=
In-Reply-To: <20200704002847.GA1529@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

First of all thanks a lot for your comments.

The offset I managed to figure out by looking at the netlink debug printout=
 when adding the corresponding rule (add rule netdev filter in vlan type 0x=
88ba).
nft --debug=3Dnetlink add rule netdev filter in vlan type 0x88ba
netdev filter in
  [ meta load iiftype =3D> reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 2b @ link header + 12 =3D> reg 1 ]
  [ cmp eq reg 1 0x00000081 ]
  [ payload load 2b @ link header + 16 =3D> reg 1 ]
  [ cmp eq reg 1 0x0000ba88 ]

What I meant by offsetof() is which struct do I need to use to get the corr=
ect offset. Similar to like offsetof(struct iphdr, protocol) it would be ni=
ce to have e.g offsetof(struct XX, vlan).

I added a counter to my rule and it seems to match the packets correctly.

table netdev filter {
        chain in {
                type filter hook ingress device pru10 priority 0; policy ac=
cept;
                iiftype ether @ll,96,16 33024 @ll,128,16 35002 counter pack=
ets 387948 bytes 43450176   <- done via libnftnl
                vlan type 0x88ba counter packets 62428 bytes 6991936    <- =
done with #nft add rule netdev filter in iiftype ether @ll,96,16 33024 @ll,=
128,16 35002 counter
        }
}

Any idea why #nft list ruleset shows the two identical rules differently?

Thanks a lot.

BR
Andy


On Fri, Jul 03, 2020 at 06:45:45AM +0000, Andreas Hoefler wrote:
> Hi
> I am trying to use libnftnl to construct this:
>
> table netdev filter {
>         chain in {
>                 type filter hook ingress device pru20 priority 0; policy =
accept;
>                 vlan type 0x88ba
>         }
> }
>
> I do :
>     add_meta(r, NFT_META_IIFTYPE, NFT_REG_1);
>     uint32_t iiftype =3D 1;
>     add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &iiftype, sizeof(iiftype));
>
>     add_payload(r, NFT_PAYLOAD_LL_HEADER, NFT_REG_1, 12, sizeof(uint16_t)=
);
>     uint16_t vtype =3D htons(ETH_P_8021Q);
>     add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &vtype, sizeof(vtype));

Is your offset (in bytes) correct?

>     add_payload(r, NFT_PAYLOAD_LL_HEADER, NFT_REG_1, 16, sizeof(uint16_t)=
);
>     uint16_t et =3D htons(0x88ba);
>     add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &et, sizeof(et));
>
> This produces the following rule
> table netdev filter {
>         chain in {
>                 type filter hook ingress device pru20 priority 0; policy =
drop;
>                 iiftype ether @ll,96,16 33024 @ll,128,16 35002
>         }
> }
> When I manually add the constructed rule:
> #nft add rule netdev filter in iiftype ether @ll,96,16 33024=20
> @ll,128,16 35002
>
> then nft list ruleset translates it correctly so I assume that this rule =
is built right:
>
> table netdev filter {
>         chain in {
>                 type filter hook ingress device pru20 priority 0; policy =
drop;
>                 iiftype ether @ll,96,16 33024 @ll,128,16 35002 <- constru=
cted with code above
>                 vlan type 0x88ba <- manually added,  same rule as above b=
ut translated ok
>         }
> }
>
> My questions:
> - What are the correct enums to use for e.g iiftype =3D1;?

ARPHRD_ETHER

> - Is there something like offsetof(struct ???, vlan) which I could use in=
stead of hardcoded offset?

man 3 offsetof

> - Why does list ruleset show the coded rule differently from the manually=
 added one?

Is your bytecode matching packets? Probably adding a counter would allow yo=
u to check for this.

> - uint16_t vtype =3D htons(ETH_P_8021Q); seems weird to use htons here, i=
s there another enum I should use?

You can use --debug=3Dnetlink to display the bytecode that nft
generates:

# nft --debug=3Dnetlink add rule x y vlan type 0x88ba ip
  [ meta load iiftype =3D> reg 1 ]
  [ cmp eq reg 1 0x00000001 ]
  [ payload load 2b @ link header + 2 =3D> reg 1 ]
  [ cmp eq reg 1 0x0000ba88 ]

Error: Could not process rule: No such file or directory add rule x y vlan =
type 0x88ba

Then, compare it with your manually generated bytecode.
