Received: from dog.elm.relay.mailchannels.net (dog.elm.relay.mailchannels.net [23.83.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381271EB5DB
	for <netfilter@vger.kernel.org>; Tue, 23 Sep 2025 01:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590317; cv=pass; b=cdosWCrFGaLFeyKIblD0dpXwKqupesG5xv2st1xPtp4IAncbt3DgaQsnoB8QPKXLAwT6l84d22wnWGDlypgnyULYLKhJmCK51H+xU1xpvsoFF1PVu/u8wEDQOg2Vt1FUmEM+zky8SxcAR1YcTI0gZ7Owo1/LYQ2UAcBJsKO30dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590317; c=relaxed/simple;
	bh=tQt+kgKIAhdb87sptOIXQOUdkVs5Hi6sVhh2fW8SAvE=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=NYK0i/v8yDbq/INjeCfcO7QXKidKX+63NqaAx5b2bO6SkXH1QidG+fBJRLQ7d1Vtv6nngHXCN9x3UPXl9WhxJpZ1tsHM00iWv7O4NHEUeowKaZDP3O7id203Byf9yngn1tuLMJwmQRRNdQgcTmLc8kmurpswMU73p4poSMjLGiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org; spf=pass smtp.mailfrom=scientia.org; arc=pass smtp.client-ip=23.83.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scientia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id AD995100E29
	for <netfilter@vger.kernel.org>; Tue, 23 Sep 2025 01:18:28 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com (trex-blue-6.trex.outbound.svc.cluster.local [100.109.34.94])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 001E01014E1
	for <netfilter@vger.kernel.org>; Tue, 23 Sep 2025 01:18:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758590308; a=rsa-sha256;
	cv=none;
	b=87sGT8U99FcGIhNEcgGONa/zkYEVKYZWgj85MZVQtGQGM9E3c5Qsretix0dLp+pkHmfDWY
	nlJIWCtIP84rkNd8k4CeKlRopga6hXqerlXTa89oNsA5PfTYXEJf3A21gJRSEcfJ2b+KYW
	snLoXI/jUxDYv3X+QJ3cSTdVZ/w3Kng3iFuEIfJOsXN3TPfQ5Am9wxE2FOOOrzxc4+4XEA
	TN82jYWHYggoPWddmjoZCQ/tV0XrGdl/fmKGLwcrgnUlcNdEQJ5Rnk/zUZibIJIkhOMVzj
	p6nA7fgJtG8cDBVvEIsau4qsipJmiBGSKLRcNJwovRzwc8+BQRAvFSgpLdmq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758590308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I92e9HF2SuQcLuWrfGBNXj0p0rx5HjYtOtbFpTeZ9bo=;
	b=Ud+hIYwtoisi34XGgyT8ldid+HKAgtBmLnrzv/17sUZivklqxvfGW2hdLRU+qo44shwwGh
	2GK+Wmf28T5GEiJnuVODcbnNGLuazVP92LbkuoLkMln3L+RrcXnqrc78LdxZH83MbY9emr
	szIg1u1GhOOGNxqIahV4blEBMYGMRGcGR6Cxvbs2XewnoexsMRR6nQMUXZLyr7LSD/BJHT
	E4bkaewGOM4CcNKDEH2R9MhXwDCQx/tKmwAtcclQ+iTXryJ8VxjTwHcrvnxj4o3g5AxhSO
	b+q1c8ONx9VtB9MOqWn6nJNh5Xg9VgGthkIwbka+ez8wpapWP+iIs1agVAiTQw==
ARC-Authentication-Results: i=1;
	rspamd-59b854cb4c-mrmsv;
	auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Macabre-Minister: 6066f1454ac94b84_1758590308520_3663946474
X-MC-Loop-Signature: 1758590308520:785317573
X-MC-Ingress-Time: 1758590308520
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.34.94 (trex/7.1.3);
	Tue, 23 Sep 2025 01:18:28 +0000
Received: from [79.127.207.171] (port=1450 helo=[10.2.0.2])
	by cpanel-007-fra.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <calestyo@scientia.org>)
	id 1v0rfm-00000008OVP-0jNL
	for netfilter@vger.kernel.org;
	Tue, 23 Sep 2025 01:18:26 +0000
Message-ID: <5a7d4a11bdeb50123e68df16726c4d1b461d2fd7.camel@scientia.org>
Subject: some questions on nft
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: netfilter@vger.kernel.org
Date: Tue, 23 Sep 2025 03:18:25 +0200
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


I'd have some questions, where I couldn't find the answer in the wiki
nor the manpage:


1) I there any difference between e.g
      ct state established,related accept
   and
      ct state {established,related} accept
   I mean the later is obviously a set, the former syntax doesn't even
   seem to be documented but is used even by official tools (e.g.=C2=A0
   -translate).
   In particular, is any of them faster?

   Same for others like dport.


