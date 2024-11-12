Received: from outbound3.eu.mailhop.org (outbound3.eu.mailhop.org [52.29.21.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15B11A4F21
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.29.21.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731434262; cv=none; b=IUyD7oHrfPxDT/MjO4uITuw5+Ix21SCRCvLQOH/Dw6zFUzwqGVxFvy3t9vz5K2VwcymfVSehgRZp+evW/OOvQOqH/ebmE6uKizMhEYWzPiRy1YLPHpCKZfqgAaXkanSYAZNHJgtl92Jle1z6vc9ufw7kKP8xDXX2iz46MXJwjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731434262; c=relaxed/simple;
	bh=jQZwmbLlL/mf+cmRWBxHWFxRmh7AaAAeQpKF//kZYCg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=cvPhuMsam/Yhi7ZEWb9i8/uUucCBCqSKbNyj0KYcRcJOCwzEozE53fdHenx3R7xgrfsqcSvq5B7m752fuJ0njhCg/SkQbjvPxm5tMGfz9MiN1I2h40/FLYD59B1HtkLj9iKMPR/LcnOrXafBro3qYdHPoYrY9tNmjjA9QGpU4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=L3wksizX; arc=none smtp.client-ip=52.29.21.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="L3wksizX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=jecFxo9069DVvRGd/l/xH+FWeEYu6+7AiKMyR7TfsTI=;
	b=L3wksizXx2Vm1Wxn/mb5wUind7un57dvqEYqu3pxM5mg9l2PgnrXgzLwqeA7cZr4NNemM1zaIneZj
	 3dlHDdvgpF7EaClgC2c2zXriUOgjnJ5ujI3lJsTE6q31bOg8PBqI+QX25dPa5ZYFQZMXXG/ZjqAZos
	 AVowhYtQ7iPS0DqhnGHtON4tJEthB+QqvWTI/auqK/FVCHQx2r/actinY6Gs35aFaTUpb7znEH0mpu
	 HChSIe6cEwgEUJpce8r8k5e27Fb/xpbDc11wBb7jgDWoPAyKby/A9p45cNaL5Wzf5x7LKilmIcOES7
	 B8pl6D102IjZMy57rhKm01WmA5kjU3A==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 7249e018-a11f-11ef-b21f-25ccbfd3c7c9
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound3.eu.mailhop.org (Halon) with ESMTPSA
	id 7249e018-a11f-11ef-b21f-25ccbfd3c7c9;
	Tue, 12 Nov 2024 17:56:30 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.koeller.dyndns.org [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id 53A11968A04
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:56:30 +0100 (CET)
Message-ID: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
Date: Tue, 12 Nov 2024 18:56:30 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>
Subject: connection tracking state in rules
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

tried to create a rule using the conntrack state of a packet:

[root@sarkovy nftables]# cat ruleset-own.txt
create table netdev world
add set netdev world blacklist { type ipv4_addr; flags dynamic,timeout; 
timeout 1h; gc-interval 6h; size 256; }
create chain netdev world ingress { type filter hook ingress device 
"eth_cable" priority filter; policy drop; }
add rule netdev world ingress ip protocol tcp ip saddr @blacklist 
counter drop
add rule netdev world ingress ct state established,related counter accept
[root@sarkovy nftables]# nft -cf ruleset-own.txt
ruleset-own.txt:5:31-38: Error: Could not process rule: Protocol error
add rule netdev world ingress ct state established,related counter accept
                               ^^^^^^^^
This is rejected, but why?

And, btw., which one is correct, 'ct state established,related' or 'ct 
state { established,related }'?

Thomas

