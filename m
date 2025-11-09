Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497861F4174
	for <netfilter@vger.kernel.org>; Sun,  9 Nov 2025 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762712890; cv=none; b=nvAiMwIbNgNoS9Jfi4jrEXWCOoV3zE2my2Vid44doyzyAssG3Qecnxe/o6D+KfLtZq18BS4EbdwO/1ITXeiSzdNSIL5GvvOYPryRJ/FFQaRZ4lTByWmnuIEv8tziBrPZwbou1kfZX9nG3ilXisS/Yninm6gZ0AtH7P26BCv5LIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762712890; c=relaxed/simple;
	bh=YEj7gk7Ryevm1OKmVscMe4sM5FCMUIWIY/tVL2xPRKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJL1Jv8XlVJQUmYLjkiJ/K1YNODTBAGmHy0wOmFxp1Uab7ukrQUu3xVzzsRpCfoCAtPkyBA9DDD7aka2wqQ+KXrP+9hs0axb+vxB8/jydN4agGZuZmr2o3lymcQk4BgLyA/bon7q27hTJvne/4BRSf019NXfCmiPIwGwFD8U7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=Bc1QP9/r; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="Bc1QP9/r"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 8382660263;
	Sun,  9 Nov 2025 19:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1762712455;
	bh=yYrWC+YyrAU71wGGGYKMBWVuoX6vQz5LTvMTKECDzXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc1QP9/rDLC470wl4+yuj/BITykEXFiEZS46ZoNGyZO6pP/4/G11mt6MmtH1kB4EY
	 W48Ittv9fIof3btrmgCXUIEWBwqhirnpcHKKHUaCmkfHpqmxLb9gpsT4PsJ8y2aSnA
	 6M7iXNVUT6m/UP9ik0obE1qykFEHuJwWhrAPhkClqXZajgS2BgRz5EWyeUCMgUCwA6
	 Bps6UenHJZc0h9eUdSewqfGBVPxX9gM8dydvCTlwuDwV1EqUBuYqHcKvzjEusOkJnN
	 XXC9GLU6mm26fxyeP6fS1zmV4YSstTW8AXFGMxnUlOXlWw5u1nOhNZDKcay8TlxQls
	 RPy51ydO3g2kw==
Date: Sun, 9 Nov 2025 19:20:52 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Joel Low <joel@joelsplace.sg>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: conntrackd user-space helpers for multicast/broadcast
Message-ID: <aRDbhC3rnP9Z7CbU@calendula>
References: <TYSPR01MB67560AF00CC17680A5DF6175C8C0A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYSPR01MB67560AF00CC17680A5DF6175C8C0A@TYSPR01MB6756.apcprd01.prod.exchangelabs.com>

Hi,

Are you using the br_netfilter module in your setup?

