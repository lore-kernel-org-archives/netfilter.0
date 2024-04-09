Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B573156F37
	for <netfilter@vger.kernel.org>; Tue,  9 Apr 2024 22:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712700292; cv=none; b=FD+4vvck+SDdafGb4+hlc7YZhbpADFOFwMK3OrAO5Hk5bMZNeqbCBVtCEG5TSZa7TsHyxhwSA136PwJj9IMIJOf4jjRIngMBBrip4WMonne6Nl63kwNirbhpaXK3aLJMz4IhZXZrkmALKpPFes6FBeTN0/QWebZL90vXB74+4yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712700292; c=relaxed/simple;
	bh=zJiZewUgCXO3/FVntGMtDJ0HUpuGeMOecSsn0YIYwDU=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Zxk95Le2rj3w3KdqdB2+MlklK1jrDYqUcU+t48Qqccck41z3lKAhKOR6l6uIMiQPVzLm8cWHt4eJzMJ+GM3Pzk7z/vhScJCICyC3yLQDW+IwEeZEAJwed5XUKFH36WRlsHTGjMKekEPijzvgp1nLx5P8lbVOZY074cWYTAZBRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=D97PboNB; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=yXEvIieP; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="D97PboNB";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="yXEvIieP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=zJiZewUgCXO3/FVntGMtDJ0HUpuGeMOecSsn0YIYwDU=; t=1712700289; x=1713909889; 
	b=D97PboNBFHk2DUO0Fkcj2MOGwQNt4Bc1yCcOFxfoHqO534IN4Me8j7L25xL3QKdt0St+CKXO4Vm
	IewTBO+0g4AqKRbm2Ten3WyBLhZT+hzMkSzMn6Fzkdl234Qtxozs9locfi401VaSRKu27b8jAreRh
	36FfA2YeqI3Dmsc31ZQ=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=zJiZewUgCXO3/FVntGMtDJ0HUpuGeMOecSsn0YIYwDU=; t=1712700289; x=1713909889; 
	b=yXEvIiePDEk0bUWy1E8Cn1GOwXv4j01Y1brRZSn9N6jt3qahKmq+oA1/luHP6w1bMNL7biY2F5h
	QTTeru5VKBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1ruJaA-004eXf-11
	for netfilter@vger.kernel.org;
	Wed, 10 Apr 2024 00:04:46 +0200
Date: Tue, 09 Apr 2024 22:04:41 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_Correct_way_of_setting_the_TCP_?=
 =?US-ASCII?Q?max_segment_sizes_for_IPv4_and_IPv6=3F?=
In-Reply-To: <20240409193300.2aef4ff7@localhost>
References: <20240408192441.657ac116@localhost> <3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk> <20240409193300.2aef4ff7@localhost>
Message-ID: <9AE2B9F2-FE7D-440F-A595-F015957ECBFF@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 9=2E apr=C3=ADla 2024 19:33:00 UTC pou=C5=BE=C3=ADvate=C4=BE "Will=
iam N=2E" <netfilter@riseup=2Enet> nap=C3=ADsal:

>But how do you know what that limit is? What about the RFC?

RFC 9293, sect=2E 3=2E7=2E1

AFAIK main problem of too low MSS is CPU increase, using
IPv4 limit for both solves corner cases=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
