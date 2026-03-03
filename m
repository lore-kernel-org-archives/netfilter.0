Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD72326952
	for <netfilter@vger.kernel.org>; Tue,  3 Mar 2026 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528426; cv=none; b=Y3OiDaRjMWvyl52/PNpRzEJwIoEvyxPV8DCFm4npm4HsXBabfVLH16t6dup2VIFdzKQ/rCbGLY69yTGx83JTQZFFH2UJa9lzqCCMIQUVl+qGinZs0471KXuwh479m3WsjanR72PKxJlvQcM56maeiafgjEK/ZVYMxskWVGL9dKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528426; c=relaxed/simple;
	bh=RJGLqhbrfP1ZLiY0fTYMSW0eV+AwRHDDyczKQJwMCIk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=vDJXD7WkXOABhyL11MUgTuLYJ++I6xO5v+0z1cMMllYFStkQXgSwz8gVpdp12V3Zon3XMscH3284hni7t0TJe7SH1vE+KaCaT27Gat7IYS9oSHUyfUfOv3A8HRHaHeb15fgCkQL+VqwD2dTCD2MLDOxiO+xbTfrIdcfSRsu5BnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJA0b5Zk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJA0b5Zk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2054726f8f.2
        for <netfilter@vger.kernel.org>; Tue, 03 Mar 2026 01:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772528422; x=1773133222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxIA8MN9/FEh72fo3dX9ooONKHxS15zLsVjSC9gv3XQ=;
        b=lJA0b5ZkDYNfotaS4fIev8wuh8CgZjwpkfe+qiUQVjfN3UdPZivxD5xdyJB6L6vvWk
         OgNUSAYrzj/H1yj5Duk7aQopmT2B1bD4pyPOiQaVDaXOMPzuwrK4fmFDG0iu0p2gScx2
         0HiVMaXfs/EIeKGDy+9qEqG7wCLLdedYP8jNhXy+fPz+18Y9rwUSQfVaMhAePh9rwHzQ
         cswM3mT9nd43ZMF1A/ifIhjDcpeKYI72VNOvhhzSvBDBWmBUvv/Z+a1fyAToBKZXl9CX
         xWEHE+IsoCsv+bg0aOjkd9QVV0ugFzmJT5g1DoNF0pr6Wh3OaJv9p2OF2dsTykq/pT4n
         qCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528422; x=1773133222;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxIA8MN9/FEh72fo3dX9ooONKHxS15zLsVjSC9gv3XQ=;
        b=d5ufqpyNELoCuE0gJljKLNqnspFy323rkuCHgtwZEBSQRMqPTUyycQta0rowvL/Gt8
         5jNYyTLya6FmxcYy3EDDyzmBvAKgrS0EfiCr0M9huswkGdDD67o/d/m9VbM1xiD52oVA
         8HW3VzwNVQ6kmZCbP9bpOsmC/OsYlXd+yw90mfB/n/53lUTcbyEUZ58FSellBWQygCz6
         Ui4gA4reL8CWH3VXQhGm7o2AqPHUA4qffBBC2lXinbPEHSsvpUK+J9tmbHC445BBBQZT
         +Wg/2nToy3KPoAlBHzVUfl3dQTYbCAj2tlJ9utFjKNFWqt1Xy9OaCJRP/wvRZUgo0/pM
         qa1w==
X-Gm-Message-State: AOJu0Yx+9LUlU5FHjzCGarHWgXo3PNkWX97y/fbuTcxCm5dN7erqZmmR
	AqEQqWWSjwJu/vMi0rK/nkJ38BED8DniXyvfWsoIVyDqEpZex10PqDFiv1CEsA==
X-Gm-Gg: ATEYQzxgvIgeVFYSUb28v/aTcuRsFdeSct23UpNBtqbMEXpLZJ8qxlmiJpjnPSnkl0l
	/fmtd8+RV0qEATZHHESqUJost+oeTEMDmcYZNwWSySFTHc9W7bzEQSrgqOuJNoYi76TY1T/UF8w
	klGYH4K4NJbSNOvRsIOi5zHWvsQtr0wCQvqRTeacAjjfqPrxWEpL4cRqIk6MJaUUUNGcboT9nwr
	Nc0Wd1jgyQ+Xswx7s0+2z5vNDy/qm4EqF6LR76iNHFc1nkscTygozczxL1pWCiLtdVahHuXQjir
	TI0cmuJKObFZj6ATCTMDO1gg/IbphbhwewUGA1hTY3GpybcrpqxEzfKD1TmNLMcYRlhx5DI8oiX
	v02Y1bs2dmv1EIXn/HXdOAXkZxVfSaZqqhP2zFQiiIckPqvccVRthAdMhl2hjoItN8gfZEBV45z
	Qkdza3J6MyBebeNoQh8xTSDyYfxiQiEl94YLXMqjhry2S22vnfj76SBYST2zvThIfg0BEKIu5Xd
	UWZtXcAP49kiJmIEpxsXFd0xs9H2wyrN9IZTQd+NWJZAsI9usjN0Q==
X-Received: by 2002:a05:6000:400c:b0:439:b59e:5e64 with SMTP id ffacd0b85a97d-439b59e60e0mr12272208f8f.11.1772528422001;
        Tue, 03 Mar 2026 01:00:22 -0800 (PST)
