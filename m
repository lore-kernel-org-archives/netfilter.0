Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B791CEADD
	for <netfilter@vger.kernel.org>; Fri, 16 Feb 2024 03:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708053123; cv=pass; b=OXNznIHn23iQvDxA+0QvYsnCtxBcjeAttaN6urHvtGTq7XpYFmd0/98mJjrOynOlpomgt5oP3H39N9Zk1dWeO9fS05PynQvMXW3twTn88CLVJ3ZS/3rcVwHBNYeknruXq8CUC+NYE52DoSpRIXky/Ulh1ZA1VcudN9noz92zb28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708053123; c=relaxed/simple;
	bh=r1g4/oGTVijwA1tRUiblXCej0DPvlexlA+Qz+5KwcfA=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=OtZgEam1hP+22XM/IS2S4wsA7REI8lvOiKv6RJb/qonND552P+3iwPtx4F65DsPCipMXAwShBOvEeBYcZqOJZzFQ4RqHFTi9DzRCFMNQU3+TBMZANShP7BBsdzyQZKNUqx/2f/qHacsIkH0Eq4Dd6LgquPEMclTswyaLxqp5N4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mailboxproxy.com; spf=pass smtp.mailfrom=mailboxproxy.com; dkim=pass (2048-bit key) header.d=mailboxproxy.com header.i=@mailboxproxy.com header.b=FABaFX6V; arc=pass smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mailboxproxy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailboxproxy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailboxproxy.com header.i=@mailboxproxy.com header.b="FABaFX6V"
X-Sender-Id: coasthost|x-authuser|noreply01@mailboxproxy.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 039AB40CB1
	for <netfilter@vger.kernel.org>; Fri, 16 Feb 2024 03:12:00 +0000 (UTC)
Received: from srv.srv40.com (unknown [127.0.0.6])
	(Authenticated sender: coasthost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 08FEC410DB
	for <netfilter@vger.kernel.org>; Fri, 16 Feb 2024 03:11:58 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1708053119; a=rsa-sha256;
	cv=none;
	b=QBqvfGXBBBvGP/WHapl8CQsHLi5XAL8u45y6x0Hi6GhRhRM1PBVhx3L+SghL06bHpNJTV2
	aki1ndadL8ugf9lns98KBsNBNHHapEQ4nXybIiG9m3IpGt69s8I9LFW8jYMUj2uYt4Lz4e
	okfu7h5/M1BRboaC4Mes9kZNnf72soboFghkbCmklPwTLFtk4Z5d24tgDmLbQuzSWYJt7A
	Id1FUB3A+u2tjS9+33Gin+5NE3y3ffpNeIEBdJF7zeO8UBtri2SXc25/IU3s6cENiv0EJr
	DKlH69WXE3H0uIm13gKlT2bD8uApRSuuK473ppq3nQ6ocLyj3l/FETV4n314dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1708053119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=r1g4/oGTVijwA1tRUiblXCej0DPvlexlA+Qz+5KwcfA=;
	b=fFsTpjBpOHwM/WcuJdLIi+2+MwKKI00PqrfT8UU3DJDzX6QeYrZHbxr3ZR/kzH3rBx/s+3
	+jecSwFVnVrYXPS1a+cSbqaK4MW9z1a9Pta64fdIU46tw47zU6WYPYmBoCuCXrhHamEXsX
	5MlL4NfFODvD1Ikygn6RxoLa38n3DzXqz6WyVs+zRimuBv0PBtT+uKwSaE/H9u8FMrnTVX
	PzRlzeyMM22BxVnbBwu3LKv2BkyahicRoBmSJVm82RaO33hFY6ASZQZDAund46q/RmQJvw
	00B4SUzPsF1GHQRXdOl2s3SS6IiIQ6CF6456LEagMfeUg0Q3n2gW5ex0UUIPpQ==
ARC-Authentication-Results: i=1;
	rspamd-6bdc45795d-l549c;
	auth=pass smtp.auth=coasthost smtp.mailfrom=a1863.netfilter@mailboxproxy.com
X-Sender-Id: coasthost|x-authuser|noreply01@mailboxproxy.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: coasthost|x-authuser|noreply01@mailboxproxy.com
X-MailChannels-Auth-Id: coasthost
X-Quick-Invention: 2e4290633e3db7c4_1708053119584_2435840171
X-MC-Loop-Signature: 1708053119584:3213036441
X-MC-Ingress-Time: 1708053119584
Received: from srv.srv40.com (srv.srv40.com [27.50.68.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.49.71 (trex/6.9.2);
	Fri, 16 Feb 2024 03:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mailboxproxy.com; s=default; h=To:Message-Id:Subject:Date:Mime-Version:From
	:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r1g4/oGTVijwA1tRUiblXCej0DPvlexlA+Qz+5KwcfA=; b=FABaFX6VTdsg/0raqXM5YsL+L6
	oBXnHWuXxZHXCbBHoeTRCPxcRohr5k2wIh/AaN010+DdxZzELV09KKwF4n3LrRYOimTgnNx7OIhbn
	M4UN2s2IiwTgQqJ0j5e6l2+67xgIc0GOGHVLL+TE4O8rGvsi4R936UqT39RtU/3hqMQEdQY+dx6XL
	mOvG/Vzbsc63Diast2fkABGRQVRuzeAhcwN6VqWG4pc7zCUVjncaaMd7J0JXXXDQyNHTNycFHNhh1
	VzxwnGkVUcCzRQrvg2ung5TRJvyD9XXFs+T6iMqbiuYbxkieH3GoejjPYe1MY+meY1besbyeSEiYS
	TyFaEsoQ==;
Received: from [1.146.221.18] (port=1482 helo=smtpclient.apple)
	by srv.srv40.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <a1863.netfilter@mailboxproxy.com>)
	id 1raodl-00Bpy2-1a
	for netfilter@vger.kernel.org;
	Fri, 16 Feb 2024 14:11:57 +1100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: David Hayward <a1863.netfilter@mailboxproxy.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Fri, 16 Feb 2024 11:11:42 +0800
Subject: nftables HOWto Wiki Question
Message-Id: <43E44345-7B31-43FD-B763-0C93DF290890@mailboxproxy.com>
To: netfilter@vger.kernel.org
X-Mailer: iPad Mail (21B101)
X-AuthUser: noreply01@mailboxproxy.com

On the "Quick reference-nftables in 10 minutes" page, under "Ip6" the entry f=
or "nexthdr <header>" shows "icmpv6" as an option. Should this be "ipv6-icmp=
"?

Searching I seem to find references to both so I am wondering if this has ch=
anged.

Happy to update the doc if required, but want to make sure I don't introduce=
 an error.

Thanks David=

