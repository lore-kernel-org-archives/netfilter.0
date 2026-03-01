Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F222D837C
	for <netfilter@vger.kernel.org>; Sun,  1 Mar 2026 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772391584; cv=none; b=oOB3t8NmUQUnnDHTYl6cm1ESa5Oq/Qxydyw2HQoW1MZWFk9+FTu32oU5gn3ENwxBkoqGVafs6nIB38SqQxRVwSfysKaRHdzpuZXu9AmDJoNkqK8uqucMdLUyjq/IoQTGDpvo8/4TaE6Npy4SBwsqb2NhvakedkZ4ULLDfjIchaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772391584; c=relaxed/simple;
	bh=8p4fh4OIGaXKnT74hK+QHCMCLw4LpxzY4Z+8sX+DPVc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=aG1yBHVOXuKpIfIKx8QeMMNasexiER64lb+Xrexns/i/2i9iijKNJTqOmxg/knsbPbMu6nIqR8Lz9VSqFociP3gVuRmuHZN5ObHKV5n5tcMBlJzOfCehaOQzNWalM/dPjWAJRld3BdFDdeFko/k+tFftZuvj1iu2Q+A7vZ+MgmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlAM52Gt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlAM52Gt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso648726f8f.2
        for <netfilter@vger.kernel.org>; Sun, 01 Mar 2026 10:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772391581; x=1772996381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ31fkArUZi6oXYHFGDn+LbrDYrLxG3YOpDzpfB8sks=;
        b=NlAM52GtQz2Y8Yu4iDWtwysbGu4JXNDTjNueHMhZyYmT57q7oe2h1cTk3u6rKZpwOs
         /Cl4VKULI9pvLk1ChE98SMyREm8wmNqmOPOeKgUGpHvxinwZYO8qRfpcAag1xxsgYok5
         2ZvSQPaXEz0UE5xDyBG2Nxxf9vxpmkvgcu4Zk6VE/wRRnkB+gBuC+6PQJ0g/GzXMISrV
         GirsNh9LULWeqwK/oUo91OC1gDEvSsbMWEW/ymEq9mBGmhUBocwyU0FfxEjmrqtuMaOZ
         T6nx9Ymou2l3Pf9uk1Mw3rXtASPSgk42cuse8goQAeXbrnce4LaB5MMosUjDqJxsbqKV
         aGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772391581; x=1772996381;
        h=content-transfer-encoding:in-reply-to:from:cc:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ31fkArUZi6oXYHFGDn+LbrDYrLxG3YOpDzpfB8sks=;
        b=WZoO5O7xqW4eTmeqM507R5OpEXcJaEGJlF9OFqCyw4V+0ReGr3D9DGEqVLyYWOoQEi
         UXeD4hxZ+5Ro5wm8CxZNVgNH3KGb9O8xKs2LoloDAdSAPjAeaUkwJKKJ5CcfjdNkA9Ln
         /cE8RKrTgKm6CoPmEZqYKczp5OMamGa+IGljAERwEka1dmgOrpeMfOrWQGu2C50lHiZn
         tZp3BHC6BFpgSFd9BZIXv/HVwyhgReLxhcfqsQiO1h5j6UsojX69puvOieGykD9U6tHz
         IPd9xsGJ61hBDty2XiPg3JLFbY1SclgLmdkHb1XM5LE/1Oa3nbby+f2dVI0qNA5jYBdK
         Vyhg==
X-Gm-Message-State: AOJu0Yx1AGYBepB4BEospvSh0DjdHjiORMdoXibxZloi+JeZgPL2FkPX
	WOnWhMk368RQFtIG+1q5KN/Y0M72B+2KW7AdNHqx3V5DfKZ5orJWAnaPbKvRgw==
X-Gm-Gg: ATEYQzzI8EaZQIy3M4aHVgln82kxvEkD8af093heJdcTVeUjfdEydz8lKYFPz4+p2ro
	IMpICqnKEMkfRe+un/ZjfDVQ0lAqdEs7deD0Hz6wAIHawIR/JhLoGC6aITKacGu9jAXoM79CPQ9
	WIJAlPy7zKYFCUHtrGceU/2JGpwJDYK+9HzQyhFcn71ZirRi3ZhH2vB/u+Q6dmUZSvJgyLRRSbO
	GKGEpizQoKjzTc2hAetmxwYToDFxLNVoOyzUW9BbLsEA6ZBZgsmvFV3Ha8vkBsx9mpFSU82kbC9
	zf4nFJXvrBgGSAa1tA/OHUw5av//kSV15/Y03JMYQcDcalhZUM1fgVVXJ6NgGk0G7DsPx3dj+bj
	hNVCASvfGMUXZ2SzMQo750DmtQeRRnZFv+ASAiDehycvQF0Z/IOFKs5c8i9AAkzKhSAdH4AZVPJ
	LjhQaXsQGpdCsXX8cQQStdon3Q+nXiDYr6gKM1AyPOOURUQduJQiGb15yK+Cq0FY97EMw2gJoKS
	/Aywt7MqAEDqs6yWDFEIvyhkFAqnhHs+bPtIpoOItY=
