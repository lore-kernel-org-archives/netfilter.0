Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECF306B3C
	for <netfilter@vger.kernel.org>; Mon, 27 Oct 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573304; cv=none; b=dodbgSDT9aLVfKbFbTV5gj8J4l1SiSFXzcVbhUEnHXC/bY6zjdJSdp0oirEw3bnDtasI8jsSisBRg/rSjLqHFAE+HLyvTUrMQwqE6+yxLEllsTBE6RoghzMVyBa6k7WCmWXsw6RKfGM7dnp+rJVqV//7PITM1KIWDV3zy4uYRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573304; c=relaxed/simple;
	bh=HU04YjWy+Zxhb8ErxKI0mVJX1QerhG6fGsL4tzzvaQk=;
	h=MIME-Version:Message-ID:From:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=fFgMifIagVK1MYCEC1WBMY9bURZ45rEhxExa+QBQHfmwI/INXPjaAQcEmwP1KTu4/jOzA0DHdLwkSdVdc33v5OukSo9HPz0GpsJBWREpvTTL/W73/6SSrDf0VTuRDS0hLXGHEToT279LroVtdHzaH6omB9eAVaYVaMDgohJOEGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=caramail.com; spf=pass smtp.mailfrom=caramail.com; dkim=pass (2048-bit key) header.d=caramail.com header.i=louis.t42@caramail.com header.b=GfMGndhF; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=caramail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=caramail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=caramail.com header.i=louis.t42@caramail.com header.b="GfMGndhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=caramail.com;
	s=s31663417; t=1761573299; x=1762178099; i=louis.t42@caramail.com;
	bh=HU04YjWy+Zxhb8ErxKI0mVJX1QerhG6fGsL4tzzvaQk=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GfMGndhFcoPzt2z4cOyqjAcR5D9FpE5l5+hCa/LiVyopyP6a59wceBkRoMiwY82F
	 7CsPVcOh1wlax0YcfOYj+6MO+loQC6jjneww7LintSl2UBlPXDXlAI9s9hTJMMv2u
	 XeRgqulRTzsUXTPfR9XHwSg/sKZgKyRF0F2pl34OCwW8gplkRx9xXJ4dRC8r0Lspp
	 p6IdHOSRVFMA8MZncplOnwrY3nh7N2EREatjm4FtPW5ZrcUgQLkBFe2tkTZzGZA8B
	 PF1fjWc2PUvVLIEeL5yASxEhe8UoYjfqt8R+FBABAxd+jCydDZ5ifbgoIFad59Zod
	 zYxark+4z/K2Q3qwQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [178.239.163.100] ([178.239.163.100]) by web-mail.gmx.net
 (3c-app-mailcom-bs13.server.lan [172.19.170.181]) (via HTTP); Mon, 27 Oct
 2025 14:54:59 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-93433a71-f31b-49d8-abd8-a8bf718472e1-1761573299550@3c-app-mailcom-bs13>
From: louis.t42@caramail.com
Cc: netfilter@vger.kernel.org
Subject: Re: Nftables ct count over 2 counter continues to trigger with only
 1 connection
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 14:54:59 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <aPtmw-suGrj2iLC9@strlen.de>
References: <trinity-85c72a88-d762-46c3-be97-36f10e5d9796-1761173693813@3c-app-mailcom-bs12>
 <aPtmw-suGrj2iLC9@strlen.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:8aQ1Gx6GhqEOny813eyrs9tbGknvcTNKnyl324W7293l221fV/O/MbBMc9hGk/hqY2rmH
 rLJZXzszDqGhv1vRhnqhbJupiujMn3EvJsklBE31BcJjQ/pwvmwjwMeSPOgfLngBAvPKVM3FwnTh
 bFShAMew831cnfxpNEu46MG6jjSbEsBUu4LmWlmiyJ3j1zBPgLkTAyLNIogBEOW3TIwVnBkiuEEZ
 MiB1OAyy9HqhORra296+Bpj2WW8MkvmK0tZlurR9a15fh1bOVxCtElBilDom2CoKiQQ+1JucGkeH
 Og=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7+kX4pbVZv4=;+E+ZE9TKiUIZt/j4obBwkKtF486
 +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
 UG1/8jMSJjgjflmUlQTpBsqsModKVANmWTVa2

> After looking at Fernandos analysis, does this work when you restrict
> this to new packets, i.e.:

Thanks for spending time on this. I can confirm that adding the restriction with the inline jump works great! Of course, it would still be great if the original rules behaved predictably as well.

As an end-user trying to learn, the man documentation surrounding conntrack and especially packet path dynamic set add/update with `ct count over` and similar could be improved. The dynamic set flag also lists "delete" as a valid option with no other references to it which felt odd.
