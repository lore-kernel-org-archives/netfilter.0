From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: [Help] Allow website using iptables
Date: Mon, 11 May 2020 07:48:13 -0400
Message-ID: <CAHEKYV5hraKjimpNu1vOPP=rjKMYGs9yypvEg-jVyD8LLH8iTQ@mail.gmail.com>
References: <CA+u3GuKsm8o1nv_iJ6kSYHWzrfgCpZsVZKbDq4FmnuCFwOL3BQ@mail.gmail.com>
 <3EDC495D-8AD1-4687-8496-B17E3CCEB158@oracle.com> <CAByCkvp30Pcb3ZfNUQ54mcBZ9HnhYqEJ0R3KZDQM+6_hzNQw7w@mail.gmail.com>
 <4dbf6222-2ead-d2b5-68db-cdd49028b6ef@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u1IhtBwbEMFD3p8qMAqVshkhqso1Xam+HNdAG6tC0Rg=;
        b=HfpVwIra2nRAPFGP5v6AXHPy79SaB4mGdM4uR8oFrqZD6Vg/QVmggVrl8nrOvSBL2e
         GCXBgWQM0C6isp2FwRPyeCPw6B0Q8uqtvOlkwaUt1SBSyVJ9u7nxXfRiYS3Glv89jaEr
         oxBesZ1lYTKfHPP9iRcW0ABAnmQx6oS4NIXgXeuZ4eW/TWHyEoIUvwcGnTlAolf44xNV
         IJoO0XmJKmBLr/yJgyiHNdBMMvcgfpervewIYhRwXI6QQD223BlhL4jJ3o1Tk6pVRDvo
         GGXXTmrIPWDHFbs7JuJptFvVe7KFvSnIXpu6/bQ1F0olWpeZFlulIP5CQXUtBXhHRStU
         Kbvw==
In-Reply-To: <4dbf6222-2ead-d2b5-68db-cdd49028b6ef@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: =?UTF-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>, Netfilter <netfilter@vger.kernel.org>

On Mon, May 11, 2020 at 7:36 AM Reindl Harald <h.reindl@thelounge.net> wrot=
e:
>
>
>
> Am 11.05.20 um 12:20 schrieb S=C6=A1n =C4=90=E1=BB=97:
> > Do you guys have any idea to allow a certain website with a specific
> > MAC address ?
>
> that's not how the ip layer works
> you don't have any MAC adress after a router
>
      What I read is that he wants to have an egress rule to block a
computer behind his router (private network) to reach youtube. If the
computer is in the same broadcast domain as the router, his request is
valid. I guess offending computer uses DHCP and he is looking for a
solution that accounts for that and expects user knows nothing about
MAC spoofing.

> don#t get me wrong but you need to learn the absolute basics about
> networking: https://en.wikipedia.org/wiki/OSI_model
>
> > V=C3=A0o Th 2, 4 thg 5, 2020 va=CC=80o lu=CC=81c 21:00 John Haxby
> > <john.haxby@oracle.com> =C4=91=C3=A3 vi=E1=BA=BFt:
> >>
> >>
> >>
> >>> On 4 May 2020, at 09:54, Lazuardi Nasution <mrxlazuardin@gmail.com> w=
rote:
> >>>
> >>> YouTube use SSL. So you can't match strings inside the packet, it is
> >>> encrypted.
> >>
> >> Actually, in most cases you can: the first packet set will usually hav=
e the hostname in the SNI extension header
