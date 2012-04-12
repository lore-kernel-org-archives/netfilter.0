From: SamLT <sam@sltosis.org>
Subject: Re: flushing & deleting non existing chains
Date: Thu, 12 Apr 2012 09:45:50 +0200
Message-ID: <20120412074550.GH5617@tosh.sltosis.org>
References: <1334124447.96679.YahooMailNeo@web125606.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1334216755; bh=doOKkU4/4lUmzEdD1vFXmBqIL1H0q3Pm3N9Qa8//9xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXHDipIrNvnWdihhu48yFDbdANpE0Mw0cc/lBYui59YPIsdysSIyVXvAXgUbIoyyG
	 WqGwCo7LUoRAo7ug666n+7su6PdAqcPGMTc3aT5+sKLBgpCJ5Tw9ix+UmBV2K69ZPd
	 tITZUZJyS3kgag3bZKF0veeLjZX6NE6Mpya4+JQQ=
Content-Disposition: inline
In-Reply-To: <1334124447.96679.YahooMailNeo@web125606.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Tue, Apr 10, 2012 at 11:07:27PM -0700, gopi bhimavarapu wrote:
> Hi
>=20
> I was trying to flush a chain, delete all the rules and delete the ch=
ain before creation of the chain.
> This approach worked fine in iptables-1.4.0, but seems like in iptabl=
es-1.4.12.2, we cannot flush a non existing chain.
> Is there any change in the expected behavior ?

I don't know if there was a change or not, but as far as I can tell, yo=
u
don't need to flush anything when using iptables-save/iptables-restore,
it just replace your current ruleset.

>=20
>=20
> Snippet below works fine in 1.4.0 (using iptables-restore), but compl=
ains in iptables-1.4.12.2
>=20
>=20
> *filter
> :FORWARD DROP [0:0]
> -F chain_tun_0_
> =C2=A0-D FORWARD -o tun_0_+ -j chain_tun_0_
> =C2=A0-D FORWARD -i tun_0_+ -j chain_tun_0_
> -X chain_tun_0_
> :chain_tun_0_ - [0:0]
> =C2=A0-I chain_tun_0_ -j DROP
> =C2=A0-I FORWARD -i tun_0_+ -j chain_tun_0_
> =C2=A0-I FORWARD -o tun_0_+ -j chain_tun_0_
> =C2=A0-I chain_tun_0_ --protocol all -o tun_0_+=C2=A0=C2=A0=C2=A0 -j =
ACCEPT
> =C2=A0-I chain_tun_0_ --protocol all -i tun_0_+=C2=A0=C2=A0=C2=A0 -j =
ACCEPT
> =C2=A0-o ext0 -I chain_tun_0_ -j DROP
> =C2=A0-i ext0 -I chain_tun_0_ -j DROP
> COMMIT
>=20
>=20
> Regards,
> Gopi
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
