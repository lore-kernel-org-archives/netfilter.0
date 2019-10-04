From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: How can I block all traffic from an IP range, irrespective of
 origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 4 Oct 2019 15:47:12 +0000
Message-ID: <20191004114709.4acfd74f@playground>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
        <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
        <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
        <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
        <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
        <4348ae9d-ac32-2a25-f188-ba1757e03271@thelounge.net>
        <vxVQ_geC0de-PtRw-_W5p_JxT_glE2c_vRrkTcbIyulovhi-WTjSDhII4UsugyF1dViXu9mwHZisBtvv98qmciBLttLUpfrRGFL2HG6AyNE=@protonmail.com>
        <31342b0f-d6a7-15e7-3d02-212d41eaeaad@thelounge.net>
        <aRv1y9lFu7DB0mnYvmBI-qbIv-tsBzoGbAXa3gqQHk11fz87s6KlhVYLv_q9fiMeB9d14NIa2n1QeG6c2FMrF2o92vvkSKpgZMtApOpRT5Q=@protonmail.com>
        <4fc65dba-dff0-4075-6ead-c63cd52efb36@thelounge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.wpi.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMiv4LTtz+Jl+Hd2HPp4xV1sPATU7KovWbB95rxjSpE=;
 b=oqS940lQmovo07ysbXJy1vRX4XnESein364uDLulgHaEK15ULNCDfvr0qEaV5BVABoQiLPsWk9H6yRq9yfS3pz8Bmf3MxEpMdX2P7ZBWiLoMhRfL5Sodq2yvxr6InoAeKJVho59unD/wwtgWOLQpO8E3tspXA9zE9kmSbOlGb5A=
In-Reply-To: <4fc65dba-dff0-4075-6ead-c63cd52efb36@thelounge.net>
Content-Language: en-US
Content-ID: <E65D1F41CD6A094F88E8682D4132820F@namprd22.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 4 Oct 2019 17:10:05 +0200
Reindl Harald <h.reindl@thelounge.net> wrote:

> Am 04.10.19 um 16:28 schrieb Jags:
> >> not sure about nftables but with iptables i would just place the drop
> >> stuff for 123.0.0.0/8 in -t raw PREROUTING because it's before conntra=
ck
> >> and consider place it in a ipset for the case the list becomes longer
> >> because then you have only one rule and a lightning fast hash-lookup n=
o
> >> matter how much entries =20
> >=20
> >=20
> > Yes, I noticed CPU spikes, and removed drop/reject rules immediately. T=
hought I would re-enable these rules only when I run a torrent client.
> >=20
> > So should I just add a new table "raw" (and place this table at the top=
):
> >=20
> > xxxxxxxxx
> > table inet raw {
> >         chain prerouting {
> >                 type filter hook prerouting priority 0; policy accept;
> >                 ip saddr 123.0.0.0/8 counter drop
> >         }
> >         chain output {
> >                 type filter hook output priority 0; policy accept;
> >                 ip daddr 123.0.0.0/8 counter reject
> >         }
> > xxxxxxxxx
> >=20
> >=20
> > Now do I need POSTROUTING chain in there too?
> >=20
> > From Gentoo wiki for Nftables: https://wiki.gentoo.org/wiki/Nftables#Ta=
bles
> >=20
> > "postrouting: This hook comes after the routing decision has been made,=
 all packets leaving the machine hit this hook" =20
> you don't need chains where you don't place rules
>=20
> disclaimer: i use iptables and plan to switch to iptables-nft over the
> long, so nftables may have sbtle different behavior
>=20
> however, it turned out to have way better performance for a big firewall
> setup place as much as possible in "-t mangle PREROUTING" (ct state
> invalid) and "-t raw PREROUTING" because less processing of packets

The top of mangle:PREROUTING is the best place to DROP packets you already =
know you never want to process, route or forward, such as INVALID packets, =
TEST net addresses, and blacklisted public IPs and IP ranges. But remember =
that you might not know all addresses until table filter when NAT is involv=
ed.

>=20
> not sure if "table inet raw" hast the same semantic (before conntrack,
> before routing)" but if it can have a postrouting hook i doubt because
> that's not possible for "-t raw" in iptables given that in this table
> there is no routing decision possible
>=20
> look at the image to get a picture, i can't help with nfstables itself
> https://stuffphilwrites.com/wp-content/uploads/2014/09/FW-IDS-iptables-Fl=
owchart-v2019-04-30-1.png

