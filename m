Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E051C5F
	for <netfilter@vger.kernel.org>; Mon, 25 Dec 2023 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NjMnkZkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1703517511; x=1703776711;
	bh=XE0RGXzi7SC+kE8ggyFgj5ePPG5WZgpIAXE6wYhBZ0g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NjMnkZkbXvJv7mHPpExuqSP6q0cKGx46PBkyqrTupS7azUS5D6yzB6L3/XXygPzvl
	 7nUs1feoH5Qt0SkpWlv0LVPvagvBZpnyIApC7Z3CPBTWD+1/yyNnA4ozWvNER/ag2a
	 73lUBjLcypLxP/RDmDb/zuusa8+13SXwZiOI7pb+KGqnuD3YqvMDzkrLlVlm7snQR8
	 /TPvi1R7VezGW7c86VWK2H668ahhs+zKOKlIfjbrTQ++VQaXENpiYYGEt8fHLXI46V
	 DnTxS8kOrzqHxYhGoiFeQzrbgwsvEaFTWuckdejgrhesv6ULUxJYrqQIQWEyLy1PJm
	 gssYCl7N0AjCQ==
Date: Mon, 25 Dec 2023 15:18:20 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: GUI Frontend for iptables and nftables Linux firewalls
Message-ID: <gWlcltRFErd-_-E7A8gU7pJ-fYuK14_lManl3-YmPcTUkN3RFTC9mC0MlGOTaJEnA5oevexn6K_al5Il39pSWU60-r6-9B3ZPQZqMnBl4lc=@protonmail.com>
Feedback-ID: 39510961:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: GUI Frontend for iptables and nftables Linux firewalls

Good day from Singapore,

Besides Webmin, are there any other good GUI frontends for iptables and nft=
ables?

The GUI frontend needs to allow complex firewall configurations. I think We=
bmin only allows simple firewall configurations.

Please advise.

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individual in Singapore






