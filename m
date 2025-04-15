Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464EA163
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730584; cv=none; b=BvmElXzcD9fzt2CMwXzY0pLCOrjRQEHNd44f7grTpIBMxe2ybEXDZrXLZjc5gEARn0b28Nzxtt1eqKlus083TpQowPSk31+ob4OQewQ01VYCUBQepq2G18Gt6RMblJXLmjVVb78fyvTkoihXPA6M8YATsuR4SSMAsSAAxm3YBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730584; c=relaxed/simple;
	bh=uByh/h8vg+uUm5Yk0RuocQGpgX8EXCzuYqPCLSInFOs=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tLHqRxqWDoacJ0ABcQljcSTvLMOyISUeUWSnQDFrdvCyn+Sx8AOcL2QNrRm/MMTpjt53BKdB6woZNOYV0eA6uGNDTY0eisMqgSkMPQp2G5F/5el/7LZhReyntgs5oDFpx2s2GgzPXhAGH+N+uA4oqPM9X+IAIfJDIkmi3OULfdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=ScplZcJE; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=YdQNUXKB; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="ScplZcJE";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="YdQNUXKB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=D92JzdOvzv2SksVi5PAaRl/+SCvnu6FhqMkl4LNeCYc=; t=1744730579; x=1745940179; 
	b=ScplZcJEdCyQ2DqqVp98IlVU9X6tf+OyXkU6WYRpqeAuRGeoRZUFdat2LdxBACPybNLNq3SSh9I
	VnMaCmPo6fiqmun2rlHnl+N7vixezwDWyVFa5w1/fdQALgo7Tw5M7mkDkbFqFFFEh4bTs5Eh9jmtc
	JWjC0eJ+WcwWWaEa2hI=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=D92JzdOvzv2SksVi5PAaRl/+SCvnu6FhqMkl4LNeCYc=; t=1744730579; x=1745940179; 
	b=YdQNUXKB/u0VvAJNa5jDTQ4gso1aYHrE49MUrF3gzvYxRQtlFJPzndM/AKpDkC9SQ9ayliKUAkm
	l+Y1itTUPBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u4i7j-000F6L-33
	for netfilter@vger.kernel.org;
	Tue, 15 Apr 2025 17:22:56 +0200
Date: Tue, 15 Apr 2025 15:22:52 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: [ANNOUNCE] nftables 1.1.2 release
In-Reply-To: <Z_5vmAQdcUCOg86F@calendula>
References: <Z_1KxMUDT0D8e6wH@calendula> <d110693b-efa3-4742-8d6e-f56c83ef66ff@slavino.sk> <Z_5vmAQdcUCOg86F@calendula>
Message-ID: <01529A93-9DCA-4F48-8F80-C4CB32A11B43@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 15=2E apr=C3=ADla 2025 14:39:20 UTC, Pablo Neira Ayuso <pablo@netfilter=
=2Eorg> wrote:

>https://git=2Enetfilter=2Eorg/nftables/commit/?id=3Dda0bac050c8b258824272=
7f9915a1ea8bc48ceb2

Thanks, but i still do not understand, consider this set:

    table inet filter {
        set testset {
                type ipv4_addr
                flags interval,timeout
                auto-merge
                timeout 1m
        }
    }

Now i add one network, and one or two seconds later second
network::

    nft add element inet filter testset "{ 192=2E168=2E1=2E0/24 }"
    sleep 1
    nft add element inet filter testset "{ 192=2E168=2E2=2E0/24 }"

Currently (1=2E0=2E6), they are merged with timeout reset::

    table inet filter {
        set testset {
                =2E=2E=2E
                elements =3D { 192=2E168=2E1=2E0-192=2E168=2E2=2E255 expir=
es XY }
        }
    }

What will be result with new behavior? Will be both (not merged)
in set, each with different timeout/expires?

Another example is to add subnet of existing element, currently
the new subnet is not added (or is merged into existing without
timeout change)=2E How it will work with this new behavior? Will be
both in set? Or error happens? Or something other?

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
