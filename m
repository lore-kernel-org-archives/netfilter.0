Received: from 0.smtp.remotehost.it (0.smtp.remotehost.it [213.190.28.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A474051
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.190.28.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717054039; cv=none; b=fDSqMwZdTKfj5tnSahaJtS6HgfOUAl3kuNSN6sOL3oVsjGDiKLWKXJsdguikloZUfbPcSYjkeW0m6UAtdmqIbyVsKvkDgjP+zROWrRnZU5L2YM08HGWD8P6yJuw0hfCx9j+1aGW+6C43Nwq8OqkZiboj7WDmTsojuWu1PMy6Cvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717054039; c=relaxed/simple;
	bh=LBbF/E0FSh/ZF3dY5DmwTyW4wMs2+RWpCuDNkOlGnhk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=reBBLAKhsHo5R44aK/ztqLdFsbYNyDxjFh3qrMqQMyr5dLjWn/kLjW494m9cdnJbwfHObKtFGsSrpoez3+DR/9Z8ZVst17WVfnMkV9cOtEjVh/AWPY1H/Imly3mR3dyBS8o4P4bCTp09a0U1n4uHQNK95HKtTdkuQlQn+ijOdGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardfalcon.net; spf=pass smtp.mailfrom=hardfalcon.net; dkim=permerror (0-bit key) header.d=hardfalcon.net header.i=@hardfalcon.net header.b=5ZwU7WqJ; arc=none smtp.client-ip=213.190.28.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardfalcon.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardfalcon.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=hardfalcon.net header.i=@hardfalcon.net header.b="5ZwU7WqJ"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardfalcon.net;
	s=dkim_2024-02-03; t=1717054025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2kSxOZJa3VtcxhKYJI8mHl9mmq6bCYtFwzl9euWbdY=;
	b=5ZwU7WqJfZmky5XEcv8KePhXgqdFz+QzhCYiWbrvxpahs22HjM/2sy+qVcu20ISP6tQBbP
	Xn7doULM/3b+ZDBA==
Message-ID: <c2c52fe9-5ff1-4eb9-96e5-81e645e77b50@hardfalcon.net>
Date: Thu, 30 May 2024 09:27:02 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: netfilter@vger.kernel.org
Content-Language: en-US
From: Pascal Ernster <netfilter@hardfalcon.net>
Subject: Cant get "tcp dport 22 @ih,0,32 0x5353482d" to work/match
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


I'm trying to write an nftables rule set that should eventually allow 
multiplexing SSH and TLS on TLS port 443. The idea is to match the 
"SSH-" string in the TCP payload of the SSH client's first packet of the 
connection/handshake to port 443, and then redirect/forward that TCP 
connection to port 22, where the actual SSH server is running.

However, I seem unable to get "@ih" expressions to work/match at all - 
even when I write two "@ih" expressions that should match the exact 
complement of each other, none of them match anything. Here's the full 
output of "nft list ruleset" after one SSH connection to port 22:

> # nft list ruleset
> table inet filter {
> 	chain input {
> 		type filter hook input priority filter; policy drop;
> 		ct state invalid drop comment "early drop of invalid connections"
> 		ct state { established, related } accept comment "allow tracked connections"
> 		iif "lo" accept comment "allow from loopback"
> 		ip protocol icmp accept comment "allow icmp"
> 		meta l4proto ipv6-icmp accept comment "allow icmp v6"
> 		udp dport 51820 accept comment "allow wireguard"
> 		tcp dport 22 @ih,0,32 0x5353482d counter packets 0 bytes 0 log prefix "##### SSH DEBUG 1 ##### " flags all accept comment "allow SSH- via SSH port"
> 		tcp dport 22 @ih,0,32 != 0x5353482d counter packets 0 bytes 0 log prefix "##### SSH DEBUG 2 ##### " flags all accept comment "allow SSH- via SSH port"
> 		tcp dport 22 counter packets 1 bytes 80 log prefix "##### SSH DEBUG 3 ##### " flags all accept comment "allow SSH- via SSH port"
> 		tcp dport 22 accept comment "allow ssh"
> 		udp dport 443 accept comment "allow http/3"
> 		tcp dport 443 @ih,0,32 0x5353482d counter packets 0 bytes 0 log prefix "##### SSH DEBUG 4 ##### " flags all accept comment "allow SSH- via HTTPS port"
> 		tcp dport 443 @ih,0,32 != 0x5353482d counter packets 0 bytes 0 log prefix "##### SSH DEBUG 5 ##### " flags all accept comment "allow SSH- via HTTPS port"
> 		tcp dport 443 counter packets 45 bytes 3052 log prefix "##### SSH DEBUG 6 ##### " flags all accept comment "allow SSH- via HTTPS port"
> 		tcp dport 443 counter packets 0 bytes 0 accept comment "allow https"
> 		tcp dport 80 accept comment "allow http"
> 		counter packets 0 bytes 0 continue
> 	}
> 
> 	chain forward {
> 		type filter hook forward priority filter; policy drop;
> 		counter packets 0 bytes 0 continue
> 	}
> }


Note that the incoming SSH connection on port 22 only incremented the 
counter for the "SSH DEBUG 3" line, but not the counter for any of the 
two preceding lines ("SSH DEBUG 1" and "SSH DEBUG 2"). What am I doing 
wrong?

I'm using Arch Linux x86_64 with testing repos enabled, with the 
nftables package 1:1.0.9-3 from the Arch repos, and a custom kernel 
that's basically the equivalent of linux-hardened 6.9.3-rc1.


Regards
Pascal
