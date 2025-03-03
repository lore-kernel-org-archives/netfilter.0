Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B61F03C0
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741040417; cv=none; b=JW8JHl/BrjYPG8KVXguAUmi4LHJOr0mD3B1Ot37XGUmQNEhxF1mxQK73OjYXNE8E+H/HIDYzU4gq99c1qC0ZKYDzphX+2+vLlBWAMRCNv0qouKca39IrdJ4Wxlhkzep3ROcYxHSOJJA2Gurb3NO4Sq/SgB96C/elDuUjDI9hIaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741040417; c=relaxed/simple;
	bh=zAkX4wcRnB1DYMNZutq/aXyan53uWGmYBlu7cHfAsAI=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=C79Q8V047m9mQXgtMTVHh3hJOFcv9HR46llPsZdDa2ZJUz/o14IPciByKHaDMwdzVg0psmVHoo3kbHwMIvRPZhT3O2UAWx9dCEVXWW5XVnMwrsVMPaVswZKkSVTpLKVLHXrlgFm4hiKsKtYuywCgvjRQ/MkCce+dxo+leOJgs0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=D+C2rOp/; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=NMLnzxsm; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="D+C2rOp/";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="NMLnzxsm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=zAkX4wcRnB1DYMNZutq/aXyan53uWGmYBlu7cHfAsAI=; t=1741040415; x=1742250015; 
	b=D+C2rOp/LCvTt9FzRk9Ujic2IiOOoCI1RGLsqsa/xcm1IfleaJ9+6dmSTzYkyIjIkWI7MEhNkq5
	L0vgwVa5aXwLo9gxUccvIz49TRsWtc57PR/XKx/nC09v0yly2vcQeL4G7Od2s+4mySyK1b46H5RLu
	mXDGvQl5LAxQEQfZ/ZE=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=zAkX4wcRnB1DYMNZutq/aXyan53uWGmYBlu7cHfAsAI=; t=1741040415; x=1742250015; 
	b=NMLnzxsmfatkkUZSm5NvTSi8lUwYaWQAEwR4zoCycoPwBUEOR/wJP82rOig8U3aMMdjYSaMVcS6
	Sx3QHGZIdAw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tpE8z-001v9f-09
	for netfilter@vger.kernel.org;
	Mon, 03 Mar 2025 23:20:13 +0100
Date: Mon, 03 Mar 2025 22:20:09 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
In-Reply-To: <20250303220334.GA19712@breakpoint.cc>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk> <20250303193533.GA16225@breakpoint.cc> <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk> <20250303220334.GA19712@breakpoint.cc>
Message-ID: <02EE0387-0B06-4D5D-BD52-EE85EE9A2F90@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 3=2E marca 2025 22:03:34 UTC, Florian Westphal <fw@strlen=2Ede> wrote:

>Can you test and report back if this works?

I have that in my plan, with a little luck i will patch
and test debian stable's package at weekend, with
more luck even sooner :-)

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