On Sat, Nov 08, 2025 at 06:32:18AM +0000, Joel Low wrote:
> Hello there!
> 
> I've been trying to configure a conntrackd user-space helper for multicast/broadcast SNMP (using the slp helper, relying on the same principle) and SSDP (using the ssdp helper). I was briefly able to get it working last year, but after the changes made by 7d8dc1c [1] it seems like the associated multicast packets are not being reliably queued to conntrackd. I do occasionally see a packet or two making it through (both conntrackd and to its final destination) but I cannot reliably pin it down nor explain why. I am aware that I am forcing an unrouteable SNMP packet to be routed (they are sent to 255.255.255.255 -- but I have placed my compute devices in a separate subnet/vlan from my IOT devices, 1024/1026) -- but should this work?
> 
> What I have done to debug this so far while running a kernel containing [1] is to trace the route of a packet through this set of chains (I'm trying to keep it minimal; my apologies if this doesn't reproduce cleanly - I'm running this on OpenWrt).
> 
> ```
> table inet fw4 {
>     ct helper ssdp {
>         type "ssdp" protocol udp
>         l3proto inet
>     }
> 
>     ct helper broadcast {
>         type "slp" protocol udp
>         l3proto ip
>     }
> 
>     chain helper_svc {
>         type filter hook prerouting priority filter; policy accept;
>         ip daddr 239.255.255.249 udp dport 161 counter ct helper set "broadcast"
>         ip daddr 239.255.255.250 udp dport 1900 counter ct helper set "ssdp"
>     }
> 
>     chain raw_prerouting {
>         type filter hook prerouting priority raw; policy accept;
>         ip daddr 255.255.255.255 udp dport != { 67, 68, 547 } iifname "br-lan.1024" ip ttl set 2 ip daddr set 239.255.255.249 counter meta nftrace set 1
>         ip daddr 239.255.255.250 iifname "br-lan.1024" ip ttl set 2 counter meta nftrace set 1
>     }
> 
>     chain mangle_postrouting {
>         type filter hook postrouting priority mangle; policy accept;
>         ip daddr 239.255.255.249 oifname "br-lan.1027" ip daddr set 255.255.255.255 counter
>         ip daddr 239.255.255.249 oifname "br-lan.1026" ip daddr set 192.168.20.255 counter
>     }
> }
> ```
> 
> (I've tried with both overriding the ether daddr and not, it does not seem to make a difference.)
> 
> With that set of chains, I've run `nft monitor` while observing the output of conntrackd that I've hacked to print messages when it receives a packet on an nfqueue.
> 
> This is a packet that doesn't get sent to conntrackd:
> 
> ```
> trace id f347290f inet fw4 raw_prerouting packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 raw_prerouting rule ip daddr 239.255.255.250 iifname "br-lan.1024" ip ttl set 2 counter packets 703 bytes 250905 meta nftrace set 1 (verdict continue)
> trace id f347290f inet fw4 raw_prerouting verdict continue 
> trace id f347290f inet fw4 raw_prerouting policy accept 
> trace id f347290f inet fw4 mangle_prerouting packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 mangle_prerouting verdict continue 
> trace id f347290f inet fw4 mangle_prerouting policy accept 
> trace id f347290f inet fw4 dstnat packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 dstnat verdict continue 
> trace id f347290f inet fw4 dstnat policy accept 
> trace id f347290f inet fw4 prerouting packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 prerouting rule iifname "br-lan.1024" jump helper_lan comment "!fw4: Handle lan IPv4/IPv6 helper assignment" (verdict jump helper_lan)
> trace id f347290f inet fw4 helper_lan verdict continue 
> trace id f347290f inet fw4 prerouting verdict continue 
> trace id f347290f inet fw4 prerouting policy accept 
> trace id f347290f inet fw4 helper_svc packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 helper_svc rule ip daddr 239.255.255.250 udp dport 1900 counter packets 837 bytes 337357 ct helper set "ssdp" comment "!svc: DLNA" (verdict continue)
> trace id f347290f inet fw4 helper_svc verdict continue 
> trace id f347290f inet fw4 helper_svc policy accept 
> trace id 557a86d6 inet fw4 mangle_forward packet: iif "br-lan.1024" oif "br-lan.1026" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id 557a86d6 inet fw4 mangle_forward verdict continue 
> trace id 557a86d6 inet fw4 mangle_forward policy accept 
> trace id 557a86d6 inet fw4 forward packet: iif "br-lan.1024" oif "br-lan.1026" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id 557a86d6 inet fw4 forward rule iifname "br-lan.1024" jump forward_lan comment "!fw4: Handle lan IPv4/IPv6 forward traffic" (verdict jump forward_lan)
> trace id 557a86d6 inet fw4 forward_lan rule counter packets 891 bytes 279481 jump accept_to_lan comment "!fw4: Intra-LAN interface traffic" (verdict jump accept_to_lan)
> trace id 557a86d6 inet fw4 accept_to_lan verdict continue 
> trace id 557a86d6 inet fw4 forward_lan rule ip daddr 239.255.255.250 udp dport 1900 counter packets 703 bytes 250905 jump accept_to_iot (verdict jump accept_to_iot)
> trace id 557a86d6 inet fw4 accept_to_iot rule oifname "br-lan.1026" counter packets 1630 bytes 376326 accept comment "!fw4: accept iot IPv4/IPv6 traffic" (verdict accept)
> trace id a2926568 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id a2926568 inet fw4 mangle_postrouting verdict continue 
> trace id a2926568 inet fw4 mangle_postrouting policy accept 
> trace id a2926568 inet fw4 srcnat packet: oif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id a2926568 inet fw4 srcnat rule oifname "br-lan.1026" jump srcnat_iot comment "!fw4: Handle iot IPv4/IPv6 srcnat traffic" (verdict jump srcnat_iot)
> trace id a2926568 inet fw4 srcnat_iot verdict continue 
> trace id a2926568 inet fw4 srcnat verdict continue 
> trace id a2926568 inet fw4 srcnat policy accept 
> trace id 557a86d6 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id 557a86d6 inet fw4 mangle_postrouting verdict continue 
> trace id 557a86d6 inet fw4 mangle_postrouting policy accept 
> trace id f347290f inet fw4 mangle_input packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 mangle_input verdict continue 
> trace id f347290f inet fw4 mangle_input policy accept 
> trace id f347290f inet fw4 input packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34662 ip protocol udp ip length 387 udp sport 1900 udp dport 1900 udp length 367 udp checksum 13152 
> trace id f347290f inet fw4 input rule iifname "br-lan.1024" jump input_lan comment "!fw4: Handle lan IPv4/IPv6 input traffic" (verdict jump input_lan)
> trace id f347290f inet fw4 input_lan rule jump reject_from_lan (verdict jump reject_from_lan)
> trace id f347290f inet fw4 reject_from_lan rule iifname "br-lan.1024" counter packets 898 bytes 280311 jump handle_reject comment "!fw4: reject lan IPv4/IPv6 traffic" (verdict jump handle_reject)
> trace id f347290f inet fw4 handle_reject rule reject comment "!fw4: Reject any other traffic" (verdict drop)
> ```
> 
> This is a packet that does get picked up by conntrackd and gets routed:
> 
> ```
> trace id 030d8487 inet fw4 raw_prerouting packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id 030d8487 inet fw4 raw_prerouting rule ip daddr 239.255.255.250 iifname "br-lan.1024" ip ttl set 2 counter packets 403 bytes 144885 meta nftrace set 1 (verdict continue)
> trace id 030d8487 inet fw4 raw_prerouting verdict continue 
> trace id 030d8487 inet fw4 raw_prerouting policy accept 
> trace id 030d8487 inet fw4 mangle_prerouting packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id 030d8487 inet fw4 mangle_prerouting verdict continue 
> trace id 030d8487 inet fw4 mangle_prerouting policy accept 
> trace id 030d8487 inet fw4 prerouting packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id 030d8487 inet fw4 prerouting rule iifname "br-lan.1024" jump helper_lan comment "!fw4: Handle lan IPv4/IPv6 helper assignment" (verdict jump helper_lan)
> trace id 030d8487 inet fw4 helper_lan verdict continue 
> trace id 030d8487 inet fw4 prerouting verdict continue 
> trace id 030d8487 inet fw4 prerouting policy accept 
> trace id 030d8487 inet fw4 helper_svc packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id 030d8487 inet fw4 helper_svc rule ip daddr 239.255.255.250 udp dport 1900 counter packets 471 bytes 190003 ct helper set "ssdp" comment "!svc: DLNA" (verdict continue)
> trace id 030d8487 inet fw4 helper_svc verdict continue 
> trace id 030d8487 inet fw4 helper_svc policy accept 
> trace id af150fc3 inet fw4 mangle_forward packet: iif "br-lan.1024" oif "br-lan.1026" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id af150fc3 inet fw4 mangle_forward verdict continue 
> trace id af150fc3 inet fw4 mangle_forward policy accept 
> trace id af150fc3 inet fw4 forward packet: iif "br-lan.1024" oif "br-lan.1026" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id af150fc3 inet fw4 forward rule iifname "br-lan.1024" jump forward_lan comment "!fw4: Handle lan IPv4/IPv6 forward traffic" (verdict jump forward_lan)
> trace id af150fc3 inet fw4 forward_lan rule counter packets 513 bytes 161605 jump accept_to_lan comment "!fw4: Intra-LAN interface traffic" (verdict jump accept_to_lan)
> trace id af150fc3 inet fw4 accept_to_lan verdict continue 
> trace id af150fc3 inet fw4 forward_lan rule ip daddr 239.255.255.250 udp dport 1900 counter packets 403 bytes 144885 jump accept_to_iot (verdict jump accept_to_iot)
> trace id af150fc3 inet fw4 accept_to_iot rule oifname "br-lan.1026" counter packets 909 bytes 208517 accept comment "!fw4: accept iot IPv4/IPv6 traffic" (verdict accept)
> trace id dfde2134 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id dfde2134 inet fw4 mangle_postrouting verdict continue 
> trace id dfde2134 inet fw4 mangle_postrouting policy accept 
> trace id af150fc3 inet fw4 mangle_postrouting packet: oif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id af150fc3 inet fw4 mangle_postrouting verdict continue 
> trace id af150fc3 inet fw4 mangle_postrouting policy accept 
> trace id 030d8487 inet fw4 mangle_input packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id 030d8487 inet fw4 mangle_input verdict continue 
> trace id 030d8487 inet fw4 mangle_input policy accept 
> trace id 030d8487 inet fw4 input packet: iif "br-lan.1024" ether saddr aa:bb:cc:dd:ee:ff ether daddr bb:cc:dd:ee:ff:00 ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 2 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id 030d8487 inet fw4 input rule iifname "br-lan.1024" jump input_lan comment "!fw4: Handle lan IPv4/IPv6 input traffic" (verdict jump input_lan)
> trace id 030d8487 inet fw4 input_lan rule jump reject_from_lan (verdict jump reject_from_lan)
> trace id 030d8487 inet fw4 reject_from_lan rule iifname "br-lan.1024" counter packets 515 bytes 162031 jump handle_reject comment "!fw4: reject lan IPv4/IPv6 traffic" (verdict jump handle_reject)
> trace id 030d8487 inet fw4 handle_reject rule reject comment "!fw4: Reject any other traffic" (verdict drop)
> trace id c46a944a inet fw4 raw_prerouting packet: iif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id c46a944a inet fw4 raw_prerouting verdict continue 
> trace id c46a944a inet fw4 raw_prerouting policy accept 
> trace id c46a944a inet fw4 mangle_prerouting packet: iif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id c46a944a inet fw4 mangle_prerouting verdict continue 
> trace id c46a944a inet fw4 mangle_prerouting policy accept 
> trace id c46a944a inet fw4 prerouting packet: iif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id c46a944a inet fw4 prerouting rule iifname "br-lan.1026" jump helper_iot comment "!fw4: Handle iot IPv4/IPv6 helper assignment" (verdict jump helper_iot)
> trace id c46a944a inet fw4 helper_iot verdict continue 
> trace id c46a944a inet fw4 prerouting verdict continue 
> trace id c46a944a inet fw4 prerouting policy accept 
> trace id c46a944a inet fw4 helper_svc packet: iif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id c46a944a inet fw4 helper_svc rule ip daddr 239.255.255.250 udp dport 1900 counter packets 471 bytes 190003 ct helper set "ssdp" comment "!svc: DLNA" (verdict continue)
> trace id c46a944a inet fw4 helper_svc verdict continue 
> trace id c46a944a inet fw4 helper_svc policy accept 
> trace id c46a944a inet fw4 mangle_input packet: iif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id c46a944a inet fw4 mangle_input verdict continue 
> trace id c46a944a inet fw4 mangle_input policy accept 
> trace id c46a944a inet fw4 input packet: iif "br-lan.1026" ip saddr 192.168.xx.zzz ip daddr 239.255.255.250 ip dscp cs0 ip ecn not-ect ip ttl 1 ip id 34371 ip protocol udp ip length 186 udp sport 52100 udp dport 1900 udp length 166 udp checksum 16095 
> trace id c46a944a inet fw4 input rule iifname "br-lan.1026" jump input_iot comment "!fw4: Handle iot IPv4/IPv6 input traffic" (verdict jump input_iot)
> trace id c46a944a inet fw4 input_iot rule jump reject_from_iot (verdict jump reject_from_iot)
> trace id c46a944a inet fw4 reject_from_iot rule iifname "br-lan.1026" counter packets 68 bytes 45253 jump handle_reject comment "!fw4: reject iot IPv4/IPv6 traffic" (verdict jump handle_reject)
> trace id c46a944a inet fw4 handle_reject rule reject comment "!fw4: Reject any other traffic" (verdict drop)
> ```
> 
> Running a kernel without [1] restores the proper queueing to conntrackd and routing.
> 
> Am I doing something wrong here? My understanding of [1] is that it only will process the last reference to a multicast packet. Does that mean that the only way to implement such a helper is by implementing a kernel helper? Is there an alternative approach I should be considering? I saw that the initial author who implemented the slp helper in kernel mode was asked to reimplement it as a user-space helper [2] so I'm not sure what the current recommendation is.
> 
> Regards,
> Joel
> 
> [1]: netfilter: nf_queue: drop packets with cloned unconfirmed conntracks 
> [2]: connection tracking helper for SLP https://lkml.org/lkml/2013/5/7/830 
> 
