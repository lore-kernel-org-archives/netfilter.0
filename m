Received: from smtp-outgoing-1701.laposte.net (smtp-outgoing-1701.laposte.net [160.92.124.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A1C1D7E35
	for <netfilter@vger.kernel.org>; Sat, 19 Apr 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745066632; cv=none; b=GNMABYBCYMCNZKE6BXYFdxNssAAxkPUUWrH6Rtvo4OaqOhzE9rgpPz2TGYWgXu+sJchJxEWzY2xKhnofu5jD4UpQ8x7p7nQDzSmPOQ3MdQiJYgjEwaz4DLB31FPjdetKz7R0lGxZsdpDAHzVqk5lXjRNGpf2LNgohVd6RjchaEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745066632; c=relaxed/simple;
	bh=NP9lZphhTNsWlSZ838Jw91oLpCwIBELGHrGUMMB9+zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q0E8UBr4x1+9A66FUbhZnnPKLRqS7LyUub+0PuFwqukARHIDzlyFgbgpy0TuMVyPV7fD8gKVojG0NPCSQpjpeCgbgkKwM6SPNnUF42L0gfIgOnGvUN5IZIMJ+wVALhlUR6pBRJHhKmuZFO00jsen59Ehi0DvGFLny8IA6EwhjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=b6E06DBf; arc=none smtp.client-ip=160.92.124.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="b6E06DBf"
X-mail-filterd: {"version":"1.9.1","queueID":"4Zfhrf1lVdzKm44","contextId":
 "b0d894d6-5433-4468-ab30-afba620a5176"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4Zfhrf1lVdzKm44;
	Sat, 19 Apr 2025 08:42:26 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4Zfhrf0sl0zKm43","contextId":
 "70967c8e-09fb-4532-982b-ae181ae81a93"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from B550-AORUS-ELITE-AX-V2 (lfbn-ren-1-301-157.w2-10.abo.wanadoo.fr [2.10.138.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4Zfhrf0sl0zKm43;
	Sat, 19 Apr 2025 08:42:26 +0200 (CEST)
From: Kevin Vigouroux <ke.vigouroux@laposte.net>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Can the PCP field be set in the netdev table?
In-Reply-To: <Gu3V89R_iHD59fwn-XkS_Bg5f2Mw9rLEfE4s1ByGZZy6gVONt1WwiNAyvg2Qui3NtRDfnJRwkFDddYnMiah_FL3EMCzJvzyT85U3hX1_IkM=@protonmail.com>
	(Sunny73Cr@protonmail.com's message of "Thu, 17 Apr 2025 22:33:40
	+0000")
References: <877c3kvzyk.fsf@laposte.net>
	<ULYEvwyZR2o5mOmJi1GCdWxJu-bftNMqoV8y_KVt3i9eXaWu7uTOBZk9D2-cXABoNO_SUbnRRKRUj9NyYjHbnO5NfkViqsjUsLBdfbyZc_Q=@protonmail.com>
	<QeFwNvN8Q3lUul6dSJmJlq8MTp9ifHpuXYYhyra79MKEQf5bxqf8kdBtyvzUFMsJfXBoG3fDo_5Cn0m1DOdhPzyS3x4K46tSPAhcsZuwxVQ=@protonmail.com>
	<Gu3V89R_iHD59fwn-XkS_Bg5f2Mw9rLEfE4s1ByGZZy6gVONt1WwiNAyvg2Qui3NtRDfnJRwkFDddYnMiah_FL3EMCzJvzyT85U3hX1_IkM=@protonmail.com>
Date: Sat, 19 Apr 2025 08:42:25 +0200
Message-ID: <87cyd8lkj2.fsf@laposte.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1745066620; bh=NP9lZphhTNsWlSZ838Jw91oLpCwIBELGHrGUMMB9+zc=; h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type; b=b6E06DBfzNmggeqzWJwl/A9E86uT4j7mYdTpVn9P/f61EyJsRWtdVyu9i5nxwNiwVTdThRLSImCLRHEvfZgsxDSxfwcKir29MaDHJlPmFbYiM5yJNyIfuAx7539oDsDzVYlyuc1eh7s4+KCrc3Kv8CeTbgadSGR81OPoIRUl9PnDzPuk4VyUrQoeUxZYIjaVroey9ZApCKxFDVuYjBnf9DppCmle9Qqituec79TirI+ZSR2KQ/0mB8IYfE6OEJHL7bWfVnIeBWCq7FuI0rqNR+IATQNdFdPGTEmVCLR9ZyEwOJKMxkR7eg9M+PJv8JAOh33N8bLVLgr+GFOF7UhHlA==;

Thanks for the explanation!

However, the exclusive OR between bits 1 and 0 results in 0. Consequently, only
the PCP field is modified by the operation.

--
Best regards,
Kevin Vigouroux