2) When using the *inet* family (which btw. is really nice)... quite
   some of the examples in the wiki and other 3rd party places use
   e.g.:
      add rule inet my_table my_input meta l4proto '{ icmp, ipv6-icmp }' ac=
cept
      add rule inet my_table my_input meta l4proto udp ct state new jump my=
_udp_chain
      add rule inet filter output meta l4proto tcp
      add rule filter input meta l4proto { tcp, udp }  th dport 53  counter=
 packets 0 bytes 0  accept  comment \"accept DNS\"

   Am I correct, that l4proto has to be used in these, simply because
   the respective protos are matches as a whole, and e.g. the tcp/udp
   header expression cannot be used because one would need to add
   something like dport?

   But as soon as one does want to do that anyway (e.g. using
   tcp/udp dport or some icmp icmpv6 type), is there any difference or
   disadvantage when leaving out the meta l4proto match and just doing
     tcp ..
     udp ..
     icmp
     icmpv6 ..
   ?
   AFAIU, tcp/udp would just work in both v4 and v6 while icmp would
   only apply to v4 and icmpv6 only to v6 packets automatically.
   So an obscure ICMPv6 over IPv4 wouldn't be matched, right?

   In particular.e.g


3) I've seen examples like:
      ct state vmap { established : accept, related : accept, invalid : dro=
p }=20
   where a vmap is used, which is a nice way of writing it down.

   But is this slower (when it internally uses some hash or so) than
   e.g. two rules:
       ct state established,related accept
       ct state invalid accept
   ?


4) In principle I prefer the syntax as returned by nft list over the
   one using single commands, like:
     add rule ...
   is there any documentation on how the block based syntax is
   merged when using include? Or is that even officially supported?

   It seems that something like:
      table inet filter {
      	chain input {
      		type filter hook input priority filter
      		ct state {established,related} accept
      	}
      }
      include "x.nft"
     =20
   with that x.nft being e.g.:
      table inet filter {
	chain input {
		type filter hook input priority filter
		ip daddr 1.1.1.1 accept
	}
      }
   would actually merge (but e.g. things like table comment aren't
   overwritten.
  =20
   But no idea how his would be done with sets, etc.?
   Or is this simply a: don't do such stupid things?


5) Many examples use:
     iif lo
   or
     iifname lo

   Now first, if I'd bring down lo and bring it up again (like it may
   actually happen with eth0/wlan0 and others)... would it get a
   different id, and thus no longer be matched by iif?

   In particular for lo, wouldn't it anyway better to use
     iiftype loopback
   (which would simply match all loopbacks, regardless of their name)
   or is there any disadvantage I can't see?)


6) Probably not possible, but can one match v4 and v6 addrs in one rule
   (when being in the inet family)?
   Like in:
      ??? daddr @addrs tcp dport 22 accept
   with @addrs containing v4 and v6


7) Also not possible, AFAICS, but was it ever considered to allow
   using=C2=A0sets within (v)maps or even other sets?
   Like:
   set http_ports {
		typeof tcp dport
		elements =3D { 80, 443, 8080 }
	}
   map whitelist {
		type ipv4_addr . inet_service : verdict
	}

   add element filter whitelist { 1.2.3.4 . @http_ports : accept}
   add element filter whitelist { 4.4.4.4 . @foo_ports : accept}  =20



Thanks,
Chris.
