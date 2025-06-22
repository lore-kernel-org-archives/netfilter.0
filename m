Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [148.6.0.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC681ACED7
	for <netfilter@vger.kernel.org>; Sun, 22 Jun 2025 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750587027; cv=none; b=snZp3KCwBSeavaW5gAO6If4FnRSDWBrQmKdTt4Y6el7kTEGvsIs3RyziJsuO1dYntRU48NnBfOXqFPeFWOl9Eq0V/ovbdCfkroyzGS4XNyqGUWXiCA1VdI14s/ahFebUW9oefQLaV7cSPkPbMHabGl5CN6+iMzr2SYUBPOJwgBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750587027; c=relaxed/simple;
	bh=b+Rs3+rDVcBgtO/Eof6CwHlQDFNhWI8NT+Yclvt1WT4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Xog3SiGjPztk7T+cEqOcTLsHiaix2F+jb9FdrClqc5kofi9kPa8iaYDLYqlkF4MmaOrFhHNQeWlfrBt14IL3yvh0MVsSh40XyvuUg1JJvBjSbfemj/VV0Bl5mJAu/qCHbIaz1XDB9Mv21lW1rWDXvEq9q/6lUAZPuHDbtGM7VSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=148.6.0.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.kfki.hu (Postfix) with ESMTP id 4bQ6Qx4xgsz7s852;
	Sun, 22 Jun 2025 12:10:17 +0200 (CEST)
X-Virus-Scanned: Debian amavis at smtp2.kfki.hu
Received: from smtp2.kfki.hu ([127.0.0.1])
 by localhost (smtp2.kfki.hu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id DZ6U2joDeoAA; Sun, 22 Jun 2025 12:10:15 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (unknown [148.6.192.8])
	(Authenticated sender: kadlecsik.jozsef@wigner.hu)
	by smtp2.kfki.hu (Postfix) with ESMTPSA id 4bQ6Qv5h4dz7s84y;
	Sun, 22 Jun 2025 12:10:15 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
	id 9D163141033; Sun, 22 Jun 2025 12:10:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mentat.rmki.kfki.hu (Postfix) with ESMTP id 99F4A1409A3;
	Sun, 22 Jun 2025 12:10:15 +0200 (CEST)
Date: Sun, 22 Jun 2025 12:10:15 +0200 (CEST)
From: Jozsef Kadlecsik <kadlec@netfilter.org>
To: Michael Tokarev <mjt@tls.msk.ru>
cc: netfilter@vger.kernel.org
Subject: Re: order of netfilter hooks and check for martian source
In-Reply-To: <0d34447b-5e69-40e2-a0ca-f44b1e74d47d@tls.msk.ru>
Message-ID: <b2c876c8-df09-ed44-05c1-a1bd57ea2c7c@netfilter.org>
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru> <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru> <b69fa9d9-6e56-0e08-adec-ba768a108938@netfilter.org> <9fc435dd-547f-4e50-8c2c-862a1ff62a2c@tls.msk.ru> <c1ecb68e-d4ce-9773-8649-ebac5171da06@netfilter.org>
 <51d3ebab-f543-4cbf-9923-8a9d965de826@tls.msk.ru> <26692fd4-71d4-4a77-b581-064837e2bb07@tls.msk.ru> <0d34447b-5e69-40e2-a0ca-f44b1e74d47d@tls.msk.ru>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1587914648-1750587015=:3235"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1587914648-1750587015=:3235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Jun 2025, Michael Tokarev wrote:

> On 21.06.2025 20:50, Michael Tokarev wrote:
> > On 21.06.2025 19:08, Michael Tokarev wrote:
> > > On 21.06.2025 19:05, Jozsef Kadlecsik wrote:
> > > > On Sat, 21 Jun 2025, Michael Tokarev wrote:
> > > >=20
> > > > > On 21.06.2025 17:42, Jozsef Kadlecsik wrote:
> > > > > ..
> > > > > > However, routing decisions can be affected by marking packets=
. So
> > > > > > I'd mark
> > > > > > packets before routing and use routing tables according to th=
e mark
> > > > > > value.
> > > > >=20
> > > > > The prob with replies to DNAted packets is that these packets t=
raverse
> > > > > routing rules first, BEFORE they're seen by netfilter code.=C2=A0=
 Who can
> > > > > mark them for routing if routing is done before it's in netfilt=
er?
> > > >=20
> > > > No, not at all. You can mark the incoming first packet, store the=
=20
> > > > packet's mark value in conntrack and restore from conntrack for=20
> > > > the reply packets in mangle/prerouting. Which is exactly that,=20
> > > > before routing.
> >=20
> > I tried to follow this route.=C2=A0 In the dnat rule, I applied a mar=
k to
> > this conntrack entry, and checked this fwmark in ip rule to perform
> > routing through ip2/gw2 instead of default ip1/gw1.
>=20
> I figured out how to actually make it work. I can dnat the initial
> packet to a different internal-host IP (adding second IP to the dnat
> destination host), and in the routing rules, use this second IP as
> the key for routing table decision.  Thankfully there's no shortage
> for internal IP addresses.  But this is very ugly, - an ugly work-
> around for a bug in kernel which shouldn't be there in the first
> place.
>=20
> For the initial issue (martians checked after netfilter doing mangling)=
,
> the work-around also exists and is also really ugly - it is repeating
> the martians check in netfilter rules, ie, keeping routing table in two
> places.

You have got a non-simple routing configuration and reverse path filterin=
g=20
has got its own troubles with it, which is further complicated by natting=
.
So it's best to separate the issues:

reverse path filtering: By enablink loose mode for both of the default=20
route interfaces should be enough because that way the routing engine can=
=20
find an entry in the FIB and won't drop the packets as martian.

Due to NAT, wrong interface picked by the routing engine: you have got=20
source-based routing which don't play well with NAT. Therefore I suggeste=
d=20
marking and using a mark-based routing because that solves it, both in th=
e=20
case of iptables and nftables. If you can pick another IP address which=20
matches the good entry in the routing table, that's also good. There's=20
third solution if you use nftables: the reverse direction for DNAT is an=20
internal SNAT and in nftables you *can* set the SNAT priority to the same=
=20
as DNAT, i.e. before routing. That way routing'll see the natted source=20
address and source-based routing can pick the good outgoing interface.=20
However, if you use SNAT as well otherwise, then that can also be affecte=
d=20
in routing.

[Personally, I always check ingress-egress in netfilter, regardless of th=
e=20
reverse path filtering.]

Best regards,
Jozsef
--=20
E-mail : kadlec@netfilter.org, kadlec@blackhole.kfki.hu, kadlecsik.jozsef=
@wigner.hu
Address: Wigner Research Centre for Physics
         H-1525 Budapest 114, POB. 49, Hungary
--8323329-1587914648-1750587015=:3235--
