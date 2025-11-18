Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440430FC11
	for <netfilter@vger.kernel.org>; Tue, 18 Nov 2025 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465812; cv=none; b=k9zuAXjrYoCtbcdmjiH1IRMEBoP2nZN2CEbzvOgYui+RXqpghTfaOQmAnzc+o0KfLnyjpRI+Eiy3ZBtrq5HFR79/0CHhPLkcSoWpZ6I6Ix+pKgYuaTOrFbZ4PV8/P3qz6xYFnAXtxjzkkox1qW9Ma/kK8hjkBhcguVoMrksVNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465812; c=relaxed/simple;
	bh=qwLHpGgiRVRpUfGb5AUz6MZmFG6DNRjF7ByaLnsDOmQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=JnWF69G5EF9vB7Cl8LMjRTjSYhaRTVWBRPRWn3nFBWSSBCHTAINEnpY2kTJQOvPScTsThF8nasI+7w59nSd5JzWkPkqHsHV/iG1wZ8UQHeHh9D6F8mpVxMlODhvE7qLHUHhaR51yk2UkT8G/64lw5Kuo5bOK9e5gp/PsaDEuM7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=DDwmwwxg; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="DDwmwwxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1763465495; bh=PSXtpHZXmGw/VJjfM/mhWcQRxswZKUmdrG8D4XloOjQ=;
	h=Date:To:From:Subject;
	b=DDwmwwxggV1K5KtUxspynoTPcojtBeoBVS+fQfR3yJajFsz0VxfldmTmqRT0txXzR
	 EsIqVQSssmDZ+MLOstjR4GIMzBAhDDKPIepqM2g8+N3ajVzy/4xLapxdapDTrfpefP
	 DL9QN22pxSay5E2ZQT93EeIclM9ao20V+x5LbdqELXg/s1FyNsXvmcpUgyCdi
Original-Subject: Changes in iptables-legacy
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.83] (pcale.tana [::ffff:172.25.197.83])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC07B.00000000691C5917.00003D3B; Tue, 18 Nov 2025 12:31:35 +0100
Message-ID: <df96861a-23f2-428f-95d6-83ecbc4044ad@tana.it>
Date: Tue, 18 Nov 2025 12:31:15 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, it-IT
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
Subject: Changes in iptables-legacy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm still using iptables; my scripts work well... call me lazy.  I didn't 
expect behavior changes.  Instead, when I upgraded to the last Devuan release, 
equivalent to Debian Trixie, I got iptables v1.8.11 (legacy).

One of the scripts had a daily call like so:

     iptables -L -Z -vnx

The new version resulted in an error:

     iptables v1.8.11 (legacy): Illegal option `--numeric' with this command
     Try `iptables -h' or 'iptables --help' for more information.

Is this a Debian quirk or is it found in the official source?

By simply removing -Z, the above command works and its output is properly 
digested by my legacy Perl code.  However, I'd be curious to know why this 
change was made.  I hope it's not a subtle way to push people to migrate...


Best
Ale
-- 







