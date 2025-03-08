Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824E48462
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741427036; cv=none; b=Bmmldz7PEztBqTO0ZAIZ1QEeaVVm78XfhR8L0HMBoOx/1yd3J+s28FCsXnHOlJzYvZKrQRj5Pl0XarKnzawaXkkpdKzXG6H4P9oOmYJuBqSxYvCMLBtI9krKWhDsL+WS5Wnq6znSa4GPNpLdki+DFKdTOVn7qkOS1TXcR0BbDV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741427036; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CHyITHTuyQIW2qMod8ZqVBvFZCgF2EflgiaJx3pYzxJFT80UX7K5p6NzG7aXYpRTkusuIeBKOAig4kdJ7NoeWSkaVAEn1FR/3kNXAcF4UjxmxcyRj/xHKogWaC9P//ICoeJqhW3v1rEUkJNzU9D4Dpd2eN5obKx/4gGWij0QsNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net; spf=fail smtp.mailfrom=clae.net; dkim=fail (0-bit key) header.d=clae.net header.i=@clae.net header.b=ZBzFoU2a reason="key not found in DNS"; dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b=rz5Bo6Rk; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=clae.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=clae.net header.i=@clae.net header.b="ZBzFoU2a";
	dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b="rz5Bo6Rk"
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 742B34CE53
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 10:37:10 +0100 (CET)
Received: from stella.clae.net (unknown [82.64.199.61])
	by smtp5-g21.free.fr (Postfix) with ESMTPS id 6928E6013C
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 10:37:02 +0100 (CET)
Authentication-Results: smtp5-g21.free.fr;
	dkim=fail reason="key not found in DNS" header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=dkim header.b=ZBzFoU2a;
	dkim=pass (1024-bit key; unprotected) header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=default header.b=rz5Bo6Rk;
	dkim-atps=neutral
Received: from [192.168.254.101] (_gateway [192.168.0.254])
	(authenticated bits=0)
	by clae.net (8.18.1/8.18.1) with ESMTPSA id 5289aRS2489104
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 8 Mar 2025 10:36:27 +0100
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.8 at stella.clae.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=dkim;
	t=1741426587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ZBzFoU2ativ1E0GADSbw42XXB/99axanMthxFV7Jjy/ZuaPN3icVOt+6rGTXNwBFAD02IK
	ZFtk87+2MHaZ/5Shj2c+oZa/5QPK2cUvwm2HbwoyvkVkbdMmjGx2t2FwxY6yeUfBlmvp9J
	nDN/Ksx77XerlGzsoLdZxDb+Tw5n5ZI=
DKIM-Filter: OpenDKIM Filter v2.11.0 clae.net 5289aRS2489104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=default;
	t=1741426587; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:To:From:Subject:From;
	b=rz5Bo6RkYk2HF3DDEaFnUJyL3+TK/XOPYxfROeZuItNrQ7j0oPoEhr6NHBUhppQZC
	 3AcHUr9tj0XTxuIZdib1T/XMMoWtpRZFLtvU5AntQgRAMsL6gKLtShDGl2pIeMWJ2e
	 jti1IqfrGjg6/+Y93ExTYbBnyZSYCYsEx63b5YwA=
Message-ID: <154e5a22-18ab-4435-9da4-39ae19ada431@clae.net>
Date: Sat, 8 Mar 2025 10:37:00 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: netfilter@vger.kernel.org
From: Laurent ARNAL <laurent@clae.net>
Subject: subscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