X-Received: by 2002:a5d:584e:0:b0:439:b788:73ae with SMTP id ffacd0b85a97d-439b7887890mr1666246f8f.49.1772391580197;
        Sun, 01 Mar 2026 10:59:40 -0800 (PST)
Received: from [10.9.9.21] (69.145.73.86.rev.sfr.net. [86.73.145.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm23509157f8f.32.2026.03.01.10.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:59:39 -0800 (PST)
Message-ID: <fc37db9e-39ed-4478-bb53-887156e309b2@gmail.com>
Date: Sun, 1 Mar 2026 19:59:39 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [nftables] is it possible to declare multiple tables for a given
 family type?
Content-Language: en-US
References: <752a3ecd-b379-4b82-8ac1-a64450e14167@gmail.com>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
From: Mathias Dufresne <mathias.dufresne@gmail.com>
In-Reply-To: <752a3ecd-b379-4b82-8ac1-a64450e14167@gmail.com>
X-Forwarded-Message-Id: <752a3ecd-b379-4b82-8ac1-a64450e14167@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 2026-03-01 à 14:52, Florian Westphal a écrit :
> Mathias Dufresne<mathias.dufresne@gmail.com> wrote:
>> Hi everyone,
>>
>> I'm trying to replace my very old iptables script with nftables and I'm
>> wondering if it is possible to declare several tables of the same family.
> Sure it is.
>
>> The goal would be to sort my rules among these tables...
> Why? Its awkward.  In iptables its much better to place all filter rules
> in the filter table rather than spread them out over raw, mangle +
> filter.
That's the first time I read about raw tables...
> So why would you do that in nftables?

The goal would have been to have one table per service containing 
everything related to that specific service and nothing else.

This simplification because the whole idea is to write a nftables rules 
generator for my home firewalls. And I'm stuck on how to write the rules 
(the config itself begins to please me and rather happy with the 
extraction of that config, mixing it with routes to know what rules - 
but not their syntax - shall be written/deployed). And with lot of 
targets on each services, the result will be quickly messy to read).

It seems to me that regarding inet/ip/ip6 filtering rules, they'll have 
to reside in the same table (one inet for both ip and ip6 or one for 
each, ip and ip6). At the end of this mail I'll add some tests I made.

>>           chain input {
>>                   type filter hook input priority filter; policy accept;
>>                   iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state
>> new jump ipv4_log_ssh
>>                   oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state
>> new jump ipv4_log_ssh
> You have lots of 'sport 22 ct state new' rules, they make no sense.
> If you already use connection tracking, why do you need statless-alike
> rule?  The replies from sshd should be handled via 'ct state
> established'.
Thank you for pointing out that mistake.
>>           chain forward {
>>                   type filter hook forward priority filter; policy accept;
>>                   iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state
>> new accept
>>                   oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state
>> new accept
>>           }
> This entire chain has no effect whatsoever, the filter policy is accept
> so all packets are accepted, hence, the entire chain can be removed.
Thank you again, I believed a packet kept it's state and and had to pass 
through all three input/forward/output chain/hook with that state.
>>           chain output {
>>                   type filter hook output priority filter; policy accept;
>>                   iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state
>> new accept
>>                   oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state
>> new accept
>>           }
> Same.  All packets are accepted, so why not remove the entire chain?
; )
>>           chain input {
>>                   type filter hook input priority filter; policy accept;
>>                   ct state { established, related } counter packets 556
>> bytes 48604 accept
>>                   jump ipv4_log_drop
>>           }
> That makes more sense.  I suggest you place your other input rules here.
>
> Just like in iptables, 'accept' in raw table just means packets
> continue to travel through the stack, you need to accept them in mangle
> and again in filter table.
Do you meant the network stack or the nftables' rules stack?
> Also, base chains (those with a line like
> 'type filter hook input priority filter; policy accept;') always cause a
> slow-down: they divert all packets into the nftables vm, so its a good idea to
> minimize the amount of times this happens per packet.

Again, I'm lost there... I'm certainly lacking the basic knowledge to 
understand :/

--------------------------------------------------------------------

Here is a working single table to SSH the firewall and one LAN through 
that firewall:

table ip filter_them_all {
   chain ip_log_svc_administrative_services/ssh {
     counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'administrative services/ssh': " group 2
     counter packets 0 bytes 0 accept
   }
   chain input {
     type filter hook input priority filter; policy accept;
     ct state {established,related} counter log prefix "ACCEPT CT for 
INPUT" group 2
     ct state {established,related} accept
     iif vdi-lan             ip daddr 10.9.9.252/32 tcp dport 22 ct 
state new jump ip_log_svc_administrative_services/ssh
     iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct 
state new jump ip_log_svc_administrative_services/ssh
     counter packets 0 bytes 0 log prefix "REFUSED INPUT packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
   chain forward {
     type filter hook forward priority filter; policy accept;
     ct state {established,related} counter log prefix "ACCEPT CT for 
FORWARD"  group 2
     ct state {established,related} accept
     # these two are working and can't be omitted
     iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22         
     log prefix "ACCEPT FORWARD for ssh" group 2
     iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22         
     accept
     # these two does not work. They are NOT rejected by nft but SSH is 
not working against these targets
#   iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct state 
new log prefix "ACCEPT FORWARD for ssh" group 2
#   iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct state 
new accept
     counter packets 0 bytes 0 log prefix "REFUSED FORWARD packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
   chain output {
     type filter hook output priority filter; policy accept;
     ct state {established,related} counter log prefix "ACCEPT CT for 
OUTPUT" group 2
     ct state {established,related} accept
     counter packets 0 bytes 0 log prefix "REFUSED OUTPUT packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
}

As said in the comments inside that table, commented lines does not 
work. I would have expected they do (but my understanding of nftables is 
very minimal)

Here is another test with several filter tables, playing with priority, 
which does not work (I tried to use negative values for these 
priorities, in case of my understanding was that bad):

table ip tracked_packets {
   chain input {
     type filter hook input priority 300; policy accept;
     ct state {established,related} counter log prefix "ACCEPT CT for 
INPUT" group 2
     ct state {established,related} accept
   }
   chain forward {
     type filter hook forward priority 300; policy accept;
     ct state {established,related} counter log prefix "ACCEPT CT for 
FORWARD" group 2
     ct state {established,related} accept
   }
   chain output {
     type filter hook output priority 300; policy accept;
     ct state {established,related} counter log prefix "ACCEPT CT for 
OUTPUT" group 2
     ct state {established,related} accept
   }
}
table ip ssh {
   chain ip_log_svc_administrative_services/ssh {
     counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'administrative services/ssh': "
     counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'administrative services/ssh': " group 2
     counter packets 0 bytes 0 accept
   }
   chain input {
     type filter hook input priority 310; policy accept;
     iif vdi-lan             ip daddr 10.9.9.252/32 tcp dport 22 ct 
state new jump ip_log_svc_administrative_services/ssh
     iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct 
state new jump ip_log_svc_administrative_services/ssh
   }
   chain forward {
     type filter hook forward priority filter; policy accept;
     # these two are working and can't be omitted
     iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22         
     log prefix "ACCEPT FORWARD for ssh" group 2
     iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22         
     accept
     # these two does not work. They are NOT rejected by nft but SSH is 
not working against these targets
#   iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct state 
new log prefix "ACCEPT FORWARD for ssh" group 2
#   iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct state 
new accept
   }
}
table ip anything_else_is_refused {
   chain input {
     type filter hook input priority 320; policy drop;
     counter packets 0 bytes 0 log prefix "REFUSED INPUT packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
   chain forward {
     type filter hook forward priority 320; policy drop;
     counter packets 0 bytes 0 log prefix "REFUSED FORWARD packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
   chain output {
     type filter hook output priority 320; policy drop;
     counter packets 0 bytes 0 log prefix "REFUSED OUTPUT packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
}

His this approach - several filtering tables - valid? I mean I could 
easily have made errors in the syntax...


Sorry for all that, I'm doing my best to be clear enough ; )

Best regards,

mathais

