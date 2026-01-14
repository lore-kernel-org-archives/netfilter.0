Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59538A728
	for <netfilter@vger.kernel.org>; Wed, 14 Jan 2026 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386001; cv=none; b=HhgWtg5J4q2CqmtlICHbJrihZFRLKFsJgxVOXGDLSuG5hIwMpkBInkNIuYkBYmwZhABY9DxDibSCuRYuP91R0xhb+AeZuxc4Avaax7wZKPmgZFWKEho1GykTRkvWbj+F+DhyGoM2nEifX/rb2u+qdyfbakHUVNC1vMHJfCgVSMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386001; c=relaxed/simple;
	bh=7mXE1CT0/lI9nxTzvsvcVtg56kOUF5KnGm6xkYT747A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=OrXMLXoh3QdeGBSr0eV5ESUbg0OdSRK9Rjod4mP8NQjRugeM49bgrPLpmVEJKRuHHQEZ8FiCZ/M+bxEi+0VO6+f1b2ceAhL3fe66KCqQQEyeKaXiMYwnD+FJLIR6I+Q2QdZLZKTCeHuvbDo9GpulW3T6kcBlgMrVv6r8x32ek5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=BYHEUIZ+; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="BYHEUIZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1768385687; bh=XSLf20RMwlJWAAWtGwF7XHjvVdjZvrtn5D38CML4MoU=;
	h=Date:To:From:Subject;
	b=BYHEUIZ+YHg/o2BhR6y2UOjL5Y6nn3G5b28GglkLZZMPYq5fjboS6lY3FP4Sw1cEx
	 Ws6RJ5QI/pzAabrJgnjgSZb8powu4ZBIv6HkyCeoDLUtDbxdIZrN7Ve1WPy1hAf/vK
	 CnLZCbykoPL8QadbOQvWFQlC1OZG0Whe/5N5NtENhflitp827xzsZjlbCSvBd
Original-Subject: What happens to netfilter during end-of-day?
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.83] (pcale.tana [::ffff:172.25.197.83])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC0CF.0000000069676C97.00005F5F; Wed, 14 Jan 2026 11:14:47 +0100
Message-ID: <3460873f-7359-46df-9e26-65c4ce0e38d2@tana.it>
Date: Wed, 14 Jan 2026 11:14:49 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
Content-Language: en-US, it-IT
Subject: What happens to netfilter during end-of-day?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have a netfilter daemon that makes a looping call to mnl_socket_recvfrom() 
and quickly examines packet headers. It only stops when it's rebooted. However, 
almost every day it receives an ENOBUFS error, just once, around 4 AM, while 
running cron.daily.

I haven't found any useful logs from around the same time that explain what's 
happening. Does anyone have more information?


TIA
Ale
-- 




