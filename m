Received: from mail.spoje.net (mail.spoje.net [82.100.58.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669793EC2E6
	for <netfilter@vger.kernel.org>; Tue, 14 Apr 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.100.58.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183109; cv=none; b=Hhi6UegNc106xYo2GWIgiAZnWxx2MDH9gPC1rnNYIcf6OwgzpqpMJS/oYNgztY6h7N2C9ULwiXgBVCOJLFUkIMZlKz69ULOPP1w0KgPjMfCND3OE7RGXG/xk1qZr+GCxxkLcXH09l8gOpCQg6VLDqb9iWKW4m/oi4ej8XQ7jCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183109; c=relaxed/simple;
	bh=Qw/UpIKGdspkIwFXlRoQJZdHfsQzIhYaebloOcLH9uI=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=IEv7b3APfAh33atn98mYHji7TDuX+X3XoaP0Es9pl0xBSJosQl4A7c3Q6RQNhF5ybwxZL/0l/BiQ1ya+5imLbBklLdJBz6wpAUOoASEDS3dqpO/nvjMudpfezEPUIqKz1IWwQXcpBj9dx5nnjxCqrsNE0h6mTqA3iylDAN8R7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=spoje.net; spf=pass smtp.mailfrom=spoje.net; dkim=pass (1024-bit key) header.d=spoje.net header.i=@spoje.net header.b=uNHdMON8; dkim=pass (1024-bit key) header.d=spoje.net header.i=@spoje.net header.b=U8dO+7yo; arc=none smtp.client-ip=82.100.58.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=spoje.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spoje.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=spoje.net header.i=@spoje.net header.b="uNHdMON8";
	dkim=pass (1024-bit key) header.d=spoje.net header.i=@spoje.net header.b="U8dO+7yo"
Received: from localhost (localhost [127.0.0.1])
	by mail.spoje.net (Postfix) with ESMTP id 5149218EB1A9
	for <netfilter@vger.kernel.org>; Tue, 14 Apr 2026 18:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
	s=spojemail; t=1776183103;
	bh=Qw/UpIKGdspkIwFXlRoQJZdHfsQzIhYaebloOcLH9uI=;
	h=Date:From:To:Subject:From;
	b=uNHdMON8CloTQp6fPSJv+F5CAkrhgbbSqhi9T1Py4+u207RB9+r+jiFvUyFxccNcF
	 7kTa4ou8QsAi8UN4HIR42ulHyUjn0jBhtyvkJrW9X8VyjzB9K1EwWD2idiABPuox/g
	 LTR6Luf4YLhbhEeH0YjDvJo827kmtezGNAf80P14=
X-Virus-Scanned: Debian amavisd-new at mail.spoje.net
Authentication-Results: mail.spoje.net (amavisd-new); dkim=pass (1024-bit key)
	header.d=spoje.net
Received: from mail.spoje.net ([127.0.0.1])
	by localhost (mail.spoje.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qykh8qRgwl0C for <netfilter@vger.kernel.org>;
	Tue, 14 Apr 2026 18:11:41 +0200 (CEST)
Received: from mail.spoje.net (localhost [127.0.0.1])
	by mail.spoje.net (Postfix) with ESMTP id ECC2F18EB1A0
	for <netfilter@vger.kernel.org>; Tue, 14 Apr 2026 18:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
	s=spojemail; t=1776183101;
	bh=Qw/UpIKGdspkIwFXlRoQJZdHfsQzIhYaebloOcLH9uI=;
	h=Date:From:To:Subject:From;
	b=U8dO+7yoDOMqhhJaGw1Z+NLQ7mDCnnGY2OdPKgK7MpgHugEoKzg/aO/d96HYofoov
	 Via7RO6zhsZvEXO+yhgRQUbZSrfsTSUEuk7/fzcjAynD7I2n5zT4BUjgNTQVl71Ioy
	 Ukq++AR90pWKN/xJ3fM1MlPDUoSuHjXFr45juQoI=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 18:11:40 +0200
From: Tomas Mudrunka <mudrunka@spoje.net>
To: netfilter@vger.kernel.org
Subject: Using NFT for dynamic per-packet traffic load balancing
Message-ID: <b1e1c08ec510f963bafff40065e8f8c2@spoje.net>
X-Sender: mudrunka@spoje.net
Organization: SPOJE.NET s.r.o.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hello
I was experimenting with using NFT to balance traffic between several 
links, this is what i came up with:

table bridge balancer {
     chain egress_forward {
         type filter hook forward priority filter; policy accept;
         meta ibrname br0 drop;
     }
}

table netdev balancer {
     map dispatch_map {
         typeof numgen random mod 100 : oif
         flags interval
         elements = {
             0-9   : "eth0",
             10-29 : "eth1",
             30-99 : "eth2",
         }
     }

     chain br_egress {
         type filter hook egress device br0 priority filter; policy drop;
         fwd to numgen random mod 100 map @dispatch_map
     }
}


You create bridge br0 with eth0-eth2 interfaces in it.
There is a map that sets weights of how much traffic should be directed 
to individual links, so you can fully use multiple links even when the 
bandwidth is not equal.
For wireless links you can even get signal quality feedback from radio 
hardware and live tune the map based on it. Tried up to 10 times a 
second without any issues using following command:

echo 'flush map netdev balancer dispatch_map; add element netdev 
balancer dispatch_map { 0-32 : "eth0", 33-66 : "eth1", 67-99 : "eth2" }' 
| sudo nft -f -

Being able to dynamicaly fine tune this map from userspace in realtime 
is killer-feature of this approach and cannot be achieved by regular 
linux interface bonding (link aggregation). While it is very important 
for me, i agree this is quite niche requirement.

The nft ruleset prevents bridge from actualy forwarding between ports, 
so each frame is sent only via single randomly selected interface. 
Received packets are not forwarded anywhere except for local ip stack.

I know this setup is still quite rough, but i wonder if there is 
something that can be improved. It seems to be really interresting 
topic.

Maybe i don't like using "fwd to" and should just drop frames on all 
interfaces except for one. because right now i cannot see egress frames 
on br0 using wireshark, only ingress.

Maybe i can ditch bridge completely and use dummy interface instead? I 
am not sure what is cleanest way. i want to be able to use wireshark to 
see all frames going through the load balancing on single interface, 
which is not really happening right now. but i can observe individual 
interfaces, which is not as useful, but allowed me to verify the 
ballancing works properly and follows weight ratio defined in the map.

Do you have any experience with such approach? or suggestions?

-- 
Best regards
      Tomáš Mudruňka
