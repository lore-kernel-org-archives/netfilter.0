Received: from e3i377.smtp2go.com (e3i377.smtp2go.com [158.120.85.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BE9211706
	for <netfilter@vger.kernel.org>; Thu,  6 Nov 2025 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762423208; cv=none; b=sgOB7KliJBtUCQ+1a4poaTeL5MOIX7mms2ao85mvBW9SiEDtPKYjP8ggwXwlx5vbxiXzUSrK6UwlB5lli/Lcain/pgmTXT/ZnPD5Ks/rfjJ1QFzp8AnvUYcdf1UhWGCGY0je9oV2OYxIsNT+idX2QCVg0JVhAcuWY1nePM2ho8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762423208; c=relaxed/simple;
	bh=/njXhueXg4Ov7/SpJzrrzfsLdGKsk2DUZCykGzjpcYo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rCsIZLLziStnHQVKH2NOk9WCPqaMlfNhasmw+946BYotMKYK6sxmLqllg8N5uw+kLz2TCzn0lfvaCYJRG5ZtAOXFiynwwmGm93jdHjpj3b8yqJ9wgB/Uev7LMDVbaq4pTBjYHZMlL6vGohwjYVZGDpyNGrBg/P4YyXtzoPQTUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frumar.it; spf=pass smtp.mailfrom=em856510.frumar.it; dkim=pass (2048-bit key) header.d=frumar.it header.i=@frumar.it header.b=mcgcVMw9; arc=none smtp.client-ip=158.120.85.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frumar.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em856510.frumar.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frumar.it header.i=@frumar.it header.b="mcgcVMw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=frumar.it;
 i=@frumar.it; q=dns/txt; s=s856510; t=1762422295; h=from : subject :
 to : message-id : date;
 bh=N1qHUJKHLT9bDXn11Fp7bB5dOD3MXGt6zB7vN2PV4A8=;
 b=mcgcVMw9TwYKryjwYli8v+yF5mdwtEL3JxGaLnhNe25AF5qWkY7TC9mQtcWhOmM+jF8MR
 0wlFDzdkkHvi4ruog/0o7YHBSRrp9bS+P6P3V1GTf/x4qWIZYzMwvHhksuKaKAnh9DPcFvg
 oW74Acr70QhzXPRJ9+y9hAXSP4uwvwjLQZo7/VVHNzhAmvoKuYGliaBEmq8j3nWAZXczKt9
 N6I59n5lFUhYqxLZHlRbwOwUcW77YogtEsWW+M0k6EQG0bAhWp/sO/ymRYM4K/G8sYBmrv7
 AfmHssqtrNgrUh2zw/dMrR9/BgUz7xhG92HofOsFXrKnVVIjegeSAiidOvKQ==
Received: from [10.104.244.142] (helo=frumar.it)
	by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <pierluigi.frullani@frumar.it>)
	id 1vGwY1-4o5NDgrkLcA-nEYr
	for netfilter@vger.kernel.org;
	Thu, 06 Nov 2025 09:44:53 +0000
Received: (qmail 2123 invoked from network); 6 Nov 2025 09:29:38 -0000
Received: from host-79-10-10-166.business.telecomitalia.it (HELO topolinux.localnet) (pigi@79.10.10.166)
  by frumar.it with ESMTPA; 6 Nov 2025 09:29:38 -0000
From: PierluigiFrullani <pierluigi.frullani@frumar.it>
To: netfilter@vger.kernel.org
Subject: coexistence between nftables and iptables ?
Date: Thu, 06 Nov 2025 10:44:52 +0100
Message-ID: <6842094.MDQidcC6GM@topolinux>
Organization: Frumar
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 856510m:856510aJvM5Q1:856510sYcym91WXY
X-smtpcorp-track: QpUd9RWVaTCP.ef1GAeD-F9XG.HkrL8ASj9hT

Hello all,
 first post here so please be indulgent.
I was wandering if I those two "technologies" can coexist. 
My problem is: I have a small machine that does firewalling for my home net, and on this machine there is also a docker environment. 
Docker use iptables for his internal stuff and for forwarding traffic between host ( and his net ) and dockers themselves. It does this by creating a quite complex number of rules and tables, which btw are handled by docker daemon  and scripts.

So far so good you might say. Well... no.
being that also my iptables rules are quite comples I used, when in need of modify them in some way, to flush all iptables and start all over again.
This will flush also all other docker rules so that the docker environment does not work anymore unless I stop and restart the daemon ( which obviously is not always acceptable ).

If I can use nftables for my firewalling and routing needs, and leave iptables only for docker, then I can flush my nftables whenever I want, without impacting docker environment.

Is that true ?
Is that possible ?


Thanks in advance and sorry for my poor english.

Pierluigi ( from Italy )


