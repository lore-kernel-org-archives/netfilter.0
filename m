Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B671EB2F
	for <netfilter@vger.kernel.org>; Tue, 10 Sep 2024 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725975062; cv=none; b=JQdK5uxsaxOHFMQUohJNHKGljQ0qSV6rfPgsYU4Uxbd5s3C7EVm/fAsIo9UJTv79moq9lCBqoDMerRUOdZK/BmpUeSeqrddMgPyZ69HZqsywvp3ULnyvrRQ4fXZAJ1XHHrJr8C7aiBjSNl5p/dqoJsdkexnUhoHlZx8NNRjT4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725975062; c=relaxed/simple;
	bh=HzpHCqCLAhYXFhUzhaL0gMfzYxDuWRYg3cm2TYtCvgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr8JUxtUdNA8S0e3yqpTbazd4jrKsQc3bSmy9cse5Rkt/dwxWvzhsmm/XJSucHQOKRS3PCGJ/6cHp92tCTLsydQnMjxRaGkaSfeJYfczObn1nqhy17iQgBORMWKP/uIGdkORTCfS3QE0q6Thcw1PVUZl8ZEy9EShMSk+M5Err9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1so0xH-0004gm-VK; Tue, 10 Sep 2024 15:30:51 +0200
Date: Tue, 10 Sep 2024 15:30:51 +0200
From: Florian Westphal <fw@strlen.de>
To: Dustin Lieu <whale_163@fastmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Issue Setting meta broute
Message-ID: <20240910133051.GA17818@breakpoint.cc>
References: <31a149f7-3775-46c3-80ae-5a11a389976b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <31a149f7-3775-46c3-80ae-5a11a389976b@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Dustin Lieu <whale_163@fastmail.com> wrote:
> Hello,
>=20
> When I try adding a rule to set meta broute, I get an error that says it'=
s not supported. I'm running nftables version v1.0.9, which should support =
broute. Does anyone know what the issue could be?
>=20
> $ nft --version
> nftables v1.0.9 (Old Doc Yak #3)
>=20
> $ nft add table bridge bridge_rules
> $ nft add chain bridge bridge_rules prerouting "{ type filter hook prerou=
ting priority 0; policy accept; }"
> $ nft add rule bridge bridge_rules prerouting meta broute set 1

Worksforme on 6.10:

table bridge bridge_rules {
        chain prerouting {
                type filter hook prerouting priority 0; policy accept;
                meta broute set 1
        }
}

> Error: Could not process rule: Not supported
> add rule bridge bridge_rules prerouting meta broute set 1
>                                         ^^^^^^^^^^^^^^^^^

Kernel lacks support, this needs 6.4 or later and
CONFIG_NFT_BRIDGE_META=3Dy or =3Dm in kernel config.

'modinfo nft-meta-bridge' would tell if module is present or not.
