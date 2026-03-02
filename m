Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629A317145
	for <netfilter@vger.kernel.org>; Mon,  2 Mar 2026 19:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481478; cv=none; b=WxwHntyN/UZ40CG3gN0GhLagm/wAYu79QUz/YBxsokAqzZoemhSB7t5EQTmow9d9yv8AaLOssxnfvzp9D+Vg/cciNoIYAFkEKOrOUGlClipaCiDqULtajkGEmjhTLdpZ4yB076it0IbdK2arJZlrs8u8Pp07wrOAK7FE+XDRnlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481478; c=relaxed/simple;
	bh=i3gkuOBcly40cxWelWYD2otB29R7WwMo10+rL7yPZFY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=k52v+1RHDYeLxcpCj8myNP2mroidD6t107rNwxyF4ORqOHl0FF+pcR2blYs/etARi6/AOEV3dGGpUtFfSHNNl81atdf7xchF7k1c1MSYPal/9qsbZkb+U1oCV2jtCGz+sNcM6TF1njpVjP79dvZ5g0wACuorH5Hl6DKI+X2GeGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiwKXJ+j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiwKXJ+j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b78b638eso1390221f8f.2
        for <netfilter@vger.kernel.org>; Mon, 02 Mar 2026 11:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772481474; x=1773086274; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mkv1mdJWjZfQMN2hbTEKtEX1OnzMYrPmTO1WfcfamTI=;
        b=aiwKXJ+j6EmP/tY31SjQOYP8KCVrdRL6UPFpRo//qGZPspmo1TGFOFROWXmk1rBYTT
         nsA9v4vPJ/r9Qw+88tPKs8cBbGIQDXRmzpgtjYZXYmrFYY0s8eqF2ew0u4KIpOIAd0QJ
         0vSz2Tg9sVrepAgJrh+Hdiz3m0RGOtRtlJbb1shP4q6/0z+pcN8ZzGy5m6kAaxMKOSjk
         WGBh4OTm7bYaeWpqKn4Qb6z0DCSn4A7+aqlvtgTSGcNQP4YDDTwRFTlIzx55PlreLJ0/
         r9ckzFAXPXIeTVoYMZHeqc+n9NnYS8PeAgof2+5184ZZ2lHU0FsI60PlqyaDJJNcCs/2
         rw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772481474; x=1773086274;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mkv1mdJWjZfQMN2hbTEKtEX1OnzMYrPmTO1WfcfamTI=;
        b=aZMxcn9u8TXXIJWVckahGe4PJgese8CugjLqx5IFH9nkptdSUJmhix7VL+qTDdMO9N
         ZCRw/SolSsLBqlU4O/3zROUwqvlgA4fMcIiz+Ut0P6SAXlGanUzWyP9jkVviUqEwgM2P
         951OFEuh3UMH19rdTxSO5oFAv/kwxuoA2dyo9ocXK1V5SQp2o5VAJe+yAQDIqmENO5cr
         fJTT8Zpg5iWuirTQqJQo2w9MKn4zE6YVzr4HYkkl8OQxLv7rfr5ro1Re+c4Gc9hQpNsN
         G95H7kHfSx+xfbxTuG4QOE4sUTv8gQJvqy4IZUULwZbj0xfNu5ifQwGZoxOKz890or9D
         jDKA==
X-Gm-Message-State: AOJu0Yx7oPs4vfy2ADy1GEdx9sib7RdCLoYGyQg5Y7v4GP8PlLsuzNbI
	/7MXqPMxx2c3sZge0QrR7DByUyUOheG27NKOywfBTSqkRy0AqHcNzLLZgASgyA==
X-Gm-Gg: ATEYQzxSsiG5/SSWqqCnkT5s9bwlDPvaoSQOkflmeb6VIrqRorTEbzHJOgG6UzsDt5s
	m2SNY+zssDTJaZtUEoTjRaX/1VW3N5bbjRUBNUixtn79VhmQdI+4wKBNKbqul0gzb5HYiQl8EqR
	suGFG0c1SoT/cIzdYepFZC7ppApqpXLGAez1Dkp2rDfmroV+JphhnABp1k59rJfRKfEEGAAwN1P
	iL94zf68OaS27/2OJc0x7BIgcziNp9GSymeEx//kiHKkgr8nertCuecXwDVVvXsnng+oNrVN5DJ
	yc2fOGi6nFya+9Ud5T1kzbPBvZGULO3Sget+BFq6OrHfc6lNPMyHURTMlAE1La4FXAY2uTW3fS1
	DW55sb5ZXGVP/fDb1vLGiXojQZaQEGI+xCPOyduFvOKSGM7v7tYGeA0ZtNTzblRWEsMMxTrSyVe
	Q7f4YK2/QFNM9olyUiDDkNL0fdX27haVgNmaHwkiwwHEveQKO6dNhnzSyW+sObloymC8ODjLJga
	ATg7QIyL/+c3LAX6ZSLdgpGc99MLtQ1SaWOlS49/Fg=
