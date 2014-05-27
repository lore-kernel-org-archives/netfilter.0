From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Netlink Events for iptables
Date: Tue, 27 May 2014 10:58:52 +0200
Message-ID: <CAOkSjBint-ej-45+M-OnuynVrJBu3+ueAQqG_kpYNyXNA4VK9A@mail.gmail.com>
References: <20140527083359.GA4342@localhost> <3f8093c4086d408c962d352879ff3c43@BLUPR03MB407.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=8jP1mOB4vRReOCr1h3Vh3R/pNMxmXVYZAw9pSmyL2Gc=;
        b=UzYSvyITfNDu+/4x0nzOQ5NBbo25Z2tJPbEyMHsvASi8XT05AlJi8xm5gBtLscrFdw
         80gIuSRMlonVN2XlFCPqKkj+8RtCvj4Lw3Iy3UPvE5HGlkeQ4W0pjGnXO1fuCEgit3PO
         4rJi61bT6uphg/i5d7m2voHtn/QPWItd+SeqG7+Kig/R+0VEERLQPyIl7ksaWLOC5dOk
         Jp63CiKOE4th3am8JHYvULcwXEdUBNR3VALFJmjUmgSWXl9yoNtzuAERncvZZjnInrC1
         Gdz1pbj5UdIBAvpTln3zWuM9P2c9mK/4gEjpsw5KlhKXSkC/p6XaATyI6inY+Vg85ReE
         Pv+w==
In-Reply-To: <3f8093c4086d408c962d352879ff3c43@BLUPR03MB407.namprd03.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: "vivek.reddykadaru@freescale.com" <vivek.reddykadaru@freescale.com>
Cc: netfilter <netfilter@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>

On 27 May 2014 10:52, vivek.reddykadaru@freescale.com
<vivek.reddykadaru@freescale.com> wrote:
>
> Hello,
>
> Is there any kernel patch available to generate netlink messages for =
events like add/modify/delete from iptables.

Hi there!

Just for the record: nftables includes that feature.

regards.
--=20
Arturo Borrero Gonz=C3=A1lez
