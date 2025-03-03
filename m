Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B25278F3A
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741038742; cv=none; b=U+lKWuPYERqLapVqUDCBX7/GHYjUlqr3oXbE29SSylmAFaB/5jRP8uMqrUxeIwnQQ4IYKVkDgFquvTNWvB3AWxDvltjVRpK4I7a/lqNZRr6BIjVKJTbkuxfm3ZE45/+hq2mY+3TxtR0XUzZO45RriwdQEIx+xsB2ccOz+jFAPac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741038742; c=relaxed/simple;
	bh=SYLFk/OYARoH4jNjCtaH3LxFMBNqTwcTHPYh5zbE5y4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KCd+zmar8ABi3OWSL9t9E0kyepezPmZDqQDMN8P0t2SYhVQX1Ps90Fl8Yr9uE0mGYM7HoSoi4BsB+oezEvfeGag8FltrQx/QpmsxlyOQ1wcFwCWaYimccfMxBe2hYXpQhnRvd/CJXrastBjHxqKpopLaTM2uxZTNfFiQ1rXaLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=dmtmbLks; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=biYc4d7t; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="dmtmbLks";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="biYc4d7t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=8Nk7JOnmxCMqJV5bgwiXUpbssccAOfavNOoH9VByqNQ=; t=1741038738; x=1742248338; 
	b=dmtmbLksY/cNOa87jdalJqgkcCKRymF2DHNYd9KLftGzXagGUZ4oqoECB4M+SRbbivVvKVkPdBa
	+w0zv9pXCcdZDwRlLuKR8juwvCFbVzOAdZ0PcJWVhumnVRygWmiwXKoGq9L3H54gPsJiBbpQWt0Sp
	VY+Qfiu3mE8xb41JqWc=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=8Nk7JOnmxCMqJV5bgwiXUpbssccAOfavNOoH9VByqNQ=; t=1741038738; x=1742248338; 
	b=biYc4d7tlTl0P0rH7E6i7pz2evZzFM+YYXmR+3vfUWkarbVmpoloOYAxg1Mpc7ia4O0uMGyA9I/
	JKtz2eZ8BCQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tpDhq-001v3f-0J
	for netfilter@vger.kernel.org;
	Mon, 03 Mar 2025 22:52:10 +0100
Date: Mon, 03 Mar 2025 21:52:07 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
In-Reply-To: <20250303193533.GA16225@breakpoint.cc>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk> <20250303193533.GA16225@breakpoint.cc>
Message-ID: <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 3=2E marca 2025 19:35:33 UTC, Florian Westphal <fw@strlen=2Ede> wrote:

>This is only required for logging that is triggered
>internally, e=2Eg=2E for nf_conntrack=2Elog_Invalid=2E

Oh, many thanks, that was not clear for me from any
related article=2E

>I think this is missing support in ulogd2=2E
>
>Untested, to give you some starting point:
>(3 is NFPROTO_ARP)=2E
>
>--- a/filter/raw2packet/ulogd_raw2packet_BASE=2Ec
>+++ b/filter/raw2packet/ulogd_raw2packet_BASE=2Ec
>@@ -959,6 +959,8 @@ static int _interp_pkt(struct ulogd_pluginstance *pi)
>                return _interp_ipv6hdr(pi, len);
>        case AF_BRIDGE:
>                return _interp_bridge(pi, len);
>+       case 3:
>+               return _interp_arp(pi, len);
>        }
>        return ULOGD_IRET_OK;
> }

Unfortunately, i don't speak C ;-) I understand this change,
but i cannot see all consequence,

Any chance that it will go to ulogd itself? Or i have to maintain
this patch locally only? (I mean for future versions)

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
