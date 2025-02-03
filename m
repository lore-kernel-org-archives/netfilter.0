Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE7204689
	for <netfilter@vger.kernel.org>; Mon,  3 Feb 2025 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583756; cv=none; b=cw5VWrdviUiLzUsTod6XqPHzF0icY5K/rqE97qFpQjX0nIvj+eB82Pyy/inEyZQdjmmsf+1nqjvGwRQ6btPBRE8ewhaJzutiS+4QHWTIMGvQ/Q4fLgEaGFzJ1JjtVSJdkJyMWtrmJeozz/VyjoLTlJHXfA4HeRm265u9x9hSNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583756; c=relaxed/simple;
	bh=7s790CPZHKZ0XM5sl6d1/cnAwhvQxWHwelXdZyOo4sM=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XxPYtdfHe3j8UouuiesUxYNL2m45eq2ewIOASZTOQLriv7ASEQZqwSXp5MQiJjbgD4m0j9cZtjszNyisW4Nj88Y90NejNr8wfmco3mbUee25AsG5jn+1wdZYUfoBn7CIScL/01IbxNbX5Y1Sk0XPlW/EO4vESpigySyKrJev9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=JuJPg8VL; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=kjuPedpO; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="JuJPg8VL";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="kjuPedpO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=7s790CPZHKZ0XM5sl6d1/cnAwhvQxWHwelXdZyOo4sM=; t=1738583751; x=1739793351; 
	b=JuJPg8VLwA4aWvcapfr10MH1Zy9vdZW6EM3Wq8gCASoBFuXt3ZK3UrqeNBz4JCyMWe8AYfX+0JS
	OGRyl+JOUvGaU6Pj8zcPKqzaktj65w1rTLMdDjtIWqfg0GzJmrG8n7RjF2apG9jJEwIR3pEnHBRf3
	2+FJs+ly1ssN3isOQG0=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=7s790CPZHKZ0XM5sl6d1/cnAwhvQxWHwelXdZyOo4sM=; t=1738583751; x=1739793351; 
	b=kjuPedpOpR0lMyHpF6bpd0Mx6lpETOemKJej+jUS6isOW+HJ73hx3tp24qB+hDkmXk5MPzUrFAR
	TOH/2E17DDw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tev3C-001tQJ-1F
	for netfilter@vger.kernel.org;
	Mon, 03 Feb 2025 12:55:42 +0100
Date: Mon, 03 Feb 2025 11:55:36 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Documentation_regarding_priorities_possib?=
 =?US-ASCII?Q?ly_wrong_-_clarification_/_update_appreciated?=
In-Reply-To: <d8c877f0-bdcc-4fce-91c1-f92d267d66f4@binarus.de>
References: <d8c877f0-bdcc-4fce-91c1-f92d267d66f4@binarus.de>
Message-ID: <82D207B1-3063-45B6-BA1F-E5531EA697D5@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2=2E febru=C3=A1ra 2025 18:48:47 UTC, Binarus <lists@binarus=2Ede> wrote=
:

>However, when setting nftrace to 1 in my ruleset and monitoring the packe=
t flow, I noticed that the chains were not traversed in the order stated ab=
ove=2E Since I am a netfilter newbie, I searched for my mistake for a long =
time, but to no avail=2E It is very well possible that there are mistakes o=
n my side, though=2E
>
>On the other hand, during my research, I have found a post [2] that was a=
n eye opener=2E The first and only reply to the question (at the time of wr=
iting) explains in great detail and in an understandable manner that the pr=
iority of a nat type chain is simply ignored* and that every nat type chain=
 instead is always executed at priority -100=2E [* The relative order of na=
t type chains that are at the same hook is preserved, though, according to =
the post=2E ]

I am far from expert, but my understanding is, that NAT is
special case, as it is performed by kernel itself at exact time
(hardcoded priority)=2E The nftables doesn't do NAT itself, its
NAT rules just instructs kernel if and how to do it=2E Thus "type nat"
chains are run all at once (in order of its priorites)=2E

IMO, one cannot mix (nor expect) that all chain types can be
freely mixed/interleaved (in mean of their priorities), otherwise
chain's type would be redundant=2E In other words, one have to
take into account the chain type too=2E=2E

Yes, nftables adds great level of flexibility (in compare with
iptables), but that can be hard to describe without being too
long=2E IMO nft manpage is already too long and have to be split
(and then extended with more details)=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
