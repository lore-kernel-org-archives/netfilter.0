From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Counters Not Working with Sets of Type Interval
Date: Mon, 6 Jul 2020 13:20:35 +0200
Message-ID: <20200706112035.GA29659@salvia>
References: <f1324dfd-070c-1bda-0aad-22736f99ac55@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1324dfd-070c-1bda-0aad-22736f99ac55@softtalker.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Dillinger <miked@softtalker.com>
Cc: netfilter@vger.kernel.org

On Sun, Jul 05, 2020 at 06:25:57PM -0700, Mike Dillinger wrote:
> Hello,
>=20
> Recently, nftables added counters to sets.=A0 I've been using it and
> it works fine with type ipv4_addr.=A0 However, I have a set with with
> type ipv4_addr and the interval flag is set.=A0 I then add CIDR's to
> the set but do not see any counters when an IP address within the
> set interval range does something.=A0 This may be intentional with
> intervals though, meaning counters intentionally don't work with
> intervals, but I thought I would check to confirm the intended
> implementation.

It's a bug in userspace nft, this patch fixes up this:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20200706111748.2=
9601-1-pablo@netfilter.org/
