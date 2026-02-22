Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8473064B5
	for <netfilter@vger.kernel.org>; Sun, 22 Feb 2026 13:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771766536; cv=none; b=SNXYo1U4A/CtCybtka4oUediFhnvOONNTsFHsjvqcpMUxvxmcE0usbW0YwoYBDtCx0Qx2y4dnmqeFjMmNpyIBhqnpS2FpR953YN35kyf0E4xHPHqzsDzKTJpm6cIkf1z7dbiu7nxXH136c/7D/5Da8xvr/klk/DbLyDS5hMggxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771766536; c=relaxed/simple;
	bh=n81i0t0PG8Ah5yiI6HujH7fuMeTwJKEYOddBVHGe6wg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jFJL0aNWXqEfN7NMVr1P/Qoc0sCa4AuuAV252g+Cl+V/3pR2PTe/1CotMLfr43Qrh4soeD/S1lMG7rSxQqCctxTYSOfcudYIeQhYkAyei9CDSN5sNs8ixLoXiMhXoJJajopcj83agDUGKOKtrJFM3bfCCzj/qU+kVXx3XvhyY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=DHGiJW/y; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="DHGiJW/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1771766221; bh=H0szwLxG5g7WFxOeet4B/LDFEZsevz812md57H0FmIQ=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=DHGiJW/y8t2d/flbUma1nxdsSVXnAvihv4vFtnZOW5XjmOGs6P7+DUvOMgiaO10WU
	 7kt2k7mYZ1i0uKipWbr/qugeRxoIP4e3Y/ei7DbaKKGqZ5DcpKahaTaHss3NsUmL67
	 zigzdNyVTsftePfohnRv0Cnka2UrEllfzmNTIKQF1Ugi2ajmPVqVKi4ZqOqUS
Original-Subject: Re: What happens to netfilter during end-of-day?
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.84] (pcale.tana [::ffff:172.25.197.84])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC07B.00000000699B01CD.00000836; Sun, 22 Feb 2026 14:17:01 +0100
Message-ID: <9a91ddc9-54fa-4abb-910d-d37d67625512@tana.it>
Date: Sun, 22 Feb 2026 14:16:04 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What happens to netfilter during end-of-day?
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
To: netfilter@vger.kernel.org
References: <3460873f-7359-46df-9e26-65c4ce0e38d2@tana.it>
 <aWg6PgmGEA6fbpwG@chamomile> <dfa73014-c624-42e7-862d-71bff829e0ad@tana.it>
Content-Language: en-US, it-IT
In-Reply-To: <dfa73014-c624-42e7-862d-71bff829e0ad@tana.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I just asked it on superuser:
https://superuser.com/questions/1935167/netfilter-hiccup-during-cron-daily-procedure

Best
Ale

On Thu 15/Jan/2026 12:37:49 +0100 Alessandro Vesely wrote:
> On Thu 15/Jan/2026 01:52:14 +0100 Pablo Neira Ayuso wrote:
>> On Wed, Jan 14, 2026 at 11:14:49AM +0100, Alessandro Vesely wrote:
>>>
>>> I have a netfilter daemon that makes a looping call to mnl_socket_recvfrom()
>>> and quickly examines packet headers. It only stops when it's rebooted.
>>> However, almost every day it receives an ENOBUFS error, just once, around 4
>>> AM, while running cron.daily.
>>>
>>> I haven't found any useful logs from around the same time that explain
>>> what's happening. Does anyone have more information?
>>
>> Where is your program? It sound like it is buggy?
> 
> 
> The program is part of ipqbdb[*].  The daemon I'm running is slightly different 
> from the released one.  I copied its source here, if you'd like to have a look 
> at it:
> https://www.tana.it/ibd-judge.c
> https://www.tana.it/setsig_func.h
> 
> The include file is for setting signals.  (Another daemon in the package, the 
> log parser, catches USR1.  Normally, no signals are sent to ibd-judge.)
> 
> The daemon spends its time in a daemon_loop(), calling mnl_cb_run().  I launch 
> the daemon with arguments "q0s" and "q2dm4", which means block source IP in 
> queue 0, mark with value 4 destination IP in queue 2.
> 
> Can you spot bugs?
> 
> Best
> Ale
> 

