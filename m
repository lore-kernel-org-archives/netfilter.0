Received: from correo.bersol.info (correo.bersol.info [82.194.72.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BDD12C493
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.194.72.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714054468; cv=none; b=VnWCZgPoWOrzI0l+p2EU7psoZCNoiwLYE2qHxzag9g1XPHxxj7ML286Xp0OAIrflPOKOLJlqvld4k9HF3QJI/wBblFkLFudemzV6X12rKaxuum6ht7rNV1efua3vqMIwkHst1bEeJX2ADlHOahaL0yiw1/FrtInTE3Dj02dEUOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714054468; c=relaxed/simple;
	bh=vZUzVsWT52A5M4BHYZqQubZ2IIpbGI+UCx5UnvTiPvg=;
	h=From:To:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=VCW3i+Fpc1Muo54K0H3Yl+dvnAgOxA4jg3Flj5Ou94WE55p1ib8qbNKEgQpdx1R8To7/6xp72pdAjOqWHuJTNMZU2t7iinIj47NCNd9Wc3rgSn+HSxJ8q55noZNhToBm3JUwmMCrn1or+ZOb/Q5odGautCXiVHn11eSe79tcOME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bersol.info; spf=pass smtp.mailfrom=bersol.info; dkim=pass (1024-bit key) header.d=bersol.info header.i=@bersol.info header.b=x/WYywQM; arc=none smtp.client-ip=82.194.72.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bersol.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bersol.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bersol.info header.i=@bersol.info header.b="x/WYywQM"
Received: from PTLAALVAREZ1 (unknown [217.116.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alberto@bersol.info)
	by correo.bersol.info (Postfix) with ESMTPSA id 823F5208DC
	for <netfilter@vger.kernel.org>; Thu, 25 Apr 2024 16:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
	t=1714054456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXCTqthqVGdsBEtzqMwfMBZfYccuPKsbP9PwsimFXjI=;
	b=x/WYywQMUjOWUU9AbGILCIt8ID5iEIKQSXA1pbkocM+CJMPlU8GpAAC2nYTtcSIJ8985h0
	5DbtG8a4fCvWznBvXRbucR+hnWiuneeCeJbzb9SnlbTCZqnLFZ3vGkkTZA67Zl/WaSnqXH
	Oc70fK8i0SAiA4Y7Qo4RhqovfsVWNvU=
Authentication-Results: correo.bersol.info;
	auth=pass smtp.auth=alberto@bersol.info smtp.mailfrom=alberto@bersol.info
From: "Alberto" <alberto@bersol.info>
To: <netfilter@vger.kernel.org>
References: <006f01da95b6$93fc6870$bbf53950$@bersol.info>
In-Reply-To: <006f01da95b6$93fc6870$bbf53950$@bersol.info>
Subject: RE: Drop to Docker bridge
Date: Thu, 25 Apr 2024 16:14:14 +0200
Message-ID: <016201da971a$db52ee00$91f8ca00$@bersol.info>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGSfQKujqa/PfXsQ9Bl9eJyIFgiTbIJOpaA
Content-Language: es

-----Mensaje original-----
De: Alberto 
Enviado el: martes, 23 de abril de 2024 21:44
Para: netfilter@vger.kernel.org
Asunto: NFT: Drop to Docker bridge

Hi,
I'm configuring my NFTABLES policy with the following scenario:

- Eth0: Wan Interface
- Br0: Lan Interface (bridge with several ports).
- Docker0: Default Docker bridge (unused).
- br-9028b4c107a5: Docker bridge interface between operative containers.

IPTABLES Policy Docker is disabled ({ "iptables": false } in
/etc/Docker/Daemon.json), and I define global policy.

I want to define a Policy with Access to WAN (eth0) for LAN (Br0) and Docker
containers (Br-9028b4c107a5) interfaces, but without Access from WAN, and
total Access between LAN (Br0) and Docker Containers (Br-9028b4c107a5).

My Policy:

table ip alb-nat {
        chain PREROUTING {
                type nat hook prerouting priority 30; policy accept;
        }

        chain POSTROUTING {
                type nat hook postrouting priority 30; policy accept;
                oifname "eth0" ip saddr 192.168.1.0/24 masquerade
                oifname "eth0" ip saddr 172.22.0.0/24 masquerade
        }
}
table inet alb-fw {
        chain BASE_CHECKS {
                ct state vmap { invalid : drop, established : accept,
related : accept, new : accept }
        }
        chain INPUT {
                type filter hook input priority filter + 10; policy drop;
                jump BASE_CHECKS
                iifname "lo" accept
                iifname "br0" ip saddr 192.168.1.0/24 accept
                log prefix "[NFTABLES] Denied: " flags all
        }
        chain FORWARD {
                type filter hook forward priority filter + 10; policy drop;
                jump BASE_CHECKS
                iifname "br0" oifname "br-9028b4c107a5" ip saddr
192.168.1.0/24 accept
                iifname "br-9028b4c107a5" oifname "br0" ip saddr
172.22.0.0/24 accept
        }
        chain OUTPUT {
                type filter hook output priority filter + 10
                jump BASE_CHECKS
        }
}

But always can Access to containers from WAN.
I don't know why, because FORWARD Chain is DROP.

Can somebody give me a hint to solve the problem?

I answer to myself (if anybody is interested)...

Problem was BASE_CHECKS chain definition:

Somewhere I saw three states in stablished connections phase (new, related
and established), but "new" state was the problem.

I remove it, and outside Access to containers is gone.

Regards,

