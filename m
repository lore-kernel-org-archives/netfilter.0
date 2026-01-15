Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EFE2EC0AA
	for <netfilter@vger.kernel.org>; Thu, 15 Jan 2026 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477081; cv=none; b=rGGff5x2XvVm3m3aiyr8CNI+asjeu5vJzQQSZC4CwGirrGd4fCsbZ2h5xzlJ02tjPCtlDYH5RB/TI73e44yZO3XDsuiWcnBxPOZiaZUB6d4rJgsOu58P7PL4sn9EgK1o7HJvExZNWmLplgj+9rs+D99m2ulZrv0c2tP0tE3uNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477081; c=relaxed/simple;
	bh=BIxWZj+bOA25zvFxXe/ufcRdqBR8BoB+PDc1zuKTOmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2ZgpAUVFYWbEjP0E/fPF6SlQF+C924yRDUtjehBlYmZXz8ERFvQut5vA2Wi+21OPL9H9W9bvWM/S6+/pMi7UG4+lvSaPSFWYSsoRWf44KzTCwFT07p1MsAKJeQ6b8NGpJf3U2sDRKVnw2rbKhv/9doaKo5/CAxSy3ni5eutRpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=CS1LTypd; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="CS1LTypd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1768477067; bh=hkQiTviaVUvcaC84UW5qsjz2vOoIAiCVr7/8VbSt1ys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CS1LTypdNOYd4i9T64lxxxc9xS7iZXidhEooy/uk44xzO77Rl3iX/k8wwksYq2iO5
	 pfZT/a8ecO6XkrGsJRVhFfrHDBOjj5V0ggpg4utW2R/KyUqqWo8I+w82YfdDhl48lW
	 3ppw7S89MfkNvnduDq4BtyZBpwNaDugwwnwGaxkqIp+lS6H4ljrMiU+S8JpCT
Original-Subject: Re: What happens to netfilter during end-of-day?
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.83] (pcale.tana [::ffff:172.25.197.83])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC0EF.000000006968D18B.00006DD0; Thu, 15 Jan 2026 12:37:47 +0100
Message-ID: <dfa73014-c624-42e7-862d-71bff829e0ad@tana.it>
Date: Thu, 15 Jan 2026 12:37:49 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What happens to netfilter during end-of-day?
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <3460873f-7359-46df-9e26-65c4ce0e38d2@tana.it>
 <aWg6PgmGEA6fbpwG@chamomile>
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
Content-Language: en-US, it-IT
In-Reply-To: <aWg6PgmGEA6fbpwG@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Thu 15/Jan/2026 01:52:14 +0100 Pablo Neira Ayuso wrote:
> On Wed, Jan 14, 2026 at 11:14:49AM +0100, Alessandro Vesely wrote:
>> 
>> I have a netfilter daemon that makes a looping call to mnl_socket_recvfrom()
>> and quickly examines packet headers. It only stops when it's rebooted.
>> However, almost every day it receives an ENOBUFS error, just once, around 4
>> AM, while running cron.daily.
>> 
>> I haven't found any useful logs from around the same time that explain
>> what's happening. Does anyone have more information?
> 
> Where is your program? It sound like it is buggy?


The program is part of ipqbdb[*].  The daemon I'm running is slightly different 
from the released one.  I copied its source here, if you'd like to have a look 
at it:
https://www.tana.it/ibd-judge.c
https://www.tana.it/setsig_func.h

The include file is for setting signals.  (Another daemon in the package, the 
log parser, catches USR1.  Normally, no signals are sent to ibd-judge.)

The daemon spends its time in a daemon_loop(), calling mnl_cb_run().  I launch 
the daemon with arguments "q0s" and "q2dm4", which means block source IP in 
queue 0, mark with value 4 destination IP in queue 2.

Can you spot bugs?

Best
Ale

-- 
[*] https://savannah.nongnu.org/projects/ipqbdb/








