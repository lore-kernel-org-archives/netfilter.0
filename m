From: Jags <TheJags@protonmail.com>
Subject: Re: How can I block all traffic from an IP range, irrespective of origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 04 Oct 2019 16:25:42 +0000
Message-ID: <gqJSE9iGsixrV5lbpV2VVj_N-pdkB59YlfOJlH-VsKhUYHsgXJ2MlY62LPso375cRc0k2X4tXD7744rB6UYKqeJGA-KB6AmpqnBpvlvsmTE=@protonmail.com>
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
Reply-To: Jags <TheJags@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570206344;
        bh=ePsP4Bi1yz5fFpX1QhJuoCN35viRKw02iNbQ7SzRJEo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=dDfXpH/IduySiQzX7mnCP3mYcFJTJ5uKcYEPt6rwDp1GebKOpX+g4s4V3Dm/F2PSF
         eVRN2CLhxghF98pXcuk/s9CMbFn6qWOjONg8cq7mUDJpowhuKQXpnzMJgLvtx2VauJ
         7zWapeeCLJKhimmoFPx2EF/bnq2MUKWlSz+0N3YA=
In-Reply-To: <4fc65dba-dff0-4075-6ead-c63cd52efb36@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "neal.p.murphy@alum.wpi.edu" <neal.p.murphy@alum.wpi.edu>

Could someone please clarify RAW/MANGLE tables in regards to Nftables.

I could not find any details in Nftables wiki specifically for RAW/MANGLE t=
ables. While I find Gentoo wiki for Nftables much more friendlier: https://=
wiki.gentoo.org/wiki/Nftables#Tables

xxx
Tables: A table is nothing more than a container for your chains. With nfta=
bles there are no predefined tables (filter, raw, mangle...) anymore. You a=
re free to recreate an iptables-like structure, but anything might do.

Currently there are 5 different families of tables: ip, ip6, arp, bridge, i=
net
xxx

My question is, since Nftables doesn't have predefined tables, just by nami=
ng a table: "table inet raw", does it becomes a RAW table or not? If not, w=
hat do I have to do?

I thank you all so much.


For now I have added this to my nftables.conf

xxxxx
table inet raw {
        chain prerouting {
                type filter hook prerouting priority 0; policy accept;
                ip saddr 123.0.0.0/8 counter drop
          }
        chain output {
                type filter hook output priority 0; policy accept;
                ip daddr 123.0.0.0/8 counter reject
         }
}
xxxxx








=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, October 4, 2019 3:10 PM, Reindl Harald <h.reindl@thelounge.net> =
wrote:

> Am 04.10.19 um 16:28 schrieb Jags:
>
> > > not sure about nftables but with iptables i would just place the drop
> > > stuff for 123.0.0.0/8 in -t raw PREROUTING because it's before conntr=
ack
> > > and consider place it in a ipset for the case the list becomes longer
> > > because then you have only one rule and a lightning fast hash-lookup =
no
> > > matter how much entries
> >
> > Yes, I noticed CPU spikes, and removed drop/reject rules immediately. T=
hought I would re-enable these rules only when I run a torrent client.
> > So should I just add a new table "raw" (and place this table at the top=
):
> > xxxxxxxxx
> > table inet raw {
> > chain prerouting {
> > type filter hook prerouting priority 0; policy accept;
> > ip saddr 123.0.0.0/8 counter drop
> > }
> > chain output {
> > type filter hook output priority 0; policy accept;
> > ip daddr 123.0.0.0/8 counter reject
> > }
> > xxxxxxxxx
> > Now do I need POSTROUTING chain in there too?
> > From Gentoo wiki for Nftables: https://wiki.gentoo.org/wiki/Nftables#Ta=
bles
> > "postrouting: This hook comes after the routing decision has been made,=
 all packets leaving the machine hit this hook"
>
> you don't need chains where you don't place rules
>
> disclaimer: i use iptables and plan to switch to iptables-nft over the
> long, so nftables may have sbtle different behavior
>
> however, it turned out to have way better performance for a big firewall
> setup place as much as possible in "-t mangle PREROUTING" (ct state
> invalid) and "-t raw PREROUTING" because less processing of packets
>
> not sure if "table inet raw" hast the same semantic (before conntrack,
> before routing)" but if it can have a postrouting hook i doubt because
> that's not possible for "-t raw" in iptables given that in this table
> there is no routing decision possible
>
> look at the image to get a picture, i can't help with nfstables itself
> https://stuffphilwrites.com/wp-content/uploads/2014/09/FW-IDS-iptables-Fl=
owchart-v2019-04-30-1.png


