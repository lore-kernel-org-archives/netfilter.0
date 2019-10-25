From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: Re: understanding my MASQURADING and SNAT problem
Date: Fri, 25 Oct 2019 01:17:39 +0100
Message-ID: <CANkmNDdGqbU4BU+v-Fvnh88ji5LcbpMBuVF8hE8_st8Un7Sf7A@mail.gmail.com>
References: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
 <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com> <CANkmNDdnBB92niurKFGojdpUi8_wwLFooUWZmYQijMK5Vn1LvA@mail.gmail.com>
 <d3dbd5e3-3d3a-36b7-1552-4af71586a6ba@trustiosity.com> <CANkmNDdOVO4xfZbvRLr6pH-yPg=wgeJ8ZbPwK7ChT5cDabt1Xw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNhlcxnsdZj1FKNRBo5yG1UDxK4/rEGANH7S65ecj7Q=;
        b=HryoXV9DCfbsicK45if5yIsEPyAihLJj2OK50Oc5KnbTyP+IkvA5ZacAdBZUAJVKEp
         3eMh84norZGgf35Pdz6JvvsrIWjF34AkAHCYZw8/SXj7yDlDRj13RA2gOaYqSraUqTix
         mtfEQ3XbwAN5bMqeZGfUhy7PvDDKtA/dP2mI0lTD1f5/F7XsRDy1sXSe+xG5MIbbXRu1
         JQg6tuz/JHmu1WEDMlEg0ZrJOOnqwD26yakzo9OJic2aEJ7+6+2v9qa4qIKbE10Svxvx
         0cCDXhRvY0xpvqirEwWRpE0G5if9kard5hJ6HxF/et1fEdVQDhvvAjngmlNkvr+hKBBD
         bOwg==
In-Reply-To: <CANkmNDdOVO4xfZbvRLr6pH-yPg=wgeJ8ZbPwK7ChT5cDabt1Xw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zrm <zrm@trustiosity.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 25 Oct 2019 at 00:59, Aaron Gray <aaronngray.lists@gmail.com> wrote:
>
> On Wednesday, 23 October 2019, zrm <zrm@trustiosity.com> wrote:
> >>
> >> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> >> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> >> iptables -A FORWARD -i enp5s5 -j ACCEPT
> >> iptables -P FORWARD DROP
> >>
> >> And then reject the things you actually want to prohibit, e.g.:
> >>
> >> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> >> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> >> iptables -A FORWARD -i enp4s0 -p tcp --dport 25 -j REJECT --comment "no spamming"
> >> iptables -A FORWARD -i enp4s0 -p tcp --dport 80 -j REJECT --comment "no unencrypted HTTP"
> >> iptables -A FORWARD -i enp5s5 -j ACCEPT
> >> iptables -P FORWARD DROP
> >>
> >
> > That should've been this, using the internal interface rather than the external one:
> >
> > iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> > iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> > iptables -A FORWARD -i enp5s5 -p tcp --dport 25 -j REJECT --comment "no spamming"
> > iptables -A FORWARD -i enp5s5 -p tcp --dport 80 -j REJECT --comment "no unencrypted HTTP"
> > iptables -A FORWARD -i enp5s5 -j ACCEPT
> > iptables -P FORWARD DROP
>
>
> Okay I was confused about that.
>
> >
> > Note that this is a strong reason to rename your interfaces to something meaningful instead of using the ugly meaningless default names.
>
>
> Yes I miss eth0 and eth1 !
>
> Many thanks hopefully that clears everything up I suspected I had done
> something stupid. And half suspected I needed to use the filter table.

I did have everything working perfectly then it all stopped working
again and I cannot work out why.

I need to start from scratch again.

Aaron
