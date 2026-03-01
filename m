Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4930E2D46B3
	for <netfilter@vger.kernel.org>; Sun,  1 Mar 2026 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772359943; cv=none; b=eY5q9fMDhp4gqKBrRoVh3A2ZKngOPT4eDJoGaOeXdJkKAKuCxNPHaG8/52SfpKZvIbXsRWxRBUHmNhpdmkRUvUuIwhgRBPX9gDiMcV905uqJK4v9eayVat9AXi6C2XUpWHLvoukI83fn5+HzsbMmqhcHnMMBMqDu6CJHAbt2yB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772359943; c=relaxed/simple;
	bh=xmfGmxh16wrrZPUHQ+4gEdYIAD6GBfoxmw/L2GFhtR8=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=OLR+X39Bi16DeN8xBnh52nwzTk8hXSWVZ8dP307dr3UTlp3bfhszJP5KRL0TzE89sBlXNl5jSuNXXfJexGPTmz/voWseIj2unF6KBQV3oLOoW10ZsUWkNK1gSLYBu9qXYcWvmqDAYDAnE1ePtx0jtRTLztAuzGprKiH6uFUInXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHWWncCh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHWWncCh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-436e8758b91so2221502f8f.0
        for <netfilter@vger.kernel.org>; Sun, 01 Mar 2026 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772359940; x=1772964740; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvZ1FVeahJK1R+EUendBjZONoRjDxcKXYbDWLnung30=;
        b=eHWWncChpZAbaJx61CDdlQFcv9LFgGSoiG3q9/Fp3n5aNrvoL4QLZul4SR+9GP10//
         jmwwAPe+A18CDxnJUnCgcrHAF2lPCsNtcrqcvUxBUbnXNCjN03ru5GEU1cmUN6Da2XYO
         m4y8HETmDzmI3pxvUmw6OK+ClPY7w58yxUq3+Fkn+EqbKrToqE3HZ75w6c47AjwVle07
         5oDVHl/ZUBmLBVMDNBWwDZ74qDQRwjdmHr3k/pPiZZjcsZKw6GTLPkyCVbFqMNr0TDow
         26Ce1GVCBU0RXBfhA2hp3vsvKaNMfSsMrFnUrXKenbYShY4Il8s1sJcBd6nbBuIO65kJ
         OTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772359940; x=1772964740;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvZ1FVeahJK1R+EUendBjZONoRjDxcKXYbDWLnung30=;
        b=RO4KJxUiaHkR7o2U2VVbdFpd0Z1wwRbOh6JLO3nhd9LlISUEobTduxirHoWe4tE0vg
         upjqA6hSL5+WvNKadxLfLRECr4ZAtMCZpZps0tRYSudwSARPBszA3+NmKAUtOZ9EYMpM
         gccIyIPb0BVQQaoeSCOeM9gIJJAXS+m4c5s4Kkc/gB/CPClnXYL0hptrIwDc52yDGzNh
         TRvKKpcuBbsXRNHjDQN5cVS7joQ1SF1fURRvw3ZlejxXwUydPwrNVqee/Xg1Hn3PCjTc
         leHTjC1Lw4mo9a8QarvRoqIuvhMqQhNPPuuUnXnegE66QR/K8i9q9u+C/iws8BAprQrn
         75Sg==
X-Gm-Message-State: AOJu0Yw42RsDRfHmqMdmC862YsSbdH8j3vo0Z2L/Qa0YLlMaRNs5N/L2
	V31OsHBW6ZztpUpbO8dlD9On2snxEmd4u5QYOtlDHgyw5wOxtH3mEdnkq2Dp3A==
