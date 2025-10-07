Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A123223AD
	for <netfilter@vger.kernel.org>; Tue,  7 Oct 2025 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835453; cv=none; b=dAGT2FXsgKOf4XHiLtcPejI90+ZRd1CzIvnlK/Q+DZzPm8QWAhvMAl20NUcKWoS6y7EtICk7aqwpv47HWCi2Buh9e58cH2JHkS1p3NjRuquwEnYfpu0pm2W3TOLX9UJjCz6hi2Mgpmo1SThS7QptGYOi68YUnb7SKGviXp6Z05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835453; c=relaxed/simple;
	bh=L3Vg9v8WMaSOkm5ztLhXsfuHGkmn2ay7a/YYNPQpFCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shBnQMDU/XqtGp7AhX8nHd3RkwVo4JHW525jNPwWRjUFMRW+T/zZ/+TiDZC9qLCGG1ckYpMi6OOC2olJZnFsTomjwZDCnDroZGf6l7aOWTvFQ/R09kfmKsuQ99pqIBv1Sv/Hae84aj3sk+WaKjXixSv2lZCYblUzytPwzjQIE2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=UWjQTTBi; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=v6S4oxwG; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="UWjQTTBi";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="v6S4oxwG"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 19D7560272; Tue,  7 Oct 2025 13:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759835450;
	bh=JcPngw9j4c/2yauBwIJ2sZkWRmkRUy5K2DR4K/vISuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWjQTTBiTpnC7OkcOe3kTK/K0snp54O+jgzBSwdh20JcIY2yEgmAMuzBNSMs3mEFj
	 0TNsyeKXNxyDUrGoOcDQmtD+0tpMkugc/4wOaNXppo00zBEYWZkQnj/EwKOarpxrl+
	 +ox2h/dnw9AeOFJZRENNVLOCB+29osyrhagClC2etXQOvWiArD4wB0cUOuaHZWzdI8
	 a4z0xHHaEqCB4icMja6Sb+5+menWwvWSyRQBBg/x+H+bTFyomBBDNgU3PO5zh3s7CG
	 HJ6+KpZShTUp6zn9jzV0aFrt/oX9OcvuRjxBM0zR5vHV56sYtly2IdGkiYND/bK3WT
	 Lq0edqYPsCQLw==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 838886026C;
	Tue,  7 Oct 2025 13:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1759835449;
	bh=JcPngw9j4c/2yauBwIJ2sZkWRmkRUy5K2DR4K/vISuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v6S4oxwGwk/n+jjuux3dE3LgMy56JKTiDBSThx/V4lS7oAFK5w0+3lvm5X5DW247S
	 mwVrCoY+1T+3+ekuneWcbFHanuNJLi7OnMJScqQbAA0AdJJrb6nVjeWyXeUFZle3ad
	 jI3uHC/bESRXP5aOga1sSkct//J28dFgmyaZySBpKg1iFplOt8goQkEPcoVR71N1HY
	 we1XsRxfTtF6oo5oxIbFQj2n2CkTCtjk5oRX5nnQaS0h2jdhWGX9CQQvozeXN3KLHh
	 tiPTJD6/0EEF6zdSMybMyl0OVpVsrXUG0sLKhiRKXwTfOaTT9Oa9nCsOcRFrS3Q8Bx
	 v24Tu9TWe63Cw==
Date: Tue, 7 Oct 2025 13:10:46 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: imnozi@gmail.com
Cc: netfilter@vger.kernel.org
Subject: Re: nf-ct-list and nf-exp-delete
Message-ID: <aOT1NhYSS65KwwJD@calendula>
References: <20251007051508.049e8821@playground>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251007051508.049e8821@playground>

On Tue, Oct 07, 2025 at 05:15:08AM -0400, imnozi@gmail.com wrote:
> [iptables v1.8.7; old, but it's what I have.]
> 
> Why does 'nf-exp-delete -i [id]' *not* remove remove some conntrack entries even after being told to remove them multiple times? It deletes most entries for my purposes (if condition is met, delete conntrack entry and block the IP using ipset). Blocked IPs are DROPped on internet side, and RESET and REJECTed on the internal side. But from time to time, I see ESTABLISHED conns that don't get (can't be) deleted.

nf-exp-delete -i [id] ????
