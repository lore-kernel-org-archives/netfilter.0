Received: from correo.bersol.info (correo.bersol.info [82.194.72.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B213DB98
	for <netfilter@vger.kernel.org>; Tue, 23 Apr 2024 19:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.194.72.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713901803; cv=none; b=FnBvd1k3+OugmBVlcvrYUEihj1OUC8fdoP4XWac4rEFQqalNWYFSmNnCCVo4VV6u55Npg03VrogEBl5DmfGYbphGWaMMfoUMrKn67oxRoxtjrdKeAYJeAfkYMtHQIX7CYSWw0uw5kXG587y1VmPEVxVcD8H68GknIWG4FUbJRI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713901803; c=relaxed/simple;
	bh=ebVEj0LqfGI1YleERCJlXItqo6z0NPyjyC3P2SoKJK8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s5UltgeM6DV3utH+R68h4r9xfkFkHEuTi0Zc+S19MkfVfGVQf9qmdfN/jmx91Zw0mVG2nYoiEj5RhiyD3hGW5WFpaUXyQBOc7vwEnlf3xxSSDGfTQy389BoYpgUUpjnVsxkdbu1hyoMEIXxz4HOdRQNge10/570rfghkAx9dZKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bersol.info; spf=pass smtp.mailfrom=bersol.info; dkim=pass (1024-bit key) header.d=bersol.info header.i=@bersol.info header.b=PBH/4N88; arc=none smtp.client-ip=82.194.72.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bersol.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bersol.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bersol.info header.i=@bersol.info header.b="PBH/4N88"
Received: from PTLAALVAREZ1 (58.red-88-14-51.dynamicip.rima-tde.net [88.14.51.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alberto@bersol.info)
	by correo.bersol.info (Postfix) with ESMTPSA id 060AD205AF
	for <netfilter@vger.kernel.org>; Tue, 23 Apr 2024 21:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
	t=1713901436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kueqSD4PIlisQPY8CE/6nxsb11EON7iq6Ad/vSHEx5o=;
	b=PBH/4N88jlaQL5E/Ui8zHrg60B+YUdkzlEyPj09sCYZG89aiWcsQdcDxMT7dsH2ZNeKoYV
	ndU8DYfig4Wrrx5IPyfhiJ2yFkPI1w8rXHya0BXpfia68Zh1RW20rdrB0mws6uslDB1pTm
	H3ReiGZCWIJs/es2/7d3PenudiJSBXg=
Authentication-Results: correo.bersol.info;
	auth=pass smtp.auth=alberto@bersol.info smtp.mailfrom=alberto@bersol.info
From: "Alberto" <alberto@bersol.info>
To: <netfilter@vger.kernel.org>
Subject: NFT: Drop to Docker bridge
Date: Tue, 23 Apr 2024 21:43:55 +0200
Message-ID: <006f01da95b6$93fc6870$bbf53950$@bersol.info>
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
Thread-Index: AdqVtDQFv6MFsIKJREyK6mVh5QnEnA==
Content-Language: es

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

Best Regards,
Alberto

