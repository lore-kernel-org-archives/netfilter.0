Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD51B96D
	for <netfilter@vger.kernel.org>; Thu, 18 Jan 2024 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568744; cv=none; b=IT2JayUa5rZDsfd2uftszDIyPx/GUUt0zsnJpLWmUQatq80Uyi4vM34YyXYUBJhM4Zw90tU7rrn81my0ZW3Iv5gt6AltnDviu1C6T2Ecs/En47/onZtYWhzYVEZBNceBXGieLOTPq0XixAMzsJnDKryBnk03mAEYZr1p/GdRDHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568744; c=relaxed/simple;
	bh=VzANumGpaG7aGgBDn5eQFtD55MJhssb9STelEEQnhYc=;
	h=DKIM-Signature:DKIM-Signature:Original-Subject:Author:Original-Cc:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=VJhqVLFJY3vfrJGFC4GaDaNqmaHuUvl/Ayu58mIL0v05wdY5EYrHEa6rYFwOO2uReWxCcHCBAL2N9vmY+Mdwv6FeeAU/BzDpQtqLVcfUVDV5e9adRURDTbUkWpoP3qBkNF0/W8hA5Tly/BlDkAf0Fh3cHSqyt2ItPKHCKGahfP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b=Uo6Lj9sE; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=AqwdBd4k; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b="Uo6Lj9sE";
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="AqwdBd4k"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
	s=epsilon; t=1705568734;
	bh=FwKl9hcs0midgyDCptU7/Wn9y7BBhOPzy7UJ+iP/9BQ=;
	h=Author:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Uo6Lj9sEr6alcL0KbjoQQ/vpui5eN3uep6IsTVb3CDuPs0SjqgutmC+iJFc+1dP0h
	 ytDjEk/3y5rA6K1ubq1Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1705568734; bh=FwKl9hcs0midgyDCptU7/Wn9y7BBhOPzy7UJ+iP/9BQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AqwdBd4kJNbd8HeQwVhVPNPh1/XjJbnVga9o5qPtE3PaX3z6dZt4UZs87LKrIxRRJ
	 7aPgM/Z9JNnDYSQ72pgCgxMYATrhfVyQW4yHWTuUhYOBe3dPHPuOFfgtddJSpFtwbD
	 JSpG6zc73THGLO/siuolJQpBxsefVrGxUmiADEg1LomDHYeZx8bu8++u/vjD4
Original-Subject: Re: Debugging libmnl client
Author: Alessandro Vesely <vesely@tana.it>
Original-Cc: netfilter@vger.kernel.org
Received: from [172.25.197.120] (pcale.tana [172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC1EA.0000000065A8E9DE.00002D7E; Thu, 18 Jan 2024 10:05:34 +0100
Message-ID: <d80d5d52-0209-4144-9b7c-51194935e9cd@tana.it>
Date: Thu, 18 Jan 2024 10:05:35 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debugging libmnl client
Content-Language: en-US, it-IT
To: Jeremy Sowden <jeremy@azazel.net>
Cc: netfilter@vger.kernel.org
References: <50854203-77c6-4145-8d87-8b493ac492a5@tana.it>
 <20240117145326.GC213513@celephais.dreamlands>
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
In-Reply-To: <20240117145326.GC213513@celephais.dreamlands>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Wed 17/Jan/2024 15:53:26 +0100 Jeremy Sowden wrote:
> On 2024-01-17, at 14:21:07 +0100, Alessandro Vesely wrote:
>> are libmnl debug symbols available?
> 
> The details depend on how the library was built and installed.  Based on
> the location of libmnl.so.0 listed below, I'm guessing that you're using
> Debian or Ubuntu and have installed libmnl0 with apt.  In that case, for
> recent versions, you should be able to `apt-get install libmnl0-dbgsym`.


Didn't work:
root@pcale:~# apt-get install libmnl0-dbgsym
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package libmnl0-dbgsym


Alternatively, is there a tool to check how queues are configured in the kernel?


Thank you
Ale
-- 





