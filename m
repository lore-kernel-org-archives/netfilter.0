Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [148.6.0.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FAF70824
	for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750517347; cv=none; b=ZfnBenCNc0l2e1dHuwjt7VoMDLpYckjJkYub+ecoCKWUUguPxgQPWbO5MCqxGOQ6lYfD5mcs1eommkN0mgn3f4c9ktpe1A34v4gTBzOBN+coYZ+99et4z1SXsEKCpqdhgWnEc8a3UldO/bR72/hUPh5iWc3bYv09TVkFn5K6Eko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750517347; c=relaxed/simple;
	bh=lfUR77/suwtvbrqVKFngokfoQfPuLZDfRvFy44jMgeo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n4Xt0AXa1Oxpdgv0I+5P0cGzffkqcDk8VLqO4BP4CRdfIS+aMkeBPXILJacyEqgeGxXIkp9VlpJdIGMaAOuPWTsgrPfD+OICpvvxh+FCypYY2a5EkUtp+kQUCYwm5IF+SibQ8J5t6gkkeKPD3BU87YLmGXrb5Ef4v33uQNpsk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=148.6.0.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.kfki.hu (Postfix) with ESMTP id 4bPcWS5JDhzGFDMF;
	Sat, 21 Jun 2025 16:42:28 +0200 (CEST)
X-Virus-Scanned: Debian amavis at smtp1.kfki.hu
Received: from smtp1.kfki.hu ([127.0.0.1])
 by localhost (smtp1.kfki.hu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id L-jUlRQkz4gX; Sat, 21 Jun 2025 16:42:26 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (unknown [148.6.192.8])
	(Authenticated sender: kadlecsik.jozsef@wigner.hu)
	by smtp1.kfki.hu (Postfix) with ESMTPSA id 4bPcWQ5vZKzGFDMC;
	Sat, 21 Jun 2025 16:42:26 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
	id 15496140EA3; Sat, 21 Jun 2025 16:42:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mentat.rmki.kfki.hu (Postfix) with ESMTP id 1201F140184;
	Sat, 21 Jun 2025 16:42:26 +0200 (CEST)
Date: Sat, 21 Jun 2025 16:42:26 +0200 (CEST)
From: Jozsef Kadlecsik <kadlec@netfilter.org>
To: Michael Tokarev <mjt@tls.msk.ru>
cc: netfilter@vger.kernel.org
Subject: Re: order of netfilter hooks and check for martian source
In-Reply-To: <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
Message-ID: <b69fa9d9-6e56-0e08-adec-ba768a108938@netfilter.org>
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru> <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-229791729-1750516946=:3235"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-229791729-1750516946=:3235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 20 Jun 2025, Michael Tokarev wrote:

> On 20.06.2025 12:28, Michael Tokarev wrote:
> >=20
> > I'm facing a very difficult to solve situation with nftables
> > DNAT hooks not working well together with network stack martian
> > source check.=C2=A0 In my situation, I've policy routing (we're movin=
g
> > from one ISP to another, so (temporarily) use two default routes
> > in two different routing tables), and a DNAT rules on external
> > interfaces which redirects certain ports to different internal
> > hosts.
> >=20
> > We've two external ethernet interfaces, let's say eth1 & eth2,
> > with two externally routed IP addresses, ip1 & ip2, and the
> > following routing rules (simplified):
> >=20
> >  =C2=A0 from ip1 default via gw1 dev eth1
> >  =C2=A0 from ip2 default via gw2 dev eth2
> >  =C2=A0 from all default via gw1 dev eth1
> >=20
> > And there's also ethINT, with some host having hostINT address.
> >=20
> > I'm doing DNAT from ip1:port to hostINT:port, and also
> > from ip2:port to hostINT:port.
> >=20
> > When initial packet arrives, it gets mangled by nftables
> > DNAT rule first, and only after that, it gets checked for
> > martian sources.=C2=A0 When initial packet comes to ip2:port,
> > it looks like
> >=20
> >  =C2=A0=C2=A0 extIP =3D> ip2:port
> >=20
> > after DNAT, it becomes
> >=20
> >  =C2=A0=C2=A0 extIP =3D> hostINT:port
> >=20
> > so info about its original destination IP is lost at this
> > point.
> >=20
> > Now the network stack checks this new packet for martian
> > sources.=C2=A0 It does not match the 2nd rule above (for ip2),
> > since the packet does not have ip2 in it anymore.=C2=A0 So the
> > kernel "thinks" this packet should've been arrived on
> > eth1 (according to the 3rd routing rule above), instead of
> > eth2.=C2=A0 And it gets dropped as martian source.
>=20
> The situation turned out to be even more interesting here.
>=20
> I turned off rp_filter, to let the packets in.  But it does
> not work still.  Because the reply packets, from hostINT
> back to extIP, gets routed to gw1 through eth1, instead of
> gw2 through eth2.  Because apparently, routing decision
> is made before de-DNAT'ification, so routing rules see
> hostINT=3D>extIP, instead of ip2=3D>extIP, where rule2 above
> should kick in.
>=20
> The result is that packet with srcIP=3Dip2 is sent to eth1
> where it does not belong at all.
>=20
> This really looks like a bug in kernel.

From netfilter point of view routing is a completely independent, "black=20
box" system. We can operate before and after routing but we cannot jump t=
o=20
"hooks" in routing because there isn't any there.

However, routing decisions can be affected by marking packets. So I'd mar=
k=20
packets before routing and use routing tables according to the mark value=
.

Best regards,
Jozsef
--=20
E-mail : kadlec@netfilter.org, kadlec@blackhole.kfki.hu, kadlecsik.jozsef=
@wigner.hu
Address: Wigner Research Centre for Physics
         H-1525 Budapest 114, POB. 49, Hungary
--8323329-229791729-1750516946=:3235--
