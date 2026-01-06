Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA773451C1
	for <netfilter@vger.kernel.org>; Tue,  6 Jan 2026 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728193; cv=none; b=CAkliwsVX9zdLfj5T6NWwSV3DTe8tHOLP7tM7/43xQGQrWLgatwUUzPRa9ucQLdYcd6WJt9kwGibZg/19CVtAT1sGJrBF3JNj5bwB/8bbh1vOHlKGSw5+UEB6uqz0UJ2Evf885zOll5+f2nT80Od6jwCAECeAOTVSC0W5YOKsAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728193; c=relaxed/simple;
	bh=ahK2dT5X4B9moUf/Ai0ij298BKsccf5NGUd/o5QbEl4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=igO9ktW5DyeGHbmjlQ0Gs9JfajHZgT8uOWnr3MU7U+yEq26FiIpfGOQYvzNqSaDWJiwOPnKN0ZwgjqWyN++LyUKh0iPIMpL52d0yF6z+oU6YuoR0ondykru8hu398S6rMxDkAEzHCVXYyIdpOE/jE+Zum92qoVaJHQTlneLFFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=qSAz/PLy; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=7rthlX0G; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="qSAz/PLy";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="7rthlX0G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	References:In-Reply-To:Subject:CC:To:From:Date:From:To:Cc:Reply-To:Subject:
	Date:Sender:Content-ID; bh=wQ2N3kDdh8hd4pA1mXGr49mwxTlORdAjsFoABNf7iA4=;
	t=1767728188; x=1768937788; b=qSAz/PLyCz+gffCMxgJ8p23r02KZUK19thTwTWUffAEtNgj
	rSFMzQYIh3qKwhn9ZY/nE26QwGBavY7spv9/5TIBmsQnSKItMbaXNQ+msdRoqDWco1w4RW1E23o4w
	ceCERFjjqJRLwji/4wQMNRjKKCJjuZM0A0y6RYtJItZl8Hs=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:From:To:Cc:Reply-To
	:Subject:Date:Sender:Content-ID;
	bh=wQ2N3kDdh8hd4pA1mXGr49mwxTlORdAjsFoABNf7iA4=; t=1767728188; x=1768937788; 
	b=7rthlX0G/A0VCK/95Nnlu15TrFgWJrtrySHdkPj2R/i7l3JP4Yt5oz+K+S/TNMvRtKLBHj+9s4a
	2KdPsuEbHCw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1vdCqw-004nMm-0a;
	Tue, 06 Jan 2026 20:36:26 +0100
Date: Tue, 06 Jan 2026 19:36:22 +0000
From: Slavko <linux@slavino.sk>
To: Dmitry Konishchev <konishchev@gmail.com>
CC: netfilter@vger.kernel.org
Subject: Re: Dangerous examples in nftables documentation
In-Reply-To: <CABYZ2k40WHg2Thzo0=4r6Y6UTAtrw3EMRq=0fwKVViL40exAMA@mail.gmail.com>
References: <CABYZ2k5wSkW7ifYSzw_QekqNz7yrcAG3tN9qKA-dCzaD_uUvhQ@mail.gmail.com> <E1B33049-8304-4686-8806-56D7F5AF54F8@slavino.sk> <CABYZ2k40WHg2Thzo0=4r6Y6UTAtrw3EMRq=0fwKVViL40exAMA@mail.gmail.com>
Message-ID: <1ED8A4EF-7A6B-4253-A35D-5070EDBEE9C6@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 6=2E janu=C3=A1ra 2026 18:36:05 UTC pou=C5=BE=C3=ADvate=C4=BE Dmit=
ry Konishchev <konishchev@gmail=2Ecom> nap=C3=ADsal:

>Oh=2E=2E=2E =3D) It's quite unexpected after `tcp flags !=3D syn` which t=
urns

There are multiple way to write the same thing, this is shortcut
(or how to name it in English):
=20
    tcp flags FLAG=20

(as i mentioned early, less typing =3D=3D less typos, and one flag is
less to change than two flags, etc=2E=2E=2E) The full syntax is simple
bitwise operation & comparison:

    tcp flags & MASK =3D=3D VALUE

The difference is, that shortcut has not equal/nonequal operator=2E
To be fuly confused, it is possible to use another form to get the
same (guess which syn is mask and which is value):

    tcp flags syn / syn

When you do just with equal/nonequal comparison, no mask is
applied, thus whole flags field value is compared::

    tcp flags =3D=3D syn    # only SYN flag is set
    tcp flags !=3D syn    # hard to describe for me in En :-P

Remember, that flags field is just 8-bit number, the "syn" itself
is number (named constant) too=2E=2E=2E Your friend is debug output:

    nft -c --debug=3Dnetlink add rule =2E=2E=2E

The -c option is check (do not add rule at all), the output you will get
will ba something as this:

    [ payload load 1b @ transport header + 13 =3D> reg 1 ]
    [ bitwise reg 1 =3D ( reg 1 & 0x00000002 ) ^ 0x00000000 ]
    [ cmp neq reg 1 0x00000000 ]

1, get value and store it in reg 1
2, do bitwise operation on reg 1 and store result in reg 1 (again)
3=2E compare that reg 1 is zero

For me the biggest problem is to understand bitwise operators,
as i usualy use named funczions (AND, XOR, NOT=2E=2E=2E), but with little
effort (and notes) it is understandable=2E=2E=2E

>out to be a simple comparison, as well as `ip daddr 1=2E2=2E3=2E4` is a
>simple comparison=2E=2E=2E Thanks! That's what I am talking about: the
>current documentation is so sparse, lacks details and having no

Did you read nft's manpage? It contain almost everithing, except
detailed examples=2E=2E=2E

>ability to test rules (it's hard to reproduce exact packets and test
>your rules against them) that you have no options other than wondering
>and learning from examples which are, as we found out "are just, ehm,
>examples"=2E :)

For IPv4 only (with TCP it doesn't matter), the hping3 is your friend,
here is unrelated hping3 example, where i reproduced SYN segment
with 12 B zero data (it has many other options):

    hping3 -S -c 1 -d 12 -E /dev/zero =2E=2E=2E

happy firewalling
:-)


--=20
Slavko
https://www=2Eslavino=2Esk/
