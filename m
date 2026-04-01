Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8938425F
	for <netfilter@vger.kernel.org>; Wed,  1 Apr 2026 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044514; cv=none; b=of3lkMb08VOOg7eL/FU5lVGOgXoa5Qoai3LDYghQUW6FsFXgeCr5R6yyzTzMc2JF8/hXsgJ1q3pmMjTx0pNd2jYZoYWSm5vaqOOJzZtDcDqLVfudzEJ09KFrM0IaOmknNbDrjhvil+y1V2zRwnJu3D3GaQYgzMr1Kc7c5CgHfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044514; c=relaxed/simple;
	bh=C8CiR2BgbjbwtcWv51/Cyr6DZsWN5+Bxnfv3YYD4byo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oVT8L5WzMNIAlhAVHsXKZKRM+v6OEVHoPIX2+MRwp8eiley/O0+Tbay8JUSOAZVqonHMgwPG/T6yIEDeugB/q/kQlAne1eUx+P+RQViO46ZCOiOYejM3cDLmsrfV5x3BzF+2Obtxib/wymZfI1aPyxZCWHlGDeBwevK+OyvYls8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=NVnmpe1J; arc=none smtp.client-ip=195.113.20.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="NVnmpe1J"
Received: by nikam.ms.mff.cuni.cz (Postfix, from userid 2587)
	id C6179280F5D; Wed, 01 Apr 2026 13:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1775044509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5cVC2K7CpkRTvzty4zv+GDyHsacLOexiJByVMOZiq6I=;
	b=NVnmpe1Jw3hrChXhPLmKTuw2foOgntAxqtrMyjxc83sXk+VYacWV/D3hhng2ii8iaASmHi
	HtF7w61ll2iN4RHVJf/hC2ZTsa3vEHL6iRNl5S044M9dKKz7al8LmiNoJDXCT9Fn4lXUo9
	58XHZI58pKuHqCnXbfHQLLk8951Uw1o=
Date: Wed, 1 Apr 2026 13:55:09 +0200
From: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
To: netfilter@vger.kernel.org
Subject: ulogd: logging IPv6 flows
Message-ID: <mj+md-20260401.114453.17525.nikam@ucw.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello, world!\n

I am trying to use ulogd2 to log all flows from conntrack,
but I am getting corrupted entries for IPv6 connections.

Instead of IPv6 addresses of endpoints, I am getting IPv4 addresses.
Apparently, the bytes in memory are interpreted as IPv4: for an
IPv6 address starting with 2001:0718:, I see 32.1.7.24.

A quick glance at input/flow/ulogd_inpflow_NFCT.c suggests that
both IPv4 and IPv6 source addresses are stored under the NFCT_ORIG_IP_SADDR
key, but the nfct_okeys array has a fixed ULOGD_RET_IPADDR type for it.

I tested ulogd2 2.0.8 from Debian Trixie, but I checked that the revelants
bits of the plugin's source does not differ between 2.0.8 and 2.0.9.

				Have a nice fortnight
-- 
Martin `MJ' Mareš                        <mj@ucw.cz>   http://mj.ucw.cz/
United Computer Wizards, Prague, Czech Republic, Europe, Earth, Universe
