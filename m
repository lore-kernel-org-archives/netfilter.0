From: Jags <TheJags@protonmail.com>
Subject: Re: How can I block all traffic from an IP range, irrespective of origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 04 Oct 2019 12:21:51 +0000
Message-ID: <vxVQ_geC0de-PtRw-_W5p_JxT_glE2c_vRrkTcbIyulovhi-WTjSDhII4UsugyF1dViXu9mwHZisBtvv98qmciBLttLUpfrRGFL2HG6AyNE=@protonmail.com>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
 <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
 <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
 <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
 <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
 <4348ae9d-ac32-2a25-f188-ba1757e03271@thelounge.net>
Reply-To: Jags <TheJags@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570191718;
        bh=Hs50Z9Vcb5sfj7Cx3hT9dleGkhxtQK/r6Pp1oERWa88=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=OcikFWiyQxplS53sLn0AfA0mNGt4UVrnRxNK74mA1xjvQbZkjVVReJk3opaYWpCuH
         ZdBG0aat3SseQBzW6h0hkqOb6tYPLCMtMzWPeh74HbpkvHj98Xu9QLBc7mvIAwivc6
         iyA5hrXB2mMNP3VDLpx6Zz1L36vLToFpBxmR1uJQ=
In-Reply-To: <4348ae9d-ac32-2a25-f188-ba1757e03271@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thank you so much.

Now do I need to have OUTPUT chain before INPUT chain? 'Coz all the example=
s I've seen so far had INPUT as the first chain.

Side question: Does order of the chains or tables matter... like on other P=
C, I have "table inet nat" with chains "prerouting/postrouting".


Here's my complete nftables.conf:


xxxxx
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
        chain input {
                type filter hook input priority 0; policy drop;

                iifname lo accept

--->            ip saddr 123.0.0.0/8 counter drop

                # Early drop of invalid connections
                ct state invalid drop
                ct state established,related accept

                # ICMP & IGMP
                ip saddr 192.168.0.0/16 icmp type echo-request counter acce=
pt
                icmp type echo-request counter drop
                ip protocol igmp drop

                # ssh for internal network
                ip saddr 192.168.0.0/16 tcp dport 22 counter accept

                # Avoid brute force on ssh
                tcp dport 22 ct state new limit rate 10/minute accept

                # VsFTPD
                ip saddr 192.168.0.0/16 tcp dport 20 counter accept
                ip saddr 192.168.0.0/16 tcp dport 21 counter accept
                ip saddr 192.168.0.0/16 tcp dport 990 counter accept
                ip saddr 192.168.0.0/16 tcp dport 40000-50000 counter accep=
t

                ct state new drop
                # Everything else
                drop

                log flags all counter drop
                log prefix "[nftables] Input Denied: " flags all counter dr=
op
    }
        chain output {
                type filter hook output priority 0; policy accept;

--->            ip daddr 123.0.0.0/8 counter reject
    }
}
xxxxx






=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, October 4, 2019 11:05 AM, Reindl Harald <h.reindl@thelounge.net>=
 wrote:

> Am 04.10.19 um 12:44 schrieb Jags:
>
> > Should I modify it to the following:
> > :::
> > chain output {
> > type filter hook output priority 0; policy accept;
> >
> >                 ip daddr 123.0.0.0/8 counter reject  }
> >
> >
> > :::
> > and
> > :::
> > chain input {
> > type filter hook input priority 0; policy drop;
> >
> >                 ip saddr 123.0.0.0/8 counter drop  }
> >
> >
> > :::
>
> surely, and that on top of the ruleset before any accept-rule, there is
> no point to mention "ct state" when you just want to block communication
> from and to a ip unconditionally


