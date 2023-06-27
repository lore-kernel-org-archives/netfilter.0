From: seentr@at.encryp.ch
Subject: Re: NAT to multiple ranges
Date: Tue, 27 Jun 2023 20:34:39 +0000 (UTC)
Message-ID: <a4ca1b1d-d1f1-42b7-aceb-72cc7e629f64@at.encryp.ch>
References: <5fc45938-1c10-a5fd-bf3d-0d358bbd02eb@z-up.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1687898085;
        bh=IoWl2PTDhTY/K0TkY9CdPMOxfP2XMWHjoOnjeEJLa3M=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject;
        b=keyXww80JXMExFH6AOBZte7P4OH/Zf2Najlm3cJn1Fsa/P2ex//Z64N773k0TEMdO
         uiilOtBM9/bBuxGWRLoppQBunRDMnALX7KtVI+jpMVqwbs5DW/vP8YxK1OxzwhN1t1
         2ot/2zuWH+jUVpA9cTue7o/rBHEcUsCZNtfZMu+Y=
In-Reply-To: <5fc45938-1c10-a5fd-bf3d-0d358bbd02eb@z-up.ru>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Dmitry <onyx@z-up.ru>

You may try to use Load balancing features to use both of your rules: https=
://wiki.nftables.org/wiki-nftables/index.php/Load_balancing

2023-06-27T20:31:32Z Dmitry <onyx@z-up.ru>:

> Hello!
>=20
> I have lan network like 10.10.0.0/16 and two sets of external addresses l=
ike 1.1.1.0/24 and 2.2.2.0/24. How to perform nat to use all my external ad=
dresses? Now i have rules like
>=20
> add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.10.0.0/16 counter=
 snat to 1.1.1.0-1.1.1.255 persistent
>=20
> add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.10.0.0/16 counter=
 snat to 2.2.2.1-2.2.2.255 persistent
>=20
> But,as expected, only first rule works. I need something like this:
>=20
> add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.10.0.0/16 counter=
 snat to 1.1.1.0-1.1.1.255,2.2.2.1-2.2.2.255 persistent
>=20
> But it is not supported.
>=20
> Also, i've tried to use names sets like this:
>=20
> add set ip nat ext_addr {type ipv4_addr;=C2=A0 flags interval; elements=
=3D{1.1.1.0-1.1.1.255,2.2.2.1-2.2.2.255} ;}
>=20
> But
>=20
> nft 'add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.178.0.0/16 c=
ounter snat to @ext_addr persistent'
> Error: unknown raw payload base
> add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.178.0.0/16 counte=
r snat to @ext_addr persistent
>=20
>=20
> With all respect!