Received: from [10.9.9.21] (69.145.73.86.rev.sfr.net. [86.73.145.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1116698sm20439935f8f.16.2026.03.03.01.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:00:20 -0800 (PST)
Message-ID: <13ad3356-3f65-49a6-bc00-df7db6490d27@gmail.com>
Date: Tue, 3 Mar 2026 10:00:18 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [nftables] conntrack behavior wondering
From: Mathias Dufresne <mathias.dufresne@gmail.com>
To: netfilter@vger.kernel.org
References: <38a228ab-1e58-4d93-8b28-0013d9bdd2ad@gmail.com>
Content-Language: en-US
Cc: mathias.dufresne@gmail.com
In-Reply-To: <38a228ab-1e58-4d93-8b28-0013d9bdd2ad@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, me again : )

My understanding of linux firewalling was far worst than I expected.

input/output are used by connections to localhost only and packets 
passing through the firewall do not use them. Packets passing through 
the firewall only use forward.

Now regarding the fact I was needing to accept packet without using CT 
it was a route issue. I built a test firewall to not break everything 
while doing these tests and I forgot to modify routes on SSH servers 
which replying through the normal router, not the test firewall.

SSH client -> test FW -> SSH server -> usual router -> SSH client

This made CT crazy enough to not match related/established.

My bad. Sorry all that noise ; )

Best regards,

mathias

Le 2026-03-02 à 20:57, Mathias Dufresne a écrit :
> Hi everyone,
>
> I don't understand conntrack behavior while forwarding packets. For me 
> a packet kept its status of being new, related or established all the 
> way, until it reached the target.
>
> Below is the configuration I tested. In that configuration input, 
> forward and output are:
>
> - accepting related and established packets
>
> - jumping to service chain
>
> - dropping everything after logging the drop.
>
> This configuration allows SSH connection correctly but in a strange 
> manner:
>
> - SSH to the firewall (10.91.62.172/32) works well and generates only 
> one log, the on from chain ip_log_svc_administrative_services/ssh 
> which logs NEW packet from input hook.
>
> - SSH through the firewall works (the connection works) but logs are 
> strange (to me at least) as :
>
>   - no logs from chain ip_log_svc_administrative_services/ssh which 
> logs NEW packet from input hook.
>
>   - no logs for output hook which shall see a new packet and shall not 
> match established/related rule and then shall throw the packet 
> to chain svc-ssh-out, but no log from there.
>
>   - there logs from forward once the packet has been passed to chain 
> svc-ssh-fwd but the logs which are generated are always the logs of 
> rules without ct state. Both previous pairs of rules using ct state 
> are ignored.
>
> If packets are supposed to keep the CT status along all three hooks, 
> I'd expect one log from input as new, two others logs for new from 
> forward then from output and finally logs from forward as 
> related/established.
>
> Sorry about all noise I'm producing on your list but I'm puzzled...
>
> Cheers,
>
> mathias
>
> PS : except for my misunderstanding of CT, service chains are working 
> magnificently, thank you again ; )
>
> -------------------------------------------------------------------------- 
>
>
> table ip filter_them_all {
>   chain ip_log_svc_administrative_services/ssh {
>     counter packets 0 bytes 0 log prefix "Accept ip SVC for 
> 'administrative services/ssh': " group 2
>     counter packets 0 bytes 0 accept
>   }
>   chain svc-ssh-inp {
>     iif vdi-lan             ip daddr 10.91.62.172/32 ct state new jump 
> ip_log_svc_administrative_services/ssh
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new jump 
> ip_log_svc_administrative_services/ssh
>     counter packets 0 bytes 0 log prefix "SSH INP KO." group 2
>     counter packets 0 bytes 0 drop
>   }
>   chain svc-ssh-fwd {
>     # these don't seem to work. YET!
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new     
>               log prefix "ACCEPT NEW FORWARD for ssh" group 2
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new     
>               accept
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state 
> {established, related} log prefix "ACCEPT REL/EST FORWARD for ssh" 
> group 2
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state 
> {established, related} accept
>     # these two are working and STILL can't be omitted
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 log prefix 
> "ACCEPT FORWARD for ssh" group 2
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 accept
>     counter packets 0 bytes 0 log prefix "SSH FWD KO." group 2
>     counter packets 0 bytes 0 drop
>   }
>   chain svc-ssh-out {
>     # these are never used
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new log 
> prefix "ACCEPT NEW OUTPUT for ssh" group 2
>     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new accept
>     counter packets 0 bytes 0 log prefix "SSH OUT KO." group 2
>     counter packets 0 bytes 0 drop
>   }
>   chain svc-dns-req {
>     ip daddr 10.195.171.240/32 accept
>   }
>   chain svc-dns-res {
>     ip saddr 10.195.171.240/32 accept
>   }
>   chain input {
>     type filter hook input priority filter; policy drop;
>     ct state {established,related} accept
>     tcp dport 22 jump svc-ssh-inp
>     udp dport 53 jump svc-dns-req
>     counter packets 0 bytes 0 log prefix "REFUSED INPUT packet as it 
> reached the end of filtering rules stack." group 2
>     counter packets 0 bytes 0 drop
>   }
>   chain forward {
>     type filter hook forward priority filter; policy drop;
>     ct state {established,related} accept
>     tcp dport 22 jump svc-ssh-fwd
>     udp dport 53 jump svc-dns-req
>     counter packets 0 bytes 0 log prefix "REFUSED FORWARD packet as it 
> reached the end of filtering rules stack." group 2
>     counter packets 0 bytes 0 drop
>   }
>   chain output {
>     type filter hook output priority filter; policy drop;
>     ct state {established,related} accept
>     tcp dport 22 jump svc-ssh-out
>     udp sport 53 jump svc-dns-res
>     counter packets 0 bytes 0 log prefix "REFUSED OUTPUT packet as it 
> reached the end of filtering rules stack." group 2
>     counter packets 0 bytes 0 drop
>   }
> }
>
> -------------------------------------------------------------------------- 
>
>
>
