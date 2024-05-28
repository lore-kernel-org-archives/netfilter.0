Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B056E611
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716889280; cv=none; b=C8r0HlYTmyd20wsY1erNRkqawmWSaq0IlWyITdRZHG5dsSDz5eV82CrcDQyd66Xvl54zXcAQYM8oQbSKDWeK5VvOX1bbRsdATbyCrq9wVVta0OZL4DDyyQ5BacFC7w3JId3BBuPMS+4AwWOdF0ojRJry4x+W9/LvTYQDjQAkBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716889280; c=relaxed/simple;
	bh=AFuW+pIvdfFqXX9eHfiKoSV0VU8xXPo0tC+ywCMPAYk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=eRNKkLtbkXaHuctNrX5WybcMnu1ZruPXqxPshVZguFt6YJoQz0IJtKh2KpIgqIkrKujAkG0apFEtuqFTZEMkrfcnVyJnKoHYpClvk8A5oRKxlhamIXKlMomrVCUF1jJtMmm1VMbBS5ki4EDQmyXlpJFV2+lE+BQBwTQ0y51jcZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sxl2Ld7N; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sxl2Ld7N"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-354cd8da8b9so557830f8f.0
        for <netfilter@vger.kernel.org>; Tue, 28 May 2024 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716889277; x=1717494077; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdkMjZJ29przuUvorwWq1vy46lg9tsridlnO61Z11os=;
        b=Sxl2Ld7NSDOyOhT8OluoIJRyr6KdEjltDQ2gYlwQdy9K/0g99tbDs6tWfj/hllKc8a
         dIxGsX2/oOPSHQeBIayeNTPUQml3dMSx/645l0iN/VVlDmvFBZC2PAE/R119o0/7xL5O
         FSQSTcLQ6pSeGY6xIX2pVcztZqjq+onVKKrHkfhJI1P64m0kZp8XmG5Ks4SQwj5ANb6g
         kQJIPqkNsnK5MU8UMYgRCyouuRsokI0vk1km/RdbgsE3u0gH1wYGk78n8BTpgCeJpNyg
         he9NPHiy8hNUeEjV9/ON5Aya0XuVqEoCawgpMLRiypn2Erytt3JtUQ1Ll7CxEqOdn+UU
         oOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716889277; x=1717494077;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdkMjZJ29przuUvorwWq1vy46lg9tsridlnO61Z11os=;
        b=NZ0/+3FhWzZ8iE7IsB1Sc/mOs0TrI6KE0iEx4OHg7zuQ1kRFkqEa6lC8L9fi/P7NoU
         dLZZsaR6l1K6CP2//RZdXaR8Jkf9qQrq6+kAW6LNN/cYDebt1ltQSguhb00Zrfo7ByXF
         4CFBU62Cs2NznW2FouDBPIZFv7BiX+WYnH6uUjKecl4wtrBA/ERXfLz3ayaAp9D9qF5T
         UQTFLPE21+XbTXW/bpatwRi8PlUCJo5UPUoID6sIfmvYfywwy/b85/uPfdRUYfMvSZI/
         ru8nPxaCFoWq5q7SKVo3Gb666YiF/7r8sWXU7u/DuS/iXSf0NQ4hJScd0zRNgSpXF16v
         EgUg==
X-Gm-Message-State: AOJu0YzjVa1TRJRxaTEP6PUBpz6ZPCzC4j9MC9wjyAwbbb+glI256o17
	yHxrTQhwV1nEIibFj/4liLH91mcvCQjCXZ0erUOxjmUKH0eQEatOZzd5Cg+S
X-Google-Smtp-Source: AGHT+IEsV94t+X+bAL+a+G7sb9xdxc7kpWYvcVGX3Wqvj8r4SZ07uEuvaTu6h7Fq6FbEKX4ZYriwXg==
X-Received: by 2002:a5d:4944:0:b0:34a:1a7a:9d60 with SMTP id ffacd0b85a97d-3552f4fca07mr7091021f8f.62.1716889276946;
        Tue, 28 May 2024 02:41:16 -0700 (PDT)
Received: from ?IPV6:2001:470:5139::fb2? ([2001:470:5139::fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c9570sm11107731f8f.68.2024.05.28.02.41.16
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 02:41:16 -0700 (PDT)
Message-ID: <f0c38ac0-5445-491b-9706-c1a129d77acd@gmail.com>
Date: Tue, 28 May 2024 11:41:15 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: netfilter@vger.kernel.org
From: "Tobias Jakobi (Compleo)" <tobias.jakobi.compleo@gmail.com>
Subject: Using NAT engine information to apply fwmark to packet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

looking for some pointers concerning this problem. So what I'm trying to 
achieve is to base the routing decision of a packet on the question "Was 
this packet handled by the NAT engine?".

I'm using systemd-networkd to setup NAT / masquerading on the system, 
which basically means that networkd enables forwarding for the correct 
interfaces and adds a nftables table.

Which looks like this:
table ip io.systemd.nat {
     set masq_saddr {
         type ipv4_addr
         flags interval
         elements = { 192.168.15.0/24 }
     }

     map map_port_ipport {
         type inet_proto . inet_service : ipv4_addr . inet_service
     }

     chain prerouting {
         type nat hook prerouting priority dstnat + 1; policy accept;
         fib daddr type local dnat ip to meta l4proto . th dport map 
@map_port_ipport
     }

     chain output {
         type nat hook output priority -99; policy accept;
         ip daddr != 127.0.0.0/8 oif "lo" dnat ip to meta l4proto . th 
dport map @map_port_ipport
     }

     chain postrouting {
         type nat hook postrouting priority srcnat + 1; policy accept;
         ip saddr @masq_saddr masquerade
     }
}

My naive approach was to add another table, which looks like this:
table ip nat.test {
     chain prerouting {
         type nat hook prerouting priority dstnat + 2; policy accept;
         meta mark set 0x00000007
     }
}

I can then use the fwmark 0x7 in my routing policy rule to select an 
appropriate routing table.

However this does not work properly.

When I issue a simple ping to 8.8.8.8 from my NAT client (which has the 
192.168.15.2), then I see that the ICMP packet pops up on the gateway 
(the 192.168.15.1), is then masqueraded and tagged with the fwmark, 
before eventually being send to the Google DNS, where it is answered.

So this direction "NAT client -> outside world" seems to be working. 
What is not working is the when the Google DNS replies and then whole 
masquerading stuff is done in reverse. In this case I don't see any 
fwmark being added, and hence the routing policy rule does not apply.

Looking at the netfilter flowchart 
(https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks) I 
get the impression that applying rules with priority dstnat + 2 is 
probably too late when the NAT engine detects that a packet belongs to a 
connection that it is tracking.

So I guess my question is: I this whole thing even possible, and if yes, 
how do I extract the required information from the NAT engine?

I'm currently looking into netfilter's connmark functionality, as the 
NAT engine is basically conntrack?! (is it really?) And it seems to 
allow to transfer connection marks with packet marks, which I probably 
need here.

Thanks in advance!

With best wishes,
Tobias

