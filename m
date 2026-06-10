Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD21B6CE9
	for <netfilter@vger.kernel.org>; Wed, 10 Jun 2026 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052727; cv=none; b=fAT+b5TdxeGfPR52MxOBTA1ML3ZKNKTAdP6PcKFph3a3okc6zzVTPyCh2wgSrSSdGNvTLXh2Q8l+RpkUcHZdY+dU+rWOo18TcAFDcEB1TbHiFge84EIyyXT0TbsrvPpBh8f+u3qSA8DWuYlvU0FOczUHQ9O/FUs+0EnfXUc3A6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052727; c=relaxed/simple;
	bh=z6ht/lPhAO2MdS7yLTE+/vRnsZvRTyLjFKBIe4QC2Fk=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uP6mBPsw6UiVl+XPK84q2eApEwTs8RjmMRh54fvZ3YFecXUsJjjbDSTjGUw9Rp9mcKpHkDc7U3oDWalbFk3GXtcgZQ1+ZLX1AJUFdHsNv4J3htjzStaBDkgwGlHY5VOSJgjE8VahA1FM0bEzk2x6F6ftc0DXo1Hs5gVD2jQVwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=hGtwFYp+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zl74Ro5Z; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="hGtwFYp+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zl74Ro5Z"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 3C81EEC0273;
	Tue,  9 Jun 2026 20:52:05 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-01.internal (MEProxy); Tue, 09 Jun 2026 20:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1781052725;
	 x=1781139125; bh=tyTE9OCV3joTvpwC2yUFBsM7aCRlpFdesZIM8pFq6XM=; b=
	hGtwFYp+NzlJwB75mz38cay1BIOQ3tslnuEibHCbJffgZvFfpL6lbi4TkKOROVBA
	yov8E687t3DfC+uQF3hU+naHVD1b56+FZTf9p3bB2qyeo2uAf0QDBy6+tl2b8ty/
	iCD0pNu1F7e+tSvzrWYRJdStFGE8aehBrJ1HOMyVVcmAE+aen9X/EfP0954r6lWZ
	j5WObCajgp186PWcTDaCS3HYO4vZT2b5Asbaq1gDW5DeTxRGAiotohHBU27ENuBP
	dw4ihCw4cuuEI7l22e7oMSRNEAV+CESuoiB2YJLixaADHg766pM928thlXqjjyKe
	hhSVhXqqog2OK2AxuOYV5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781052725; x=1781139125; bh=t
	yTE9OCV3joTvpwC2yUFBsM7aCRlpFdesZIM8pFq6XM=; b=Zl74Ro5Zk7bLVUA9l
	Q0zNOLmsHmoMMVhetECp8czU8jnRrk3M28Y26vsD2Jeh2WXfe8vBtPpzAyDi1Zhj
	tj2b0Luo0s7mqNQoNp4uRbxdMEaDHJLYutdZ0FgVnwXT37heFCn5AGro1kwHKuL8
	wn0PyN8fN8xy44yBFsasYT3i5fo9v+6F5ykJSSJKlgxtssCo/qSIs8aqNfdAH76u
	Vh5HTb77sz7PqOP/shuQ77Dt3dxEbCc6rrUCu+xmxB6mWuwgY/uZFYVHh0YEOSTZ
	eaQy6FJ27wZL32AKTsHfV5vkLrOzEOUU801l5XFUck78yIc5f+qm9m+5ChqBtiJB
	20XGQ==
X-ME-Sender: <xms:NLUoan7kmrVZzpD4Qt20qjOpUcq7S6kE0rLC5N6CO-MtTCm9V3FOcA>
    <xme:NLUoantR8z9AyMzWPJCJWj1Vo1eNtUIs6Hb5_Qq7YwdR_xcjU7zqf9hyD0r39Rg9s
    g6FZHA0Cv4JPiV8DUiC0MjoCea1aCNwWde5z8ButDwtOahEswUBLQ>
