Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A517BB2B
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 18:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712773467; cv=none; b=jeRmfqgWFy26HJWXE1mAizxElYks28mLD095dyr2loeAICQZBRn9gC7vh8AgSMwH0pO/MgddpoFljPVcGcRShKBdLurEEGDavQ5plgMFt1lGIHvD2YUTbrW9ikX0/tq3BmsrQ49Hc43pgdOGRo+tSUMBmlSidnlVgsML3x7cSsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712773467; c=relaxed/simple;
	bh=cgtSThG1DawVk7SBE6F234dvPCY6Zo4e51KMcU1YBjc=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVH7FyzlnYLRCibtZObgdRP1WuUdp7ADl/8yMWMJgmWhZKHkfnHWSyaAB4TrmHxO9Xnutte+AE9lU+TukoItoypPTMB5zp+7MAHp6qqyCT9Dy872tW6St21c6J0wBDcLhxPetjCEbSdk6UgwKemlkflUiREq07M0FLhhRdlvIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=lN4oSnxM; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="lN4oSnxM"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VFB7D4tcfzDqVw
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712773464; bh=cgtSThG1DawVk7SBE6F234dvPCY6Zo4e51KMcU1YBjc=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=lN4oSnxMHPhWqQCsVenNR7bH8vnK3xtruNy2W1ppRCog9uLEWKF/nbntSGMJuwSXQ
	 uJGS0sNU35DoFBjtwOisu6iGolsZvGUfeUyFVBWEenjJ5QJJIyb5NoGRc3XBR50njx
	 lKmEzto+fWareObed+ymuZJb9AmMEf+Ep4JZyjOc=
X-Riseup-User-ID: F126BE8FB5997E12727CF7C041B0489884AFE58038C432CC0CDE643CF6664921
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VFB7C3fXBzFtl5
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 18:24:22 +0000 (UTC)
Date: Wed, 10 Apr 2024 18:24:12 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: Correct way of setting the TCP max segment sizes for IPv4 and
 IPv6?
Message-ID: <20240410182412.54b8d264@localhost>
In-Reply-To: <7E895779-0120-44AE-B0DE-4BCC2AF897F4@slavino.sk>
References: <20240408192441.657ac116@localhost>
	<3C74BD22-CFE3-444A-AFEC-C532D7F2AACB@slavino.sk>
	<20240409193300.2aef4ff7@localhost>
	<9AE2B9F2-FE7D-440F-A595-F015957ECBFF@slavino.sk>
	<20240410154851.6a627134@localhost>
	<7E895779-0120-44AE-B0DE-4BCC2AF897F4@slavino.sk>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I see what you mean. Thanks for clarifying.
Hopefully someone more knowledgeable may enlighten us both :)
