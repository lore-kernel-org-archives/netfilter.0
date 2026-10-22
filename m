Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=129.13.231.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674921;
	b=zk8oypO3ZhEWTMKrSIzXgxcdmwjysAo8DQl6Djt87234QeVDYAP9OHHYC13tET/zqR3g
	 ztbgz4y8J6kH0tTwAd4uCS6QsFzVrifp9+bVeJpUgoL0uDYqucGx9JyicVzyHVO7Dnya2
	 8f4Igsf4nNlm/xKkymApTQ9rZuT6MM8a2PGedpHJbs0p7E8IclBEOpj9g45Wi+UjX7KGt
	 QhNMYMHEIEWLyGj9OpFSj3ENzfIH9V2Xl3ISGTLpwTz4Mvfsa9Vy5/Q2CobDXBs+IriKo
	 IvufARw7oiWg+AvQ8DZ1vXzWK5MvhuApTFOqEIy+h4Cu2drWAFzzKiSUSEeoZT1pgkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674921;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:
	 Message-ID:Subject:From:Reply-To:To:CC:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LkvhNkKWJw15O5WuB98DaSp3CqST2vNJgroqJQrO1N0=;
	b=zfsjOsq1pHOLgA7MjL/JzG3c6icEciqhTYMUl15rN7eGOh48a4vDofN++9nms3tDnJBU
	 fpWIJAnN8z4Bc8aHFKY7EVasbcUtug2tZURHurP9qi9LDyU1dafQZVPFk9xO6bzJGFe2W
	 7A7mwsyBCfpI8cYPMBIdklteVm3SLGRxWheC8JP59BYYDsOWF+sobwSaoAVOO4J9yGyTJ
	 cnR/DH+BwG3/zYa3ah/YR52GanUqcHYoFZ6XZyQmGxWjYNn5kIdux5LxrPwWkBV9Bqe7g
	 FB8I0AIji65R5aI+j+yfP3DGnWWADBznseNWt+7t1FBSCZhgVTHe7HlUQ++qCRLbzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.kit.edu;
	spf=pass smtp.mailfrom=student.kit.edu;
	dkim=pass header.d=student.kit.edu header.i=@student.kit.edu header.a=rsa-sha256 header.s=kit2 header.b=fnbNJxUW;
	dkim=pass header.d=student.kit.edu header.i=@student.kit.edu header.a=ed25519-sha256 header.s=kit2ed25519 header.b=uqEPnxtr;
	arc=none smtp.remote-ip=129.13.231.82
Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [129.13.231.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67BB606A31A
	for <netfilter@vger.kernel.org>; Thu, 22 Oct 2026 13:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.kit.edu header.i=@student.kit.edu header.a=rsa-sha256 header.s=kit2 header.b=fnbNJxUW;
	dkim=pass header.d=student.kit.edu header.i=@student.kit.edu header.a=ed25519-sha256 header.s=kit2ed25519 header.b=uqEPnxtr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LkvhNkKWJw15O5WuB98DaSp3CqST2vNJgroqJQrO1N0=; b=fnbNJxUWT11wDGl7IQy/Ps/9lh
	rqJRsTp/G79CRXeI/IB3MStrIqmAlACrZLjuDDAsQjfA+GjS6VJrPL1NTp63+ojURQMwHmbU9q2gQ
	9r7C7TktIMu9qyUVnHmCYvzPpGWBZut/5kUB0AFJBHRKIvUp1d6LA+b9xqJFqhAuPuwqllm09cyJO
	gwZpRWAL6hE7c9Zfuj7OsteoCB5WcHfcwzpEp66MzRmhmBnJZneW7frQx70B2fxo9y9fELXey8rYA
	z1j2VuLAG3H2rRV46vjfYTfcJnHTIptGb5ntk8Bf5rO2OZpIE/R1j+xy2yEOBpcdxeIQmYBBbRWaW
	nIKc5Uyg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2ed25519; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LkvhNkKWJw15O5WuB98DaSp3CqST2vNJgroqJQrO1N0=; b=uqEPnxtrIHYsodxapvUCxSa8XE
	pX8w/WdvbXxspfe5mPYerRBOpT+vGVFKC4um09PCFZaujNtF/Qr2iTKVjUDw==;
Received: from kit-msx-41.kit.edu ([2a00:1398:9:f612::141])
	by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
	(envelope-from <julius.rueberg@student.kit.edu>)
	id 1xJsdO-0000000EtRF-0qR7;
	Thu, 22 Oct 2026 15:15:06 +0200
Received: from [IPv6:2a00:1398:9:fb03:4074:b085:84c0:8518]
 (2a00:1398:9:fb03:4074:b085:84c0:8518) by smtp.kit.edu
 (2a00:1398:9:f612::106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 22 Oct
 2026 15:15:05 +0200
Message-ID: <8b03ef541269cff566c220ebc1ea34c77b303dad.camel@student.kit.edu>
Subject: Re: userns packet mangling
From: Julius =?ISO-8859-1?Q?R=FCberg?= <julius.rueberg@student.kit.edu>
Reply-To: <julius.rueberg@student.kit.edu>
To: Florian Westphal <fw@strlen.de>, Richard Van Tassel
	<richard.van.tassel.work@gmail.com>
CC: <netfilter@vger.kernel.org>
Date: Thu, 22 Oct 2026 15:15:05 +0200
In-Reply-To: <atKqWQwqM3AW7pil@strlen.de>
References: <CAGLc8_RABvE42M_1icBskniznt5-e2QLNd7g3Fku3bcw+2aE2Q@mail.gmail.com>
		 <atKqWQwqM3AW7pil@strlen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0




> Florian Westphal <fw@strlen.de>
> wrote:https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260905=
050150.30273-1-fw@strlen.de/
>=20
> is still pending, and its closing known security hole.
> So no, for now we can't re-enable this feature.

Just out of curiosity, if disabling packet mangling for userns closes a
security hole, wouldn't this leave LTS kernels, which to my
understanding have neither your fix nor the disablement backported,
vulnerable?
