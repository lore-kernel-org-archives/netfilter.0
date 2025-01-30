Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3151E522
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738266035; cv=none; b=hPYRKMMZ6GQ/7Lo8ZazUKkW/hcSSjLBJE/RDxaMMhR+5eRmdUTEfLgcSuoWscAbZYwFcmMT3js60BBOSm8T5CTLwNdVZE9u7oR7UaZkbMfah6M8LtiEko0HqEAyCl/qCsl5n7MN2aybPbrG1V+iahNswTxIaPnXVTZu1lfkHAPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738266035; c=relaxed/simple;
	bh=4bIB7wb1XIsjCxgM/GMTCUdTGx9HOkFj9g851U06FFM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=uaDKb9yXmwNoI3PBV8J3Zy7SomDnB9e2PQaURs0rra2E3kzLJbuikR3izR+K/uak1mqnRZn2GEsKxwpqN+YCUb579sMmxHOYd1cjlkwitm0IwtoXqFBRsxBrECuKop1qxhRRLqlqYK3xRw6xB1mkOM9nIwLHPvc0y9zOcsX/wVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=F2GfwZ4Q; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="F2GfwZ4Q"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738265729;
	bh=4bIB7wb1XIsjCxgM/GMTCUdTGx9HOkFj9g851U06FFM=;
	h=Date:From:To:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
	 Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
	 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	 List-Archive;
	b=F2GfwZ4Q6P7T74F74OhDNnEzJYSK6+Q77hl4+I80+MsITTEAjfIMxo+Jx2xM6eK3L
	 7EZLNYrAs0BuG/2PYsMRdvfSTr2yOyjKeIXPYscZ+ppvRB19HA3T6KO2YlIBczd40+
	 DIlC2TiGcUSIcyVhaDEdZ/04kK5k7SXriRs5+WCZp2Zqr0NmK1V8vwi3FLzomK65WX
	 zH3YXJWHD+AAG3wwbS6Mv7byT0YYlmeFiuZ+s/mUIejTpMiR41V2D/IdhCorKM197k
	 XF1qh36kbk3Y3mJgksYTLB9TgJ8QGZthqOF02736cFXtlYUe5OlMR9nLopgv44HXns
	 21qMTkCefkJHvvbge3GZAJhbnByUgN86+Lo9z6ALaSWnQ6cgBAh3thQnAl2q/cpj5q
	 zB9A+A7YQP+t9nySMFZquhOFgaZYTsaKiDD/Ps5Owqi8JcLjxBXYRbT1i2ZY/jtY89
	 ZKHeCQx9RZ+O6eTTTCjY9TqXCGK+qLwL7BB8bRHLb17yk94vh2Zg+VO663i6III2s0
	 ZhUerVHg5OphN+7tXr6G4XHvAqUZTM45RjwPMJQJ1YuodOB5mE4NLHTdc1kmkhXeYz
	 TkG6mBarQsCVf4k/6cBUEYRc3I7COMGdWNArp4e7OLcJ5BlGvhXDZZwR01ysynIxuM
	 sPNX86XMjGq8E7JYbrLZNczo=
Received: from [192.168.20.110] (p5496968b.dip0.t-ipconnect.de [84.150.150.139])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 50UJZSPD4132041
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 20:35:29 +0100
Message-ID: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
Date: Thu, 30 Jan 2025 20:35:28 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
From: Binarus <lists@binarus.de>
Content-Language: en-US
To: netfilter@vger.kernel.org
Subject: Netfilter not dropping packets as it should
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear experts,

this is a cross posting, see https://unix.stackexchange.com/questions/789174/netfilter-not-dropping-packets-as-it-should. Since I didn't get an answer there for a couple of weeks, I am repeating the question here in the hope that the problem can easily be reproduced. For me this is a very important key point in understanding netfilter / nftables.

Please consider the ruleset that's at the end of this post. It doesn't make any sense, but it lets everybody reproduce the problem easily.

With this ruleset, all IPv4 packets that come in via enp0s3 are accepted in the ingress hook, but finally traverse a chain with a drop policy. Each of these chains does not contain any explicit rule besides the drop policy, and thus should behave as it would (only) contain an explicit drop verdict for all packets.

Hence, applications on that machine should not see any IPv4 packets that originate from other machines.

But they definitely do. For example, I have an SSH daemon running on that machine. The daemon listens on an IPv4 address only (in fact, I have disabled IPv6 on that machine completely by adding ipv6.disable=1 to the kernel command line). Even after I have loaded the ruleset below, I can connect to the SSH daemon via IPv4 from the outside without any issue.

Can somebody please explain why the rules below don't make the kernel drop all incoming IPv4 packets? Did I misunderstand the purpose of the drop policy?

Thank you very much in advance, and best regards,

Binarus





table netdev t_NETDEV_enp0s3 {
   chain enp0s3-ingress-filter {
     type filter hook ingress device "enp0s3" priority filter; policy drop;
     ether type 0x0806 arp ptype 0x0800 accept
     ether type 0x0800 accept
     log prefix "foo: " drop
   }
}

table ip t_IP {

   chain prerouting-nat {
     type nat hook prerouting priority dstnat; policy drop;
     log prefix "ip4-prerouting-nat:" drop;
   }
   chain prerouting-filter {
     type filter hook prerouting priority filter; policy drop;
     log prefix "ip4-prerouting-filter:" drop;
   }

   chain input-nat {
     type nat hook input priority dstnat; policy drop;
     log prefix "ip4-input-nat:" drop;
   }
   chain input-filter {
     type filter hook input priority filter; policy drop;
     log prefix "ip4-input-filter:" drop;
   }

   chain forward-filter {
     type filter hook forward priority filter; policy drop;
     log prefix "ip4-forward-filter:" drop;
   }

   chain output-nat {
     type nat hook output priority srcnat; policy drop;
     log prefix "ip4-output-nat:" drop;
   }
   chain output-filter {
     type filter hook output priority filter; policy drop;
     log prefix "ip4-output-filter:" drop;
   }
   chain output-route {
     type route hook output priority mangle; policy drop;
     log prefix "ip4-output-route:" drop;
   }

   chain postrouting-nat {
     type nat hook postrouting priority srcnat; policy drop;
     log prefix "ip4-postrouting-nat:" drop;
   }
   chain postrouting-filter {
     type filter hook postrouting priority filter; policy drop;
     log prefix "ip4-postrouting-filter:" drop;
   }
}
