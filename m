Received: from dragonfly.birch.relay.mailchannels.net (dragonfly.birch.relay.mailchannels.net [23.83.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60FF4C85
	for <netfilter@vger.kernel.org>; Wed, 24 Sep 2025 21:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758750340; cv=pass; b=QIld4regSlV1eCMvFWB2bNe58rLk8VNBAmdMEqma1iwS+AaQ2jIeyEkprCeURftQsWG5Pc81Fp2dGSupdCAruI/5WSYVjyZjNsK43W54U0YGqtDRWXtcW0YJ76DyhDNsVuJV7et96v8+z/q3lOJpXG/N02cb6lVDwlAEWj7dOBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758750340; c=relaxed/simple;
	bh=4oynUM0D0fmeLrFP+Cdwbosvwb004Qk3oPektdD1qrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jpThDmSqs3iTi8PiZtrq4947l6QDyyU0HYogn5JYNiFR5OB0gR84W7ujEA1YoRyF8wKrAlUE+1rgZjNpeIwGeXQ07ROIFp5Gzg0fmfEFJurPJnu3a5ZGz7g18EfZAd2rd6/CGKUdW+PHSl0xppBDxYRQ8begAafCCFYJg2Uhpn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C8B327C3757;
	Wed, 24 Sep 2025 21:45:36 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (100-108-145-58.trex-nlb.outbound.svc.cluster.local [100.108.145.58])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id A1F827C32B2;
	Wed, 24 Sep 2025 21:45:35 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758750336; a=rsa-sha256;
	cv=none;
	b=FDpDbhAge5Xvsk3G7iuOu9IHpQ23NEly0GeAyrcrROaprMCAAJ/Henx9wq1T3ZCPKfLVvq
	6hkhh7u+Je0bdSi5EWl5CEWWh48ypN6md3+fTfXY7Y3gC49tk6Z+0lvFAjx07ezwD5CD5e
	sWqFfD67GQZeeClHVClFeyIEHFXjAeKrmiWU4MxJHqXOMLaZeui2SCfVg+QYRnpe5oGepT
	jCCDF5Jnex3mH9680DB9b8vIife+N4vaUVcLnJoVVpYXW37EsI6zaUuQLEeMO66A8MPr5k
	M558Tbar96ayoCM+2oilcpKghXKvu54dvTP4O2pz+PPDSo80iLazTM7TpiB8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758750336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4oynUM0D0fmeLrFP+Cdwbosvwb004Qk3oPektdD1qrQ=;
	b=dS39wrbJXyeHS0cFQckIZ5q9CL08jX99oT/SNDFwVyfEdcI/VDcQr4xXmqakhD9Obu4Dmp
	XfFPxM7J51nDpTADJWvEu6n49Gb28ceWIhSAxoVrHs9rwOqoQPebxa/en4AfLlPQbEXeFv
	0eIE8cP1OZAz/imQ5mn3aQQHeWZwpW6f2SX69NRX0FysJNG7UvrS+hCPxBoime0sxz/BHV
	Mu/iSr2UM+yFEU8pPufeSfMM1L2XRF2zKEbNf/l0MPkvoDwUM51i8rrwbZ7L5k5iYJ6jIN
	lfKa9aplBFf4J00BIoY3pp7RQxxk+vU3FJXfYp+WTxNdKxeM07Xd0ZKe80acMQ==
ARC-Authentication-Results: i=1;
	rspamd-55b8bfbc7f-rtv5n;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Absorbed-Squirrel: 70387c5d1a4cddc8_1758750336324_4046397701
X-MC-Loop-Signature: 1758750336324:2229498715
X-MC-Ingress-Time: 1758750336324
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.145.58 (trex/7.1.3);
	Wed, 24 Sep 2025 21:45:36 +0000
Received: from [79.127.207.171] (port=40890 helo=[10.2.0.2])
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <calestyo@scientia.org>)
	id 1v1XIt-00000004FPN-2nct;
	Wed, 24 Sep 2025 21:45:34 +0000
Message-ID: <7ac615dba3623d39cae03a9ed92194cb69d3a7ec.camel@scientia.org>
Subject: Re: some questions on nft
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Date: Wed, 24 Sep 2025 23:45:32 +0200
In-Reply-To: <aNPhP63SyX2ofE92@strlen.de>
References: <5a7d4a11bdeb50123e68df16726c4d1b461d2fd7.camel@scientia.org>
	 <aNPhP63SyX2ofE92@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-3 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org

Hey Florian.

Thanks for taking your time on this :-)