X-Received: by 2002:a05:6000:2c0c:b0:439:b7c9:2efa with SMTP id ffacd0b85a97d-439b7c930demr8039658f8f.32.1772481473553;
        Mon, 02 Mar 2026 11:57:53 -0800 (PST)
Received: from [10.9.9.21] (69.145.73.86.rev.sfr.net. [86.73.145.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4d06c27sm10902048f8f.17.2026.03.02.11.57.52
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 11:57:53 -0800 (PST)
Message-ID: <38a228ab-1e58-4d93-8b28-0013d9bdd2ad@gmail.com>
Date: Mon, 2 Mar 2026 20:57:52 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: netfilter@vger.kernel.org
From: Mathias Dufresne <mathias.dufresne@gmail.com>
Subject: [nftables] conntrack behavior wondering
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

I don't understand conntrack behavior while forwarding packets. For me a 
packet kept its status of being new, related or established all the way, 
until it reached the target.

Below is the configuration I tested. In that configuration input, 
forward and output are:

- accepting related and established packets

- jumping to service chain

- dropping everything after logging the drop.

This configuration allows SSH connection correctly but in a strange manner:

- SSH to the firewall (10.91.62.172/32) works well and generates only 
one log, the on from chain ip_log_svc_administrative_services/ssh which 
logs NEW packet from input hook.

- SSH through the firewall works (the connection works) but logs are 
strange (to me at least) as :

   - no logs from chain ip_log_svc_administrative_services/ssh which 
logs NEW packet from input hook.

   - no logs for output hook which shall see a new packet and shall not 
match established/related rule and then shall throw the packet to chain 
svc-ssh-out, but no log from there.

   - there logs from forward once the packet has been passed to chain 
svc-ssh-fwd but the logs which are generated are always the logs of 
rules without ct state. Both previous pairs of rules using ct state are 
ignored.

If packets are supposed to keep the CT status along all three hooks, I'd 
expect one log from input as new, two others logs for new from forward 
then from output and finally logs from forward as related/established.

Sorry about all noise I'm producing on your list but I'm puzzled...

Cheers,

mathias

PS : except for my misunderstanding of CT, service chains are working 
magnificently, thank you again ; )

--------------------------------------------------------------------------

table ip filter_them_all {
   chain ip_log_svc_administrative_services/ssh {
     counter packets 0 bytes 0 log prefix "Accept ip SVC for 
'administrative services/ssh': " group 2
     counter packets 0 bytes 0 accept
   }
   chain svc-ssh-inp {
     iif vdi-lan             ip daddr 10.91.62.172/32 ct state new jump 
ip_log_svc_administrative_services/ssh
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new jump 
ip_log_svc_administrative_services/ssh
     counter packets 0 bytes 0 log prefix "SSH INP KO." group 2
     counter packets 0 bytes 0 drop
   }
   chain svc-ssh-fwd {
     # these don't seem to work. YET!
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new       
             log prefix "ACCEPT NEW FORWARD for ssh" group 2
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new       
             accept
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state 
{established, related} log prefix "ACCEPT REL/EST FORWARD for ssh" group 2
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state 
{established, related} accept
     # these two are working and STILL can't be omitted
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 log prefix "ACCEPT 
FORWARD for ssh" group 2
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 accept
     counter packets 0 bytes 0 log prefix "SSH FWD KO." group 2
     counter packets 0 bytes 0 drop
   }
   chain svc-ssh-out {
     # these are never used
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new log 
prefix "ACCEPT NEW OUTPUT for ssh" group 2
     iif vdi-lan oif svc-web ip daddr 10.207.184.0/24 ct state new accept
     counter packets 0 bytes 0 log prefix "SSH OUT KO." group 2
     counter packets 0 bytes 0 drop
   }
   chain svc-dns-req {
     ip daddr 10.195.171.240/32 accept
   }
   chain svc-dns-res {
     ip saddr 10.195.171.240/32 accept
   }
   chain input {
     type filter hook input priority filter; policy drop;
     ct state {established,related} accept
     tcp dport 22 jump svc-ssh-inp
     udp dport 53 jump svc-dns-req
     counter packets 0 bytes 0 log prefix "REFUSED INPUT packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
   chain forward {
     type filter hook forward priority filter; policy drop;
     ct state {established,related} accept
     tcp dport 22 jump svc-ssh-fwd
     udp dport 53 jump svc-dns-req
     counter packets 0 bytes 0 log prefix "REFUSED FORWARD packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
   chain output {
     type filter hook output priority filter; policy drop;
     ct state {established,related} accept
     tcp dport 22 jump svc-ssh-out
     udp sport 53 jump svc-dns-res
     counter packets 0 bytes 0 log prefix "REFUSED OUTPUT packet as it 
reached the end of filtering rules stack." group 2
     counter packets 0 bytes 0 drop
   }
}

--------------------------------------------------------------------------


