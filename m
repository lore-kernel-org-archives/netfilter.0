From: Martin Bednar <martin@serafean.cz>
Subject: Re: nftables kernel bug
Date: Wed, 30 Nov 2016 00:28:51 +0100
Message-ID: <10355886.rWhGxfjZAr@nemmerle>
References: <2097005.VXRZyRJPl3@nemmerle> <20161129225430.GA8487@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=serafean.cz;
        s=default; t=1480462134;
        bh=A1/Y1XRsn5DGxBdGpPQQCVFmmEQDGEohHf7sA7rJu4s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XKovRFos7ADZ7c8crgEsmytUT5Z0MIpwMHOt6AkRJ8/eUjQsPIzpNXJBi4Qrj6jua
         er6sA3Ek5vhIkNSSny9BQZh7khspY0rxx76kNz7W5lCStPpUJTy5uDp3N8EB0FgN/k
         frPnuGudFMcjZu8xKgARFinCQFFWgsnsGOjSpqBe+jS74xh6cT2TK/fJ5VkTVdGmPk
         dxtSxoeAMF4NiKJ/IY0hliHeGhCALM02bhNgIbYfJn1WmlJxflozco/LJ9tjuaPylA
         xVXnD4SZF4XLQhjGoOgA6wN0ljNKPC+1MNmFCp9aS/yj3nCABA9hx9c62+pATpMQDw
         GnaEW8kGrcEPQ==
In-Reply-To: <20161129225430.GA8487@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Le Tuesday, November 29, 2016 11:54:30 PM CET Pablo Neira Ayuso a =C3=A9cri=
t :
> On Tue, Nov 29, 2016 at 11:37:21PM +0100, Martin Bednar wrote:
> > Hi, I just hit a kernel bug using nftables.
> > Using kernel 4.8.11.
> >=20
> > Inline is a minimal configuration file to reproduce and the dmesg log.
> > Let me know if you need anything else.
> >=20
> > Martin.
> >=20
> > Minimal configuration to reproduce:
> >=20
> > table inet filter{
> >=20
> > 	map iface_rules {type iface_index : verdict;}
> > 	chain lan1{
> > 	}
> > =09
> > 	chain input{
> > 	type filter hook input priority 0;policy accept;
> > =09
> > 	iif vmap @iface_rules
> > =09
> > 	}
> >=20
> > }
> > add element inet filter iface_rules {enp0s18 : jump lan1 } #BUG_ON here.
>=20
> Fixed by:
>=20
> http://git.kernel.org/cgit/linux/kernel/git/pablo/nf.git/commit/?id=3D58c=
78e10
> 4d937c1f560fb10ed9bb2dcde0db4fcf
>=20
> Will pass this to -stable asap.

Thanks! Will try the patch tomorrow.

>=20
> Thanks for reporting.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



