Received: from smtp.rodier.me (pigment.rodier.me [45.63.101.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B27322B72
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.63.101.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918263; cv=none; b=BTUcRfZI7/omIAYjo6wgb+C/ialROxekgIuRyCPKRzGg5y6+ygYYpVibvkK/n17ZgKh58BGAuLjq8JpVmYlLC/Om6ZAutVGrXkFdu6ArbqnnvrN8floTFDiC/b5OCpxHLxEqxxB8tIvFuglmozdrVgRx89yISiJkm/dfdz5ClXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918263; c=relaxed/simple;
	bh=MJ6EKGPNMyY3ATvHMWtn416ZQBl1T4TqaoRxam+hwAQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=Qpme32m1xalLBuQ8DEwzRfTibTesUWudSpld4+GVw54dWu/2/ZzJpcyIMNdAv6J3qpsSAp4RRjpLYXXjU+jqDPN5NYj6SGZN5arbj2RL0u67PhJFJuStqM58AtTSBlfBPuqVhRMKZxRuisPhwAV6DNzTxNzkL1PthvJvgwGnAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rodier.me; spf=pass smtp.mailfrom=rodier.me; dkim=pass (2048-bit key) header.d=rodier.me header.i=@rodier.me header.b=DjemDFow; arc=none smtp.client-ip=45.63.101.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rodier.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rodier.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rodier.me header.i=@rodier.me header.b="DjemDFow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rodier.me;
	s=pigment-2026; t=1780918258;
	bh=MJ6EKGPNMyY3ATvHMWtn416ZQBl1T4TqaoRxam+hwAQ=;
	h=Date:Subject:From:To:From;
	b=DjemDFowKGowaMU2rAK+Fvc9GQqreTJB5Brg0AWQz//heuZ5VouxAP4IXlh0NzMI6
	 6XwaRM6AdSO1R30qaXtKP9ws7iLfdPIluVwgzzUo+OPbPcBpeJRxbfnybrdO9iIIsE
	 GJWrEGf+1cjv5gGmBTgZATwh61hYWPCl8l+AjLA+ZkZAzp/2o9ACg6z5xSCyAeMuLu
	 KdH20n+6jP488gZyxcFPqWWTY7aedl1kCP74ztdZyTcm3jRyefLCNopEKqjmE+wDuZ
	 LhVlLQ22KZFb+mGzFTUp2NnPmaenqw0iwrnSIxGVF4tv5PN89dCmKHjD8NildpCFLx
	 RibeXRnqaUdvg==
Authentication-Results: smtp.rodier.me;
	auth=pass smtp.auth=andre smtp.mailfrom=andre@rodier.me
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=278e88c6f2398b619962ac0a3ffc48329e3e2fb0ea2b2008d38e038e6afe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 08 Jun 2026 12:30:55 +0100
Message-Id: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
Subject: Question on rate limiting on nftables
From: "Andre Rodier" <andre@rodier.me>
To: <netfilter@vger.kernel.org>

--278e88c6f2398b619962ac0a3ffc48329e3e2fb0ea2b2008d38e038e6afe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hello,

I am testing nftables SSH connections attempts limit, and I read about "met=
ers"

I would like to know the difference between these two methods of new connec=
tions limiting, and to ensure the first one is correct.

The first option:

~~~
table inet filter {
  [...]
  meta nfproto ipv4 tcp dport ssh ct state new,untracked \
  limit rate over 10/second \
  counter add @banned_ipv4 { ip saddr . ssh } \
  comment "Ban SSH bots"
}
~~~

And the second option:

~~~
table inet filter {
  [...]
  meta nfproto ipv4 tcp dport ssh ct state new,untracked \
  meter ssh4 { ip saddr limit rate over 10/second } \
  add @banned_ipv4 { ip saddr . ssh }
}
~~~

Is there any advantage using the second method ?

Thanks for your insights

--=20
=F0=9F=8C=90 https//rodier.me/

--278e88c6f2398b619962ac0a3ffc48329e3e2fb0ea2b2008d38e038e6afe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQQgxtr4dsuCnRR2flvDkWYfWv7tQgUCaian8BAcYW5kcmVAcm9k
aWVyLm1lAAoJEMORZh9a/u1Ch4sBAMQs2TjOKY098XI9CG6iSgIYJ6EWKXLnkT2b
9LEW2HfeAP42BWmL3FvOdW7rOuZE5ZimTelte9VV2W6tHDiEJuZ+Bg==
=ICDl
-----END PGP SIGNATURE-----

--278e88c6f2398b619962ac0a3ffc48329e3e2fb0ea2b2008d38e038e6afe--
