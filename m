Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97621531F9
	for <netfilter@vger.kernel.org>; Sat, 30 Aug 2025 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756547776; cv=none; b=kpNnEKqKB5V3S7hxzaoSES5NtPHqm6+M6+OX8P1D3ubbrjxA0wNjpXQ9FNJ7pwJLIviqoZahMmV7ucmFyYyhR6TXfMur7dgDPpvBsy4mF0ngzmP88qE7R4xJAT/t87KzoUzbxu6pX4Yk7vN4S8PjIVe4PFo3L35TaeRFrYEtMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756547776; c=relaxed/simple;
	bh=dU422wzIiGfeS9lAauT93XXbZAu3YSZKOgdB4U7wp1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjiW8DqRpvc15pZztvXle6fd011yJ2BVejOKt4+VAdCZJ8GveSAkp0CSeNFJy3iWtDNQA6z58t/PsC82slhPLFc0IkY8ByLJH0DFHipZOFYJs8rd8hZHkxB1JlKaFVpCK2CMCA0fCcxghvNttTkA12lgiEq6sYXcyhUx4NjKnhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id D0BF160555; Sat, 30 Aug 2025 11:56:04 +0200 (CEST)
Date: Sat, 30 Aug 2025 11:56:04 +0200
From: Florian Westphal <fw@strlen.de>
To: Arno DUBOIS <arno.du@orange.fr>
Cc: netfilter@vger.kernel.org
Subject: Re: Segmentation fault when adding a simple rule
Message-ID: <aLLKtFpWRlJYhIwV@strlen.de>
References: <CAJo4=a3VTOJjETWWbuKrLYSKUMO+0zqC-aDF+stycF1F--3NmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJo4=a3VTOJjETWWbuKrLYSKUMO+0zqC-aDF+stycF1F--3NmQ@mail.gmail.com>

Arno DUBOIS <arno.du@orange.fr> wrote:
> I've been trying to switch my Kube CNIs to use nftables directly.
> However, I get coredumps everywhere in my system.
>=20
> I successfully extracted the commands sent to the tool from the CNI:
> ```
> add table inet cni_plugins_masquerade
> add chain inet cni_plugins_masquerade masq_checks
> add chain inet cni_plugins_masquerade postrouting { type nat hook
> postrouting priority 100 ; }
> flush chain inet cni_plugins_masquerade postrouting
>=20
> add rule inet cni_plugins_masquerade postrouting ip daddr =3D=3D
> 224.0.0.0/24  return
> add rule inet cni_plugins_masquerade postrouting ip6 daddr =3D=3D ff00::/=
8  return
> add rule inet cni_plugins_masquerade postrouting goto masq_checks
> add rule inet cni_plugins_masquerade masq_checks ip saddr =3D=3D
> 10.244.0.198 ip daddr !=3D 10.244.0.0/24 masquerade
> ```
> I definitely am not an nftables professional, but they seem correct to me.

Yes.

> When running that, at the minute I try to add the rules (if I run the
> commands one by one) I receive a SEGFAULT (after some processing
> time).
> I did do a quick run with GDB if that can help:

Thanks, this helps indeed.

> (gdb) run add rule inet cni_plugins_masquerade postrouting ip daddr
> 192.168.1.1 return
> Starting program: /usr/bin/nft add rule inet cni_plugins_masquerade
> postrouting ip daddr 192.168.1.1 return
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
>=20
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000000000000000 in ?? ()
> (gdb) bt
> #0  0x0000000000000000 in ?? ()
> #1  0x00007ffff7ef3740 in set_make_key (attr=3D0x5555556017e6) at
> src/netlink.c:919

This is crashing when decoding the set/map key of the existing ruleset.

I think its the bug fixed with

be737a1986bf ("src: netlink: fix crash when ops doesn't support udata")

=2E.. which went into nftables 1.1.4 release.
