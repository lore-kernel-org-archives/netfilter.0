Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540913;
	b=g/F36HrABQv13mUil9IfAyKasTguSPAniv6ZF1BzO5xeUCRLcp7iD3CoH9yOC4x51i8t
	 b0A4MHLi1SvIXfIbySAPMnRZKP+UWwNuxZCn6iPXFNtG+6BgsW+gfxoNaaA+rZVbUV0oa
	 FhOuVhfsWTzoUwZlb8W7s1emWJNw7gRttkAJ4PSYXFO4YVFiRzALoEYrWEauGCp1/VHgp
	 UkYGYvwm6K6Kgm4ajHDh8TMZT60rD5DiHBIX27zMFFuBW25UzGX1JGTicBV0ezSxnTVu5
	 5kc5cofg3xcWDgQC8/thf6uZeNhXhBq2peWhAwhU38JolV679DhHVJeckcgod96BVhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540913;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/zHEQtazwZIcPkklKVaR+4zbdEW0/+QS2Fw8vvE41PY=;
	b=Y7FzVRLd7hzoPTT2+Cez//9jZtkJzM+fRozFFhOzQZfZ0R8QiXduWLjkaGVZX/yj1eWk
	 uslmo2jgG12BIf98l9anOS1HKtcgkvHIrr+M7WGaGHsxwAa75hju1be8PwJJJ3nEEy5zF
	 NV71Lowo/fG+bSXO0YXR1cPcPNJ6iKZbeI54MpKQxP00QXyfHzTo9H9UdTQ8k5PC/sEGq
	 /bM//JYm3f4PiCS2O8Yoya7us8HRuhueif8PbA49juZHNNaf/Hq9lqpt6fXz/UVfGY4Di
	 XgMNUtvijk3U0CvxUUOQ5Q+glgdigL/NHSLXeAsuBYu6w6c1h8yWvAF4ku8q/Nwb3GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=OJu5EP9p;
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B5606A324
	for <netfilter@vger.kernel.org>; Sun,  1 Nov 2026 13:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755B5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=OJu5EP9p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793540909; x=1793800109;
	bh=/zHEQtazwZIcPkklKVaR+4zbdEW0/+QS2Fw8vvE41PY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OJu5EP9pVVq5zOYyGAa2uzmn6ijGZjzFfe3VPM1hfPLEY9d+p/VqgPvUHmtEEH4zv
	 wB//TQiTp2AO0Xs+J5o/3230lIF9POcI5JDnUVM8Pcd6xf6IM3O3ne3ObnVXjHJc/e
	 q9LxPXz8ZG+CUkCQxFiPZQ2IaoNxfjfkBqnRDzOoPpOAFXXrWuGciGZfEOG1ndF0cW
	 1JRHnyJUDultCDVPC/4VWBd2oHybwxOvzqh7HLHhYx9wPjCtKVuj8kWYA3tdwwWEQD
	 /5p+zSOpj5UdxZpSL+V2bOm25Z2unbqeMP9dcuOuej0cQ/MjWpQleTk620vZTmyuup
	 QXeXX1+U1zxcg==
Date: Sun, 01 Nov 2026 13:48:24 +0000
To: Kerin Millar <kfm@plushkava.net>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Re: Changing iptables backend on ipfire 2.29 Core 204 firewall
Message-ID: <Yi1WzEXghjy8-l6AVs2_KBla1e1KsFciehucNeZLSbVlRpJAlp-mzdml2YFJ7M1Uty_2R84CGKtCozj7aroJfHky5tyCAZwRqSDCIBd29RY=@protonmail.com>
In-Reply-To: <e0e2e94b-2fc0-4b1a-8b50-bf419c554c7c@app.fastmail.com>
References: <tFPvjiny7aomwwtbNLJpjkgm6IgE6hF9RwKQuO5ZQG6PeyBvL5F4BOOm_7cQTXn-fNYkHZOAQ1rRiGA5QyTPdvTyl8CRMNetEBnnOzr4Glk=@protonmail.com> <e0e2e94b-2fc0-4b1a-8b50-bf419c554c7c@app.fastmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 56d11c19950ad5d360657762d1e1fb431419ea7f
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, October 31st, 2026 at 11:58 PM, Kerin Millar <kfm@plushkava.ne=
t> wrote:

> On Sat, 31 Oct 2026, at 3:21 PM, Turritopsis Dohrnii Teo En Ming wrote:
> > Subject: Changing iptables backend on ipfire 2.29 Core 204 firewall
> >
> > Good day from Singapore,
> >
> > My ipfire 2.29 Core 204 firewall uses the iptables-legacy backend.
> >
> > [root@ipfire ~]# iptables --version
> > iptables v1.8.13 (legacy)
> >
> > Can I change it to the nftables backend?
>=20
> Having inspected the ipfire git repo, the answer appears to be no, becaus=
e your vendor configures iptables with --disable-nftables in effect:
>=20
> https://git.ipfire.org/?p=3Dipfire-2.x.git;a=3Dblob;f=3Dlfs/iptables;hb=
=3Drefs/heads/master#l91
>=20
> Hence, you are probably missing the necessary binaries, including xtables=
-nft-multi.
>=20
> # command -v xtables-nft-multi
> /usr/bin/xtables-nft-multi
>=20
> --
> Kerin Millar

Noted with thanks.

Disappointed that I cannot change the iptables backend.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
1 Nov 2026 Sunday 9.47 pm Singapore Time
