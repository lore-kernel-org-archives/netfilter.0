Received: from correo.bersol.info (correo.bersol.info [82.194.72.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C647A53
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.194.72.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048771; cv=none; b=NhffKX6kR2VF2n0oudjZwl0jMCx43mofKQcuNI9EWAtHrd3YURDxcitbDKMmD6Us29NAgUpg+jpCuumuSgqUz0dWIS/7E3gHRvBYkYfcjnaXGq1y/Fgh/ZNAqIUbTqk/DQa/51i9Csr6huetrqH6q4rn0X7oyi3Qn2gDKoD+Sro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048771; c=relaxed/simple;
	bh=wH1AuebHT1x+0tzJ3vykCnduJoPyYNUjMK8izO56EAc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=AhAD655KSluj2Y5gbrlbQnQApehQqqdLCktMrZXEGgQkHlHF8isn+RUyb5RPaB4UnBR987YMag1rb7zOgmBp0rNMREv+kgKr3fKL1YuUhdXjwwUG6n35IHo0j5QmpzNu/Lu0D7GmChJXcaEnvdyPZay3ob9Dr3mhmtJgrBR9zVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bersol.info; spf=pass smtp.mailfrom=bersol.info; dkim=pass (1024-bit key) header.d=bersol.info header.i=@bersol.info header.b=mEDsd4D5; arc=none smtp.client-ip=82.194.72.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bersol.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bersol.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bersol.info header.i=@bersol.info header.b="mEDsd4D5"
Received: from [192.168.8.11] (58.red-88-14-51.dynamicip.rima-tde.net [88.14.51.58])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alberto@bersol.info)
	by correo.bersol.info (Postfix) with ESMTPSA id E6F77204C8
	for <netfilter@vger.kernel.org>; Tue,  2 Apr 2024 11:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
	t=1712048765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6Yi519qT2q8rr4BuGqCgcjkJ9hY0h5hrNx8JqU7MpY=;
	b=mEDsd4D5wWRKcq1c+pdx9FzuNjhfZxeshx6Wh5tIz+5TyFsbZDiJmLV4EHA6+8U+NPodCO
	i/gaOHriFHXowb07b9STuaePX5Rd8OR9nEzgSv31mli3GWY13ZAGitAtofRARVYK8C36i4
	cjRFF4ZYGmAr0oPnvOz6eRA5etujQaU=
Authentication-Results: correo.bersol.info;
	auth=pass smtp.auth=alberto@bersol.info smtp.mailfrom=alberto@bersol.info
Message-ID: <62b7f69a-918d-b9c1-135a-a2052465ced4@bersol.info>
Date: Tue, 2 Apr 2024 11:06:03 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Docker NFT rules conflict
Content-Language: en-US
References: <dfe78721-55ec-c254-db22-20494b4f16e0@bersol.info>
To: netfilter@vger.kernel.org
From: Alberto <alberto@bersol.info>
In-Reply-To: <dfe78721-55ec-c254-db22-20494b4f16e0@bersol.info>
X-Forwarded-Message-Id: <dfe78721-55ec-c254-db22-20494b4f16e0@bersol.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
I have a Debian Host with FW & GW tasks for my LAN, and some Docker 
containers inside.

I can see that Docker set some NFT rules for it's normal function. Rules 
as these...
--------------------------------------------------------
table ip nat {
          chain DOCKER {
                  iifname "br-fc93beb65b60" counter packets 0 bytes 0 return
                  iifname "docker0" counter packets 0 bytes 0 return
                  iifname != "br-fc93beb65b60" tcp dport 3306 counter 
packets 0 bytes 0 dnat to 172.22.0.33:3306
                  ...
          }
          chain POSTROUTING {
                  type nat hook postrouting priority srcnat; policy accept;
                  oifname != "br-fc93beb65b60" ip saddr 172.22.0.0/24 
counter packets 778 bytes 63705 masquerade
                  oifname != "docker0" ip saddr 172.17.0.0/16 counter 
packets 0 bytes 0 masquerade
                  ip saddr 172.22.0.33 ip daddr 172.22.0.33 tcp dport 
3306 counter packets 0 bytes 0 masquerade
                  ...
          }
          chain PREROUTING {
                  type nat hook prerouting priority dstnat; policy accept;
                  fib daddr type local counter packets 53594 bytes 
3220837 jump DOCKER
          }
          chain OUTPUT {
                  type nat hook output priority -100; policy accept;
                  ip daddr != 127.0.0.0/8 fib daddr type local counter 
packets 0 bytes 0 jump DOCKER
          }
}
table ip filter {
          chain DOCKER {
                  iifname != "br-fc93beb65b60" oifname "br-fc93beb65b60" 
ip daddr 172.22.0.33 tcp dport 3306 counter packets 0 bytes 0 accept
                  ...
          }
          chain DOCKER-ISOLATION-STAGE-1 {
                  iifname "br-fc93beb65b60" oifname != "br-fc93beb65b60" 
counter packets 284122 bytes 276578066 jump DOCKER-ISOLATION-STAGE-2
                  iifname "docker0" oifname != "docker0" counter packets 
0 bytes 0 jump DOCKER-ISOLATION-STAGE-2
                  counter packets 596380 bytes 316649936 return
          }
          chain DOCKER-ISOLATION-STAGE-2 {
                  oifname "br-fc93beb65b60" counter packets 0 bytes 0 drop
                  oifname "docker0" counter packets 0 bytes 0 drop
                  counter packets 284122 bytes 276578066 return
          }
          chain FORWARD {
                  type filter hook forward priority filter; policy drop;
                  counter packets 596379 bytes 316649852 jump DOCKER-USER
                  counter packets 596379 bytes 316649852 jump 
DOCKER-ISOLATION-STAGE-1
                  oifname "br-fc93beb65b60" ct state related,established 
counter packets 245582 bytes 35730696 accept
                  oifname "br-fc93beb65b60" counter packets 54022 bytes 
3255121 jump DOCKER
                  iifname "br-fc93beb65b60" oifname != "br-fc93beb65b60" 
counter packets 284122 bytes 276578066 accept
                  iifname "br-fc93beb65b60" oifname "br-fc93beb65b60" 
counter packets 385 bytes 25909 accept
                  oifname "docker0" ct state related,established counter 
packets 0 bytes 0 accept
                  oifname "docker0" counter packets 0 bytes 0 jump DOCKER
                  iifname "docker0" oifname != "docker0" counter packets 
0 bytes 0 accept
                  iifname "docker0" oifname "docker0" counter packets 0 
bytes 0 accept
          }
          chain DOCKER-USER {
                  counter packets 596380 bytes 316649936 return
          }
}
--------------------------------------------------------

I suppose these rules make NAT and Block functions for Docker 
containers. But I have my own rules for NAT and Block to my Devices in 
my LAN too, for example, with rules as these...
--------------------------------------------------------
table ip alb-nat {
          chain PREROUTING {
                  type nat hook prerouting priority 30; policy accept;
          }
          chain POSTROUTING {
                  type nat hook postrouting priority 30; policy accept;
                  oifname "eth0" ip saddr 192.168.9.0/24 masquerade
          }
}
table inet alb-fw {
          chain BASE_CHECKS {
                  ct state established,related,new accept
                  ct state invalid drop
          }
          chain INPUT {
                  type filter hook input priority filter + 10; policy drop;
                  jump BASE_CHECKS
                  iifname "lo" accept
                  iifname "br0" ip saddr 192.168.9.0/24 counter packets 
0 bytes 0 accept
                  log prefix "[NFTABLES] Denied " flags all
          }
          chain FORWARD {
                  type filter hook forward priority filter + 10; policy 
accept;
                  jump BASE_CHECKS
                  iifname "br0" oifname "eth0" meta l4proto { tcp, udp } 
ip saddr 192.168.9.0/24 accept
          }
          chain OUTPUT {
                  type filter hook output priority filter + 10; policy 
accept;
                  jump BASE_CHECKS
          }
}
--------------------------------------------------------
I can see that Systemd service have a Flush rule, but in STOP phase...

[Service]
Type=oneshot
...
ExecStop=/usr/sbin/nft flush ruleset

they also have the rules in different tables. I guess they shouldn't 
collide. However, when system boots, I can see all rules active, but my 
laptop (it's a LAN device which receive Dynamic DHCP and Internet output 
from Debian Host) cannot ping to outside:

$ ping www.google.com
PING www.google.com (172.217.168.164) 56(84) bytes of data.

If I restart NFTABLES service...

# systemctl restart nftables

Docker tables disappear, and I can ping to outside:
$ ping www.google.com
PING www.google.com (172.217.168.164) 56(84) bytes of data.
64 bytes from mad07s10-in-f4.1e100.net (172.217.168.164): icmp_seq=1 
ttl=115 time=10.4
64 bytes from mad07s10-in-f4.1e100.net (172.217.168.164): icmp_seq=2 
ttl=115 time=10.3
...
If I restart Docker service, Docker tables appears, and ping follow running.

I'm trying to set docker.service as dependency of nftables.service, for 
start docker before nft, of this way:

# cat /lib/systemd/system/nftables.service
[Unit]
Description=nftables
Documentation=man:nft(8) http://wiki.nftables.org
Wants=network-pre.target *** _*docker.service*_ ***
Before=network-pre.target shutdown.target
Conflicts=shutdown.target
DefaultDependencies=no

[Service]
Type=oneshot
RemainAfterExit=yes
StandardInput=null
ProtectSystem=full
ProtectHome=true
ExecStart=/usr/sbin/nft -f /etc/nftables.conf
ExecReload=/usr/sbin/nft -f /etc/nftables.conf
ExecStop=/usr/sbin/nft flush ruleset

but it's not working.
I don't know what's is the best solution for this.

Best Regards,
Alberto