X-Gm-Gg: ATEYQzxfQ7LK7JOnL/sLUSg7u3CflNnDIjMDKBJrtLMcgtC3OweFHPnFMwKvnwdxvtt
	uG56yyMQlYwM+wLnpxbatlDbTFBDt47104pXjrN2exhTkdDHSmNzUUNJjk6flvmlgwFb9FlYOc5
	kOuso9pvt4GlmGwK6pBnnIfJLdMqcpaMzlGvDzR8mZRw0FKTBu1dJuameMZT/sGPzxMdWUHfBE4
	t6XxvXwaTbm+DSnFpxUlen30LLNesyLeIByCqdnxS4vEmEUSm2OuArFBAEZUoo8JhOeFeyr52+q
	S0E3WT40jAHMGsKZKeJx79UL2zveGYB1Nw+t+XJRqbNCYXz699A+8Y3o/MkD73KgN1YhqvMVVGs
	0A7Cgze+Pc2kDynIDnxWj9wa3y44kadgwmC8n1Hv+kySb/5V6E/jScshKxFQ5BtNnhkPeU0HQFH
	Coli2nJ8KVFj92OYEi/0B9s2QQCCc2S+uP8hVt+FxUWCnOePRtMFoita/RxHrUTQ7BUSyjP+nti
	LRISOyL+Faa7f5ZUTOOqZX0jmj8JuZX+ff2Jz3stek=
X-Received: by 2002:a05:6000:2901:b0:439:869a:a15 with SMTP id ffacd0b85a97d-4399de30dfdmr13889726f8f.42.1772359940341;
        Sun, 01 Mar 2026 02:12:20 -0800 (PST)
Received: from [10.9.9.21] (69.145.73.86.rev.sfr.net. [86.73.145.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm2186455f8f.17.2026.03.01.02.12.19
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 02:12:19 -0800 (PST)
Message-ID: <ecfa18a6-3488-43cb-8ba5-00dfeeac8a01@gmail.com>
Date: Sun, 1 Mar 2026 11:12:19 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mathias Dufresne <mathias.dufresne@gmail.com>
To: netfilter@vger.kernel.org
Subject: [nftables] is it possible to declare multiple tables for a given
 family type?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

I'm trying to replace my very old iptables script with nftables and I'm 
wondering if it is possible to declare several tables of the same family.

As far as my tests went, it seems it is not or that I did not understand 
the ordering of rules...

The goal would be to sort my rules among these tables...

Something like that:
===============================================================================
table ip filter_SSH {
         chain ipv4_log_ssh {
                 counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'administrative services/ssh': "
                 counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'administrative services/ssh': " group 2
                 counter packets 0 bytes 0 accept
         }

         chain input {
                 type filter hook input priority filter; policy accept;
                 iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state 
new jump ipv4_log_ssh
                 oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state 
new jump ipv4_log_ssh
         }

         chain forward {
                 type filter hook forward priority filter; policy accept;
                 iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state 
new accept
                 oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state 
new accept
         }

         chain output {
                 type filter hook output priority filter; policy accept;
                 iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state 
new accept
                 oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state 
new accept
         }
}
table ip filter_DNS {
         chain ipv4_log_dns {
                 counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'DNS': "
                 counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'DNS': " group 2
                 counter packets 0 bytes 0 accept
         }

         chain input {
                 type filter hook input priority filter; policy accept;
                 iif "eth12" ip daddr 172.16.0.2 udp dport 53 jump 
ipv4_log_dns
                 oif "eth12" ip saddr 172.16.0.2 udp sport 53 jump 
ipv4_log_dns
         }

         chain forward {
                 type filter hook forward priority filter; policy accept;
                 iif "eth12" ip daddr 172.16.0.2 udp dport 53 accept
                 oif "eth12" ip saddr 172.16.0.2 udp sport 53 accept
         }

         chain output {
                 type filter hook output priority filter; policy accept;
                 iif "eth12" ip daddr 172.16.0.2 udp dport 53 accept
                 oif "eth12" ip saddr 172.16.0.2 udp sport 53 accept
         }
}
table ip ZZZ_accept_related {
         chain ipv4_log_drop {
                 counter packets 0 bytes 0 log prefix "DROP: dropping 
everything else"
                 counter packets 0 bytes 0 log prefix "DROP: dropping 
everything else" group 2
                 counter packets 0 bytes 0 drop
         }

         chain input {
                 type filter hook input priority filter; policy accept;
                 ct state { established, related } counter packets 556 
bytes 48604 accept
                 jump ipv4_log_drop
         }

         chain forward {
                 type filter hook forward priority filter; policy accept;
                 ct state { established, related } counter packets 0 
bytes 0 accept
                 jump ipv4_log_drop
         }

         chain output {
                 type filter hook output priority filter; policy accept;
                 ct state { established, related } counter packets 557 
bytes 49124 accept
                 jump ipv4_log_drop
         }
}
===============================================================================

Best regards,

mathias


