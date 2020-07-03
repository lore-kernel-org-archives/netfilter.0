From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: libnftnl vlan type filter
Date: Fri, 3 Jul 2020 06:45:45 +0000
Message-ID: <VI1PR06MB4639357B62CE26537FF54FE6C56A0@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachipowergrids.onmicrosoft.com;
 s=selector1-hitachipowergrids-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU+khy8NKsTIkJx7UoVufytQEl8BJie59C+jAY3O660=;
 b=aeeDGweKSgw2qWSucf8FP2hUyybzdgK7Xpx44k8ZUB0ZA9LwSNn4uKuKkRYe51+WE8LNxEN7quBEereGSICfu8WA9uDTKo+AN2FUbDODJ3zEs9Lox+Xl1HO60Qb+0eukQQSuMGZtU+hunNTOcyqA6IUYNd37Kt9f14F2I8MgH4w=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>

Hi=20
I am trying to use libnftnl to construct this:

table netdev filter {
        chain in {
                type filter hook ingress device pru20 priority 0; policy ac=
cept;
                vlan type 0x88ba
        }
}

I do :
    add_meta(r, NFT_META_IIFTYPE, NFT_REG_1);
    uint32_t iiftype =3D 1;
    add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &iiftype, sizeof(iiftype));

    add_payload(r, NFT_PAYLOAD_LL_HEADER, NFT_REG_1, 12, sizeof(uint16_t));
    uint16_t vtype =3D htons(ETH_P_8021Q);
    add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &vtype, sizeof(vtype));

    add_payload(r, NFT_PAYLOAD_LL_HEADER, NFT_REG_1, 16, sizeof(uint16_t));
    uint16_t et =3D htons(0x88ba);
    add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &et, sizeof(et));

This produces=A0the following rule
table netdev filter {
        chain in {
                type filter hook ingress device pru20 priority 0; policy dr=
op;
                iiftype ether @ll,96,16 33024 @ll,128,16 35002
        }
}
When I manually add the constructed rule:
#nft add rule netdev filter in iiftype ether @ll,96,16 33024 @ll,128,16 350=
02

then nft list ruleset translates it correctly so I assume that this rule is=
 built right:

table netdev filter {
        chain in {
                type filter hook ingress device pru20 priority 0; policy dr=
op;
                iiftype ether @ll,96,16 33024 @ll,128,16 35002 <- construct=
ed with code above
                vlan type 0x88ba <- manually added,  same rule as above but=
 translated ok
        }
}

My questions:
- What are the correct enums to use for e.g iiftype =3D1;?
- Is there something like offsetof(struct ???, vlan) which I could use inst=
ead of hardcoded offset?
- Why does list ruleset show the coded rule differently from the manually a=
dded one?
- uint16_t vtype =3D htons(ETH_P_8021Q); seems weird to use htons here, is =
there another enum I should use?

Any help is highly appreaciated.
BR
Andy

