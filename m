Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEAD1420DD
	for <netfilter@vger.kernel.org>; Thu, 15 Feb 2024 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708035079; cv=none; b=ARYEsAmp9nDonDqc7lG3T1xeaV8sRTYMTmodisG26HdbvDM9A3UMxm8uzek/VCmE1xIOzrzih4RSVyj1dH92rR3OpzPbY14DU+30qQGYMNDXWZQ0H4mIEu7EzR0a02y9HLX90nSZ83qlovrBHXvlQ4S+asWCrdDRkSnQOTcfUz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708035079; c=relaxed/simple;
	bh=+oCxOM+6KP0D58c2NJwk+gnPRI7WxqS0IZdd945zk28=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HTvQnO+dRESwmZDvGlLA7eNhulFlkXnTJ0yFAODGAl3sggIlyPzNx8Wsz4CgBWE3T7oa1wIy0ZdhjuD10n30Dse4PjOc35SbKt9ygJSmyOtGreCiaQ7Q07PohV6dOuegFzFgAod67GCZCSAL5hA7BTRDxfnGTyIJSnOskE0vNx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tonusoo.ee; spf=none smtp.mailfrom=tonusoo.ee; dkim=pass (2048-bit key) header.d=tonusoo-ee.20230601.gappssmtp.com header.i=@tonusoo-ee.20230601.gappssmtp.com header.b=JPNxvoU0; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tonusoo.ee
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tonusoo.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tonusoo-ee.20230601.gappssmtp.com header.i=@tonusoo-ee.20230601.gappssmtp.com header.b="JPNxvoU0"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-607dec82853so9346057b3.3
        for <netfilter@vger.kernel.org>; Thu, 15 Feb 2024 14:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tonusoo-ee.20230601.gappssmtp.com; s=20230601; t=1708035076; x=1708639876; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RLyr0qwUCfEEIeBiEe003N5nkY4G5CcNlVtTpkJybJE=;
        b=JPNxvoU0d9Uqi2RIvtLunDl6v3WHTcysmgB13Gs/fkRUV6whhMdhAP79bElAFp8wHz
         Qf0Xe1doYxj5je1NltmbK3lTtn1X7EGtpmMZ6l+JkDlidfxJBp4O8VTRS5l2gx7FpOH2
         jmrD8YITvIOVkhNpSrRdU0Tb8LLxGeuvVbpImQlSSNGhxAC7n4em+MLMfUfWmnk5Iyo8
         AyIE/j/EQwjNBLbQPoPY/2ZtqkZdPkBatCAuHiGAQ8Jyb4bEAoCdR/3l9mgfN1zAwtzo
         xFkRGLIzNCtmphfrMZ3UadCRKYmXrUsMfagoDvW7NJSKSgYqKDOPvIwRPVm92yyCrBEX
         IFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035076; x=1708639876;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLyr0qwUCfEEIeBiEe003N5nkY4G5CcNlVtTpkJybJE=;
        b=FpGfmfpwgX4MU+5TNapDBO2j4nBBTuidOUx5JLu88loVIZWTgAd+/d5Flgloxhlvfw
         1Nm9Gm0OnTE1yepAfZZXcFVoGojGDCE5CwI3NmlKyWd+W61A15tOApf8hJuzMOPE4zyU
         XWrD5SQQqozshRkD5Sn94ej9GY1pyWyZ4uNsCanU4lhRXUPdq/oTDzgFCfTyppciXKNh
         Bg5P42RtTT3nfUujSEpvnhIm4qaQYfPvPMiJt0CDrLoLpBKQ20iMuBGpVdM44I/2HkDT
         dRCPA53hvle8v372pBkvDSuhVKK7fmb7x+ltaHmCvozXV4Spa2wKRp6e5+INs8g67wyi
         OVIQ==
X-Gm-Message-State: AOJu0YxzeKVN6I/799nQXgSCGbVuNadmiHRIikdz6dMxPUZontEuaKMS
	kxxJLNNx4g7fG2bS0odLcJFpQIhCvexuNw/ZsN+mjeE1xZM0MfLs5qdEcSkH7MhCygAToMxmCOo
	/9/QHnsGPI8GPcJwhMR7HrooCFZ7OK66QFhif8fZwtkeq1gBB
X-Google-Smtp-Source: AGHT+IGD1GrAXvLgA1zm0gctJ6xUBJAePw+Z076sXe9x08ZM9HKScetZUaoEbqIfLFDM5y3et+gXr0r4jpu/CuM4P78=
X-Received: by 2002:a0d:eb12:0:b0:5ff:956d:8b7f with SMTP id
 u18-20020a0deb12000000b005ff956d8b7fmr3448780ywe.10.1708035075365; Thu, 15
 Feb 2024 14:11:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin Tonusoo <martin@tonusoo.ee>
Date: Fri, 16 Feb 2024 00:11:04 +0200
Message-ID: <CADJxXU+4Drt=Nmy6=Yv=aDkOmcaLR8bFkKvfpdC8XVs3-77Fiw@mail.gmail.com>
Subject: nftables and RFC 7084 section-4.3 L-14
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi.

RFC 7084(Basic Requirements for IPv6 Customer Edge Routers) section
4.3 L-14 mandates that if a router LAN-facing interface receives an
IPv6 packet with a source address from a prefix that has been
invalidated, then the router must send an ICMPv6 type "Destination
Unreachable" code "Source address failed ingress/egress policy" back
to source. For example, this could happen if the ISP changes the
delegated global unicast IPv6 prefix and host in LAN, for whatever
reason, keeps using the old IPv6 prefix. I guess the idea of the RFC
7084 section-4.3 L-14 is to signal back to source that the prefix is
no longer usable.

This could be implemented by sending the packets failing the RPF check:

table inet filter {
        chain prerouting {
                type filter hook prerouting priority filter; policy accept;
                iifname "lan0" meta nfproto ipv6 fib saddr . iif oif
missing counter packets 0 bytes 0 queue to 10 comment "RPF check"
        }
}

.. to an userspace program which sends the error message back to
source via LAN-facing interface and then drops the packet:
https://gist.github.com/tonusoo/6051bfbf0a0740dee62c4e0b0ed4e2ab


Can anyone think of a way to accomplish this without sending packets
to userspace? I guess the main challenge is the missing neighbor cache
entry for the source IPv6 address.


thanks,
Martin
