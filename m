From: Vitaly Repin <vitaly_repin@fsfe.org>
Subject: Re: SNAT and connection tracker: should established connections be
 dropped when a rule is removed from nat table?
Date: Sat, 11 Jul 2015 16:47:21 +0300
Message-ID: <CAH+_UjXguANiZ_OVZNT2PKNSp3OwjeD7NEnD4S0ScbaS3c851A@mail.gmail.com>
References: <CAH+_UjXdghtMhmdovrim1LBqBNGLFht7qJ4Y70wkwN6dw+SfPw@mail.gmail.com>
	<559FF2E2.1030703@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=jcMiVA3mht/pWNrhxIRk3RJj6zCdb8cYDwgIJweatPc=;
        b=g1A6RfmYj94/Qdj6RN/W9pOIcQMIJT0X1I57gwwjB3pypNWNEbBnxDggZnO16b3Oe7
         zpjRjQDAJ7a9/o30YQr48C7oFm4pScrfi1+b6hCevAv64bioEtviF9egsPnaES5whxL7
         CBGJgOwwcnK21U1qheDyUcuQHl3ipxJQtba9S2+nnMZhSFInNSufHMG1WgV5cKuBvFdL
         iATTjyPCJ30R0U7wg1JpnPk7xoObgYcJYFjpKZmJ3KqkY4sdYGRN5oYydaGBKY7MAjuS
         Q0JbVCecj5H/Xyf2tDnT2qvfN2kF/SkdOlIGOLtfWlP3D80TkMZJgkML1i4N05tEg+eZ
         R9zQ==
In-Reply-To: <559FF2E2.1030703@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Thanks! Confirmed that it works as expected.

2015-07-10 19:29 GMT+03:00 Noel Kuntze <noel@familie-kuntze.de>:
> Create a drop rule in *filter FORWARD, that drops incoming
> packets for SNATed IPs without a matching policy
>
> - -A FORWARD -m ipset --set snatedIPs dst -m policy --pol none --dir out -j DROP

--
WBR & WBW, Vitaly
