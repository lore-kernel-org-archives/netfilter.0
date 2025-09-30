Received: from purple.birch.relay.mailchannels.net (purple.birch.relay.mailchannels.net [23.83.209.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD1C86352
	for <netfilter@vger.kernel.org>; Tue, 30 Sep 2025 02:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.150
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759198708; cv=pass; b=r3Joer+FrWTWyg87vAB7TmBmItd+iJpZM8UB7pl1TLIdlV9KT5PcAF/gmbRomhNC7M6O5z2Mv1VokPp09I169CKmjvsYyLHmE0PU/alCpMfN6CIDK0YnQ7QJhJp1zO12qLfFu88dii4J4wNcCUddXNcLiEePGcCb8ONQj8wObp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759198708; c=relaxed/simple;
	bh=MaS8SJR5QFECPQlKzve6XVbFnyxJKpNK606CTsQsXpE=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=ZSKuZg4yZDvJmXU5D1jjCMsG8wjHJhOaDTPmsXuTd/lhBMuyRtRfFhTEfJ6n6gUBBc5xcPSesRDfwM42hMcl7NePmTFdzOaS7SN5lSqkVKbcpy+xl1IIWVXsn4vu+vuT+KGqXAzishggIfvgl99HwklWsATDvd2R4LvkH/zUHNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.209.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 696BD8A04AE
	for <netfilter@vger.kernel.org>; Tue, 30 Sep 2025 01:53:28 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (trex-blue-5.trex.outbound.svc.cluster.local [100.109.34.121])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id C5BD88A0A91
	for <netfilter@vger.kernel.org>; Tue, 30 Sep 2025 01:53:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1759197208; a=rsa-sha256;
	cv=none;
	b=JXBaNbEinYQGo9dAoI4kBU162oqNseLhgodoe0l1JKzGZdU4HK/B6L4qLQsou32Zn9P9bd
	TMjE2KyYbE/g6dP5YlV6o7P4lFucIDiTchJijHkx8zIbPdqTkJN3n1FwvISoxv4xcc0nit
	XRkA5wJ/TWbCU5o4LgExHAOvzFsThNsoBJyXn8VuLOOlNP5MIFU/0xbRj7CzOKSbxNcue1
	hJGsukKmJ+yon9Hz3K0aeppItJF1JWhXDgKdpgPpn7//8zPG9t1CbD+rg7zV6gJQ2t654m
	6L6/Ba6w47rLVIFCrbZD1qmC45IoWJuDpuYs01lRlgjHsN458Oipp1ZFfPn97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1759197208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+7osOp5Uk0y+C9f7Xrq6EfE7YrMb5p232FLlCU4+APU=;
	b=z+2W+XZ/b2j4nL1EP27TDl0XtOo2YllWa1717fPtqTXLpfdSWnv2TvjVGSIkSHPamjGQNU
	iP25RHOkJc8fBaWg3AeUgvt/j5SRtu17sTjB/2fNPs7GCYtxaManQHDNdpyepGLRV9VgHI
	fVr508Q0wWQxe5Uu8OApsnR8nX/IzoAW+9AkJo/YkyJH7NeeG1PzqdRTt4hC/05qPNHC+H
	PsnmHkLu9gSkfwpVfW1Bh+fIukX+SPqJ6UoaMhnVkq6KH3JSR/C3OAPi8SF301XGhkQ99n
	qk9iv7Xw4lzpF+Fw/h36FxyXGHzxDNq2GOBpBtytrwY0kEWcl+fncuckhqrhww==
ARC-Authentication-Results: i=1;
	rspamd-867694b6c6-mmmr6;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Juvenile-Befitting: 7fed8ecf38ecaabf_1759197208310_4253736870
X-MC-Loop-Signature: 1759197208310:2452123960
X-MC-Ingress-Time: 1759197208310
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.34.121 (trex/7.1.3);
	Tue, 30 Sep 2025 01:53:28 +0000
Received: from [212.104.214.84] (port=29624 helo=[10.2.0.2])
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <calestyo@scientia.org>)
	id 1v3PYU-000000048g8-3dUY
	for netfilter@vger.kernel.org;
	Tue, 30 Sep 2025 01:53:26 +0000
Message-ID: <db91f59a7a80fa48a46edbd90bf5da8a65dd6c3a.camel@scientia.org>
Subject: nftables: conditionally enabling rules?
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: netfilter@vger.kernel.org
Date: Tue, 30 Sep 2025 03:53:25 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-3 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org

Hey.

What I do is about the following:

I have one main rules file, with some basic rules like:
   table inet filter {
   	chain input {
   		type filter hook input priority filter; policy drop;
   	=09
  =20
   		ct state established,related accept
   		ct state invalid drop
   	=09
   		meta iif lo accept
   	=09
   		icmp type @drop-icmp_types drop
   		icmpv6 type @drop-icmpv6_types drop
   		meta l4proto {icmp, ipv6-icmp} accept
   	}
   	chain output {
   		type filter hook output priority filter; policy accept;
   	}
   	chain forward {
   		type filter hook forward priority filter; policy drop;
   	}
   }
   include "/etc/nftables/rules.d/*.nft"


Via the include, any other rules can be added (e.g. allowing ssh)
merely by placing an according file in the directory.


Similarly, I'd like to be able to choose between strong/weak host
model.

Ideally, the ruleset would default to strong host model, via something
like:
   nft add rule inet filter input fib daddr . iif type !=3D { local, broadc=
ast, multicast } drop
and only if some use-soft-host-model.nft is placed in rules.d/ it would
remove that rule.
Also, I'd prefer to avid any scripted generation of the rules... with
that it would of course be easy.
Also, no workarounds that cost performance, e.g. by adding the rule in
a regular chain, and have the included file flushthat.

How it cannot be done:
- I cannot simply set the rule in my base file and delete/destroy it in
  some included use-soft-host-model.nft file, because AFAIU, I can't
  really get the handle of the rule or manually specify one.
  So that would only work if I resort to scripting.
- I tried something like:
    define hostmodel=3Dstrong
  (which could be re-defined to "weak" by an included file)
  and explicitly include ".../$hostmodel".
  But that doesn't work either as var's aren't expanded in strings and
  include doesn't accept the plain var.

The only that really works is e.g.:
- insert the rule (in the beginning of the chain) via the included file
- include "/etc/nftables/hostmodel.nft"
  and have that be a symlink to either weak (empty) or strong
  (contains=C2=A0the above rule) file...

But that wouldn't give me the default-to-strong.


Any ideas? Or is there something like conditional importing?

It would be nice if one could e.g. simply say:
  include "foo" if $var eq bar
even better would be, if one could give include a further parameter
that ignores non-existent files (which right now only works with
wildcards).


Thanks,
Chris.
