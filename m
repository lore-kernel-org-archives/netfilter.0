From: Andre Tomt <andre@tomt.net>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 09 Apr 2006 18:23:42 +0200
Message-ID: <4439350E.4060306@tomt.net>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org>	<20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net>	<20060409074313.GZ15954@vianova.fi> <20060409144416.GO1686@vianova.fi>	<20060409144534.GN29797@vianova.fi> <87psjqg2nt.fsf@hades.wkstn.nix>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750706AbWDIQXa@vger.kernel.org>
In-Reply-To: <87psjqg2nt.fsf@hades.wkstn.nix>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Nix <nix@esperi.org.uk>, linux-kernel@vger.kernel.org
Cc: vherva@vianova.fi, Patrick McHardy <kaber@trash.net>, netfilter@lists.netfilter.org, davem@davemloft.net

Nix wrote:
> I cetainly did. A simple `make oldconfig' ends up zapping pretty much
> all the old iptables CONFIG_ options, so you end up with not much of
> iptables or netfilter left.
>=20
> I must admit not quite understanding why the xtables stuff is needed:
> I thought that was needed for userspace connection tracking, which
> while it sounds cool isn't something I'm using yet.
>=20

Beeing bitten by such issues in the past, I always diff the old and the=
=20
new config and look for anything suspicious going down.

--=20
Andr=E9 Tomt
