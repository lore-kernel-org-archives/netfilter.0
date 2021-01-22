From: Younwook Jang <younwook@gmail.com>
Subject: Re: Use case of nftables + Linux combination as network firewall
Date: Sat, 23 Jan 2021 00:46:40 +0900
Message-ID: <CAEx-Y1-ESE7DSbaCbS3eiBKwCjK7qryrUc_CPAU4gaRkdokG_Q@mail.gmail.com>
References: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
 <636ad821-67fe-d28c-8a55-47fbf00877bc@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vK9X79DJqMm6izjbnUtGguC9i7bCimXur+LrdgTL8jo=;
        b=G6nx1Y/9IcnfbVpxx9BUP9EPKtRqOHct73Y+2mzAXVFXV0WA6nQdPyDRi1lxAKlSNK
         P8nXoR3gClnIcWsnn7+d1D/eKBD7Csh/UEvCZbfr/OUdrn/a+Hw0og7dIaA8gtFIZr38
         JRcLo/Uy7w35cmiWBEYpoI61RiJdqQRD0taezb8x8VF7lb6RFAhS1news1g3XmVFO1dC
         mK7+8G3fCmg3ri3qAJXybtZXB+X4a+eG7wdoy0UHeTA4lZcRIu174w37lK2vmB/ttUPp
         F2b6buycXWu5vHqWLI7P7ykbMbpm9Rr471P7//u5Qz3nRmuPeHeDnnKj6jVYPY3W1E8e
         rhCw==
In-Reply-To: <636ad821-67fe-d28c-8a55-47fbf00877bc@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org

Hi Reindl, thank you for your advice.

I'm looking reference case of the company or organizations that is
using Linux+nftables as network firewall.

Is there any good reference...?

thanks, regards.

2021=EB=85=84 1=EC=9B=94 22=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 11:27, =
Reindl Harald <h.reindl@thelounge.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
>
>
> Am 22.01.21 um 14:31 schrieb Younwook Jang:
> > Dear netfilter users,
> >
> > I'm looking that real reference case that uses nftables+Linux server
> > as network firewall.
> >
> > Would you please share reference cases or related information ?
> >
> > I think that Linux VM with well-configured nftables can be act as
> > network firewall especially cloud environment.
> >
> > Please share your advice
>
> it's exactly the same as you do for INPUT with iptables/nftables but in
> the FORDWARD chain
>
> on the pure network layer without inspecting content every middlebox you
> can buy does exactly the same and in many cases is just using linux +
> iptables
