Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E10198A39
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728578890; cv=none; b=koqWoZ45jBRzsbS6S9HHCZrERhJv040u8IK7iFeGdtWPindmU95ItMCBh09hb9P2UY+ElHRvYeEwbw/7187v1mQ7NvZXfoOy+MmPlzWGaLkKcJ3mM957A85d8NH88LeZD4P8tMVTLhX5gVjesGAstN+yMEvO6FkoEuQweTABvys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728578890; c=relaxed/simple;
	bh=0CzT1bbdQGiNrFJZUQYhnG76U15z0w2TTCjskGUDgYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bSZ/hvx5gIcoW0LQwgp5ZdpwL7+o21N5uPXF6E1vbbHD8iosI8GYkQ0JIWmRYL/CBbPjkq7trnTVotQkp4U5XRn95RcUm/7y3IwVfE9N8Eout0OrGmHIHKfYg/LeqlRq6LT+KiWAgKB5MSCFJAPCBIWBQRzK+fZM4I1UAUBOQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=kkARcwUF; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=igM/mRKV; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="kkARcwUF";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="igM/mRKV"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1728578877; bh=0CzT1bbdQGiNrFJZUQYhnG76U15z0w2TTCjskGUDgYk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kkARcwUF5oOp+pjeL4Gt2xihUNRNb/ievKf0GUEsy2OL4GJE+Tkzh9b5+t5mOZTej
	 zNbVpaVW8y3L1rrvNn3rcspJ4vQCBeV50bwBnmWdV/XnAoNUeTF8ElmAwGcke9izge
	 7+qxPZ+JLqyXN5TF0MFoCax9PgjYYp5/3Tlm0avo=
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 0572F6081A01
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 18:47:57 +0200 (CEST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1728578876; bh=0CzT1bbdQGiNrFJZUQYhnG76U15z0w2TTCjskGUDgYk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=igM/mRKV9yzuLirhBX+VUeTH2Oc+zAoA6GhemtV2NrlBRzCeCvWjOlavC2ZoCjupP
	 gbIqsfKTGGIrVRsDSy/gdjxqkdwYfbjEC3k3LVmloAHLNmpHK9+NZhHRQ1+K1pkPZW
	 bPSgWB5WGLgaIOvDjw733SdjxuA45IQ3O+36DSX4=
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id 2E71460818A4
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 18:47:49 +0200 (CEST)
Message-ID: <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net>
Date: Thu, 10 Oct 2024 18:47:48 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VPN nftables
To: netfilter@vger.kernel.org
References: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net>
Content-Language: fr-FR
From: Daniel <tech@tootai.net>
In-Reply-To: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

In the output set policy to accept or add new to ct state

Le 10/10/2024 à 18:18, Martin Brampton a écrit :
> On a Debian 12 VPS with openvpn installed, I am having difficulty
> finding an nftable ruleset that works. The following is the current
> ruleset, excluding the set definitions. I can connect to the VPN, but
> then cannot access any services.
>
> I'm aware there are overlapping rules, but that is because I'm
> attempting to use a standard ruleset across all servers, with additions
> according to the services needed. Any thoughts?
>
> table inet firewall {
>       chain input {
>           type filter hook input priority filter; policy accept;
>           ct state { established, related } accept
>           iifname "lo" accept
>           icmpv6 type { destination-unreachable, packet-too-big,
> time-exceeded, parameter-problem, echo-request, mld-listener-query,
> nd-router-solicit, nd-router-advert, nd-neighbor-solicit,
> nd-neighbor-advert } accept
>           ip protocol icmp icmp type echo-request ip saddr @servers_ipv4
> accept
>           ip protocol icmp icmp type echo-request ip saddr 127.0.0.1 accept
>           ip saddr @spamhaus_blacklist drop
>           ip saddr @blacklist_v4 drop
>           tcp dport 443 accept
>           iifname "tun0" accept
>           tcp dport 22 ip saddr @always_ipv4 accept
>           tcp dport 22 ip saddr @privileged_ipv4 accept
>           tcp dport 22 ip saddr @tunnelin_ipv4 accept
>           tcp dport 22 ip saddr @security_v4 accept
>           tcp dport 22 ip saddr 193.107.20.105 accept
>           tcp dport 22 ip6 saddr @always_ipv6 accept
>           tcp dport 22 ip6 saddr @privileged_ipv6 accept
>           tcp dport 22 ip6 saddr @tunnelin_ipv6 accept
>           tcp dport 22 ip6 saddr @security_v6 accept
>           tcp dport 22 log prefix "Denied SSH: " drop
>           udp dport 60000-61000 ip saddr @always_ipv4 accept
>           udp dport 60000-61000 ip saddr @privileged_ipv4 accept
>           udp dport 60000-61000 ip6 saddr @always_ipv6 accept
>           udp dport 60000-61000 ip6 saddr @privileged_ipv6 accept
>           udp dport 60000-61000 log prefix "Denied MOSH: " drop
>           ip saddr @munin_host_v4 tcp dport 4949 accept
>           ip6 saddr @munin_host_v6 tcp dport 4949 accept
>           tcp dport 3306 ip saddr 127.0.0.1 accept
>           log prefix "nftables input dropped: " flags all counter packets
> 86 bytes 9203 drop
>       }
>
>       chain forward {
>           type filter hook forward priority filter; policy drop;
>           ct state { established, related } accept
>           iifname "tun0" oifname "eth0" accept
>           iifname "eth0" oifname "tun0" ct state new accept
>           log prefix "nftables forward dropped: " flags all counter
> packets 0 bytes 0 drop
>       }
>
>       chain output {
>           type filter hook output priority filter; policy drop;
>           ct state { established, related } accept
>           ip protocol icmp icmp type echo-request ip daddr @servers_ipv4
> accept
>           ip protocol icmp icmp type echo-request ip daddr 127.0.0.1 accept
>           icmpv6 type { destination-unreachable, packet-too-big,
> time-exceeded, parameter-problem, echo-request, mld-listener-query,
> nd-router-solicit, nd-router-advert, nd-neighbor-solicit,
> nd-neighbor-advert } accept
>           ip protocol { tcp, udp } th dport 53 accept
>           tcp dport 123 accept
>           tcp dport { 80, 443 } accept
>           ip daddr @postmark_v4 tcp dport 587 accept
>           ip daddr @postmarklists_v4 tcp dport 587 accept
>           ip daddr @smtp2go_v4 tcp dport 587 accept
>           ip6 daddr @postmark_v6 tcp dport 587 accept
>           ip6 daddr @postmarklists_v6 tcp dport 587 accept
>           ip6 daddr @smtp2go_v6 tcp dport 587 accept
>           ip daddr @vault_v4 tcp dport 22 accept
>           ip6 daddr @vault_v6 tcp dport 22 accept
>           ip daddr 127.0.0.1 tcp dport 3306 accept
>           ip protocol tcp accept
>           ip6 nexthdr tcp accept
>           ip protocol udp accept
>           ip6 nexthdr udp accept
>       }
>
>       chain prerouting {
>           type nat hook prerouting priority dstnat; policy accept;
>       }
>
>       chain postrouting {
>           type nat hook postrouting priority srcnat; policy accept;
>       }
> }

-- 
Daniel Huhardeaux
+33.368460088@tootai.net	      sip:820@sip.tootai.net
      					    tootaiNET
