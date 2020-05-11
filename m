From: =?UTF-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>
Subject: Re: [Help] Allow website using iptables
Date: Mon, 11 May 2020 17:20:58 +0700
Message-ID: <CAByCkvp30Pcb3ZfNUQ54mcBZ9HnhYqEJ0R3KZDQM+6_hzNQw7w@mail.gmail.com>
References: <CA+u3GuKsm8o1nv_iJ6kSYHWzrfgCpZsVZKbDq4FmnuCFwOL3BQ@mail.gmail.com>
 <3EDC495D-8AD1-4687-8496-B17E3CCEB158@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=IvPhHcsX4gXes6QYpvH/CszuTmgDtxXEEz6xT5NlcCk=;
        b=jRnPEohuvpHZW1hbca+RqgVZ0iEPl+XLIZiRzTHsZA/J7+r6DZpI3OkngekEuofbj3
         6qQ7ZBBbU/tO1/cij19/fhmhY/imt9uv6PLxjuAqYbhT90n7RE+GklnhcOfhbBrJdgT+
         NflRg9mxCxo5AAd7Q1J++SYV0WM8e2kNV8xG9B0IEce1OYukS1SWdDpyd/a4TdsqYIlb
         HDTdPeWmOIzZaRh50M51i4g8z0bV479/U9RMsIJ01pI00AXD3/uhXIcUWmHPXg/VjDQ5
         atRFqI2H8SAb9MJsAVjoYQ4p3GhFPZi2IkK9pTnnSyPbYcp00nAA+qlvRB9eCwF+2FdX
         MPpQ==
In-Reply-To: <3EDC495D-8AD1-4687-8496-B17E3CCEB158@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

hi,
Do you guys have any idea to allow a certain website with a specific
MAC address ?
Thanks.

V=C3=A0o Th 2, 4 thg 5, 2020 va=CC=80o lu=CC=81c 21:00 John Haxby
<john.haxby@oracle.com> =C4=91=C3=A3 vi=E1=BA=BFt:
>
>
>
> > On 4 May 2020, at 09:54, Lazuardi Nasution <mrxlazuardin@gmail.com> wro=
te:
> >
> > YouTube use SSL. So you can't match strings inside the packet, it is
> > encrypted.
>
> Actually, in most cases you can: the first packet set will usually have t=
he hostname in the SNI extension header.
>
> jch