X-ME-Proxy-Cause: dmFkZTF6tKBSZnrYR/SkOhfGnvG5n+34cWcORYUyVxp82sLf2MTiXW4zQTJOqEkP7A72us
    D/f0gHEgh7712S+yaGqxdAGPfg3nifVcpJdv8TeETfq8EPjcZo9/96eTHjZRSRlVNPUqvf
    3lmKwjz6g+ov8XOdDe9Ddk0w6jLUxzeERdnSjWAbPqnpgTLz8Vi1j5vPUP3OkgdNW/5Ull
    lN7kQRluojVAAnV0+05drnRP4RHTuDsyH+P2kdzxlrdxTmtTTABRn68+5G0RrSCx1pp/S2
    2P+wTuCcqmatw2iOhAQk+hNVzNa7m1hDhAs8IOPtp62Lm33sZQ45JuZQBuS9ZOsuyde/ff
    Aswx37DSBh7HNbEQoxPJLDNpub+QnyMcCf6UNWK9eDguSh1s09kCniRnk3XVu3xCy3LrBa
    FoykxJ/hgboDu61lLcOcDqXMy8ryH/1UkwbGxuDtPdP8Smc36h7S001NFjI8vWZqYK2VTb
    qRgp/a7ppoFRS5hywQbUqMS7StHk/Oer9ih3nd5zhHaB+wKaNbMestLlUqMV5QgFoHJIBy
    YaKIgCnOnp+VWmPQqCDUFJRVm9CDY7fvIZaejFtVS83kfbU1KrIxmR/c92tYF1iyxcrWsc
    GkiVdK8TVudyOoBK5hpR95Ae8fnVXSIPCkoj11p6tKXH1Eo2Xw1c6VpEE5iA
X-ME-Proxy: <xmx:NLUoailnfxYPX6l6bYMzqCfIo9zzBe7Ay4s2F5jWrQzfIhHb-GqCOQ>
    <xmx:NLUoanwLlNoQOHw9tuBsbLVr0qiR_SYsXIGxm21NJtAtzIrN-0zeqw>
    <xmx:NLUoaoPJcBsFmKvsyoMmscjFguINwYjJPUyAqnq89QIuEyeBXqMKIg>
    <xmx:NLUoajRqbQCIV5EneVqAWa9cUeK_Ium9gyHgEEcZQLpmtWXMY4wdtQ>
    <xmx:NbUoamesztzRjmt0-7K1Pi-Om9-9ZGcbnQg-1tIxcQHaF8WLX2_EpyRw>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D69B3216008A; Tue,  9 Jun 2026 20:52:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbmbupR3g_CV
Date: Wed, 10 Jun 2026 01:51:44 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: "Randy Bush" <randy@psg.com>, netfilter@vger.kernel.org
Message-Id: <7b1ed82b-3bdd-4cae-bb08-7f8479778a7a@app.fastmail.com>
In-Reply-To: <m233yv2r20.wl-randy@psg.com>
References: <m233yv2r20.wl-randy@psg.com>
Subject: Re: prefix len confusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026, at 1:10 AM, Randy Bush wrote:
> [ old dog but new to this list.  apologies for fleas ]
>
> amd64 hardware, not vm
> debian 13, very current
> nftables v1.1.3 (Commodore Bullmoose #4)
>
> tl;dr:
>   o ipv4 ssh dict attacker getting through
>   o i am not an nftables guru; but a few of this have stared at this
>     for many days
>   o do i not understand cidr prefix notation?
>
> essentially, i am seeing the traditional ssh dict attcak to
> 42.642.11.82, when i think i am filtering 42.642.11.80/30, which should
> cover 42.642.11.82

Getting through to where? If you mean to an instance of sshd(8) that's running on the nftables box itself, such is to be expected because you have no chain bearing an "input" hook. The input path is currently wide open.

It could also be that you're expecting your "forward" chain to cover your proxmox guests. But if they are bridged, you may need to perform your filtering at layer 2 instead (or also). That would entail creating a table in the bridge family.

table bridge filter {
    chain wan-in {
        type filter hook forward priority filter;
        ...
    }
}

Incidentally, the iifname "lo" rule serves no purpose in your "forward" chain and can safely be removed.

--
Kerin Millar
