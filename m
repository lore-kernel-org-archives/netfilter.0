From: Jags <TheJags@protonmail.com>
Subject: Re: How can I block all traffic from an IP range, irrespective of origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 04 Oct 2019 10:44:46 +0000
Message-ID: <lqTerZeIk1-StNEHFttel8WGdgNfa6b5P96z7iC6sT03SK29Q1_hc4KUlqd3R4f8Hdka3B_MJfQILp1Wa65JpA_cW7k2XGZtvfaN5ADlBzY=@protonmail.com>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
 <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
 <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
 <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
Reply-To: Jags <TheJags@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570185891;
        bh=z+n3lWECHWTkE5jg1+JewY9o/SYu2N4gnQWMkGj6P38=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=hGCckHUJCfIAC6stwS74EqTIaJ5CFBY4ISVWllK41aqaKj+mMomYqbJzV2oHCJuYP
         AAibybadTV8nL9coBY+4Mab9JRBsycqG1iB0XazUCL16RhLuUoHwZefvFsy7NfJi0K
         u4uaJnAq5RBOUDd5eCNlxtS8fnyamEaT0I3T7Q8M=
In-Reply-To: <de499a93-2306-a681-6e2a-2c227250f8f3@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: zrm <zrm@trustiosity.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Should I modify it to the following:

:::
chain output {
                type filter hook output priority 0; policy accept;

                ip daddr 123.0.0.0/8 counter reject  }
:::

and

:::
chain input {
                type filter hook input priority 0; policy drop;

                ip saddr 123.0.0.0/8 counter drop  }
:::


Many thanks.





=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, October 4, 2019 10:18 AM, Reindl Harald <h.reindl@thelounge.net>=
 wrote:

> Am 04.10.19 um 11:45 schrieb Jags:
>
> > @zrm thank you so much for the reply.
> > (1) Would it be something like this:
> > :::::
> > chain output {
> > type filter hook output priority 0; policy accept;
> >
> >                 ip daddr 123.0.0.0/8 ct state established,related,new,i=
nvalid,untracked counter reject
> >     }
> >
> >
> > :::::
> > Because just last night I tried that, but I could still see IPs from th=
e blocked range. Or am I missing something here.
> > Note: In this OUTPUT chain, if I change: "policy accept" to "policy dro=
p", I lose the internet completely.
> > (2) In addition to the OUTPUT chain, I've added this into INPUT chain t=
oo:
> > :::::
> > chain input {
> > type filter hook input priority 0; policy drop;
> >
> >                 ip saddr 123.0.0.0/8 ct state established,related,new,i=
nvalid,untracked counter drop
> >     }
> >
> >
> > :::::
> > So how should I modify the either or both of the above please... many t=
hanks
>
> it's the same as with iptables
>
> "established,related" allows responses and so when your client made a
> connection to a peer data from this peer is allowed back
>
> order matters and there is no point to change the outbound policy to DROP
>
> the policy is applied after all rules and the first mathcing action
> wins, everywhere