On Wed, 2025-09-24 at 14:17 +0200, Florian Westphal wrote:
> Christoph Anton Mitterer <calestyo@scientia.org> wrote:
> > 1) I there any difference between e.g
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct state established,related accept
>=20
> You can use nft --netlink=3Ddebug, that should explain the difference.
> This is a bit-test, matches if either flag is set.

So you if mean either establishes, or related or both are set,=C2=A0right?

I assume it works always like this with "," and any bitfields?

My nft doesn't seem to recognise --netlink=3Ddebug. Do you mean
--debug=3Dnetlink? :-)


> > =C2=A0=C2=A0 and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct state {established,related} accept
>=20
> matches when established is set but not related and vice versa.
> Given established and related are mutually exclusive, both do the
> same thing but the former is a bit faster.

I see. , good to know.


>=20
> > 4) In principle I prefer the syntax as returned by nft list over
> > the
> > =C2=A0=C2=A0 one using single commands, like:
> > =C2=A0=C2=A0=C2=A0=C2=A0 add rule ...
> > =C2=A0=C2=A0 is there any documentation on how the block based syntax i=
s
> > =C2=A0=C2=A0 merged when using include? Or is that even officially supp=
orted?
>=20
> Its expected to work, yes.=C2=A0 Not aware of any documentation.

Such documentation would actually be quite helpful, cause I've seen
e.g. that "redefining" (or better updating) a table with that syntax
won't cause e.g. its comment to be updated.
But the policy of a chain will be overridden by a later one.


> > =C2=A0=C2=A0 But no idea how his would be done with sets, etc.?
> > =C2=A0=C2=A0 Or is this simply a: don't do such stupid things?
>=20
> Well, its always a good idea to NOT do stupid things :)

Well from the documentation, both form seemed to be considered "equal",
so it's not necessarily obvious whether or not it's just stupid or
missing some docs ;-)


>=20
> > 5) Many examples use:
> > =C2=A0=C2=A0=C2=A0=C2=A0 iif lo
> > =C2=A0=C2=A0 or
> > =C2=A0=C2=A0=C2=A0=C2=A0 iifname lo
> >=20
> > =C2=A0=C2=A0 Now first, if I'd bring down lo and bring it up again (lik=
e it
> > may
> > =C2=A0=C2=A0 actually happen with eth0/wlan0 and others)... would it ge=
t a
> > =C2=A0=C2=A0 different id, and thus no longer be matched by iif?
>=20
> No, lo is always 1.=C2=A0 For other devices, yes, might get different id.

And I assume this is really hardwired?

I.e. even if on would hack the system to bring up lo after e.g. eth0...
or if one would remove lo and bring it back?
Not sure whether this is even still possible.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net=
/core/dev.c#n12926
seems to indicate that not.


> > =C2=A0=C2=A0 In particular for lo, wouldn't it anyway better to use
> > =C2=A0=C2=A0=C2=A0=C2=A0 iiftype loopback
> > =C2=A0=C2=A0 (which would simply match all loopbacks, regardless of the=
ir
> > name)
> > =C2=A0=C2=A0 or is there any disadvantage I can't see?)
>=20
> Hmm, why would anyone add another loopback device?

Not that I want... but just to catch any stuff that co-admins might do
;-)


> > 7) Also not possible, AFAICS, but was it ever considered to allow
> > =C2=A0=C2=A0 using=C2=A0sets within (v)maps or even other sets?
>=20
> No idea. I don't like it because it slows things down (need to
> iterate and then query several sets).

True. But I though more about the poor-man's way, where any referred
named set would have simply been resolved when being added.


Thanks... your answers were quite helpful. :-)


Cheers,
Chris.
