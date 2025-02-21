Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710741D5AA1
	for <netfilter@vger.kernel.org>; Fri, 21 Feb 2025 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158007; cv=none; b=jcMnMFi0R3kt3NfZZ2+U6m1tCl2ZBxzYehQrdzWHFpk7+o4KWXlvntc94T0QZmO7abvdUBtCyLVOuGnaNB4bFxmyyXroSZRT1dl2wFOkWOwyJD5lYHBnrDOCtySybJnQwC/FhZyqwtiMWoYB/fkvRStlmAbootQkq/mDWdMuknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158007; c=relaxed/simple;
	bh=VCn8COR3rsTCrIRcSDvtVszMvpPYS3sd2oizWjjs15Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Rsogdcr10805epoVNb4xZB6eNErVdQ5nEU4oUIR4jttnWC/PPgZUxskDPrnRkuZM/gU9S2nvh8nqxvMKKoqpb+sjrQJRwsfnk2X5ZTuqoWoSy+JFCHz8MX+/RWrALQxonX37mS6GaDTIU4Io6cDhkzjget0yVnYJNKSZREOq5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=AlopihL6; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=iGJUYiaV; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="AlopihL6";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="iGJUYiaV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=W6ZqQMqEXAcxuhYU8+uvWGsekATcXF8hP4EFK+VhXZI=; t=1740158002; x=1741367602; 
	b=AlopihL6PMRQZZHl8r53nOt5WiR8QuX+MF39V/1KWP1sSnsghGOHHlB3SSy26O09KOs5RkYwbSK
	PXoCMVQSS0KhfNSYeueoUqh7B8hNqWOhU+8xn2eA7RVwyTnPWGihdBx0qEHPgttlzIOU+NG1Khq/0
	p1WmK7f6XM/GtDDgCDU=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=W6ZqQMqEXAcxuhYU8+uvWGsekATcXF8hP4EFK+VhXZI=; t=1740158002; x=1741367602; 
	b=iGJUYiaV8BvUAuUsDJmtbgZm26/6EIzuEabOZapd2UxkUr+jYxY8K+E7mJM2OL6ukJ2Q8NUORgo
	q/gGPPD3gAw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tlWaP-0013cJ-1h
	for netfilter@vger.kernel.org;
	Fri, 21 Feb 2025 18:13:13 +0100
Date: Fri, 21 Feb 2025 17:13:12 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_What_is_*supposed*_to_happen_wi?=
 =?US-ASCII?Q?th_automated_nftables_accept_rules=3F?=
In-Reply-To: <Z7ieg3BGT2gxXqP3@stodi.digitalkingdom.org>
References: <Z7ieg3BGT2gxXqP3@stodi.digitalkingdom.org>
Message-ID: <03148B08-C3E7-493C-AC87-8A011BF5D5BF@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 21=2E febru=C3=A1ra 2025 15:40:51 UTC, robinleepowell@gmail=2Ecom wrote=
:

>So my question is, what *should* happen here?  As far as I can tell,
>there is absolutely nothing the libvirt tooling can do to override
>my reject=2E  I can't jump between tables so I can't do like "jump
>libvert_inp" in my chain=2E  What's the right move?  Options I've
>thought of; I'm hoping there's something better:

Basicaly, you can "overide" reject in two steps:

1=2E mark packets accepted by libvirt (or generaly in any other rule)
2=2E exlude these marks from your reject

You must check in libvirt docs, If it is able to set some mark=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
