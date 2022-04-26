From: Maximiliano Estudies <maxiestudies@gmail.com>
Subject: Re: using sets as snat targets in nat tables
Date: Tue, 26 Apr 2022 09:38:50 +0200
Message-ID: <CAF358wTYTXz52MMDKceVYMZ7Q=Dqo_5MDJFeu1TwXB4B8Jh3_A@mail.gmail.com>
References: <CAF358wSzMHJQahvxXLofKF-bMc-xev10xjPbGCcZSpie1BMQhQ@mail.gmail.com>
 <875ymxkq02.fsf@alfa.kjonca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=KEzJ2lsXGSq7SxprKvq2D83NeLLCyftT/VXo+wHkiB8=;
        b=h917MUz6ij1FkX8k6OCklXMeX+OgwRRW7Wa2Twb7wNmEzIcSFKw7ye72bp8l4PWNKN
         IsPgatLWalxb/Q6WnAQIQSYIeAxrQdavW9HHQ1t/bflnxnPCjk2lMqGDvCN9TmwGXp2U
         xRsTRCg0nRO+fjvzO8dJ4S63hLGtKqOy2fRDhCwLBGEWk4MFgu0gU7yNcQVrz/Mx38tK
         saHktSS/91wH0SaIktZ532DlvXE6iDfvLKdyf3ziQn8SXQAqgBL5jDXGazZeFFAq4spb
         9ul9nXdJ96wuPHv0InTLYN+1yx23Ysv7Q8HWbAjS3aonv3JPwJBNJCnS9fDuEQhjHJLA
         Q2Gw==
In-Reply-To: <875ymxkq02.fsf@alfa.kjonca>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

El mar, 26 abr 2022 a las 1:33, Kamil Jo=C5=84ca (<kjonca@op.pl>) escribi=
=C3=B3:
>
> Maximiliano Estudies <maxiestudies@gmail.com> writes:
>
> > Hi,
> > I'm trying to use a set as a snat target and failing. This is my config=
:
> >
> > table ip nat { # handle 73
> > set dc-cidr-nat { # handle 3
> > type ipv4_addr
> > flags interval
> > elements =3D { <internal-network> }
> > }
> >
> > set external-ip-net { # handle 4
> > type ipv4_addr
> > elements =3D { <public-ip> }
> > }
> >
> > chain POSTROUTING { # handle 1
> > type nat hook postrouting priority srcnat; policy accept;
> > ip saddr @dc-cidr-nat oif "enp1s0f0" snat to @external-ip-net comment
> > "internet gateway" # handle 7
> > }
> >
> > This fails wtth "Error: syntax error, unexpected string, expecting ll
> > or nh or th". Using an anonymous set doesn't work either, but hard
> > coding the <external-ip> does. I can't find any hint in the wiki if
> > sets are allowed in this context.
>
> Set can have 0 elements or more than 1. What your poor computer should
> do in these cases? where it should snat to?
>
> IMO you shoould use kind of map:
> table ip nat {
>
>         map dhcp_snat {
>                 type iface_index : ipv4_addr
>         }
>
>         set dhcp_ifaces {
>                 type iface_index
>         }
>
>
>         chain POSTROUTING {
>                 type nat hook postrouting priority srcnat; policy accept;
>                 oif @dhcp_ifaces rt ipsec missing snat to oif map @dhcp_s=
nat
>         }
>
> }
>
> here, when dhcp script put
>   { "wlan0" } into dhcp_ifaces
>   and
>    { "wlan0" : 192.168.1.1 } into dhcp_snat
> traffic outgoing via wlan0 will be snat-ed to 192.168.1.1
> KJ
>
>
> --
> http://wolnelektury.pl/wesprzyj/teraz/

Thanks for you answer Kamil! Your proposed solution is very elegant. I
didn't know that sets can be empty and asumed that if the set > 1 the
addresses would be treated as a pool. I'm rendering the config with a
config management tool that doesn't supports maps in the nftables
module, I'll try to extend it.
