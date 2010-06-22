From: Zhu Jing <shadowarrx@gmail.com>
Subject: Re: noob question howto using iptables limit ip access times
Date: Tue, 22 Jun 2010 12:38:24 +0800
Message-ID: <AANLkTik_Q4_c1WgzM4VZ7oiqENhbAKgbmjHhEap09BnD@mail.gmail.com>
References: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com> 
	<4C1F54DF.5090802@plouf.fr.eu.org> <AANLkTilhJbehk5bjVQRspb0ludFdW0F0bzEvTtU4E9cR@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=2utmG4hrazDfpBi/Zft85V731oNDOFPLGEMUEBBvt7k=;
        b=Al8QlJBkwMhwDAKR5T6XwmX/HFFlB//S0URrbgD0HYXbo7DPokw+M0AwK7jyPutQ74
         zGqQoyhvf5sM9ecJnzVcEONvZhKeNFxoqXDJpYwRvV9OYf7KK3V3sjEOb7MznnBvNGDx
         B2fbPaGQw+xucuAmLy9DG8iagZwdrB0GNQaiQ=
In-Reply-To: <AANLkTilhJbehk5bjVQRspb0ludFdW0F0bzEvTtU4E9cR@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Curby <curby@cur.by>, rob0@gmx.co.uk
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

On Mon, Jun 21, 2010 at 22:58, Curby <curby@cur.by> wrote:
>
> On Mon, Jun 21, 2010 at 6:02 AM, Pascal Hambourg
> <pascal.mail@plouf.fr.eu.org> wrote:
> > Because your rule limits packets, not connections. A single TCP
> > connection involves multiple packets.
>
> Yes, the stateful features of netfilter would be useful here. =C2=A0D=
rop
> the INVALIDs, accept the ESTABLISHED,RELATED, drop NEW not SYN
> packets, and your match will mostly match valid new connection
> attempts. =C2=A0This could be further improved by detecting and dropp=
ing
> port scans, as Jan wrote about.
>
> This prevents the 1000/day rule from matching packets for ESTABLISHED
> connections and for spurious packets that should be ignored.
>
> --Mike


  Thank your very much, ill try it later .Thx a lot
