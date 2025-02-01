Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55DC20318
	for <netfilter@vger.kernel.org>; Sat,  1 Feb 2025 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738412936; cv=none; b=UDlJgPx3WuwJd25Jie/6tPDUsEq1zL+aYC2+ULGp3J5OBJrwNj3snF+p19rk1VokZXiyQMFN4oAVR2esyxzRqPec1R2EIYRAWGo8TysG4uacPTxPNKNmIwlsHTMgpaJ0+huU4iya+wz/hxL4sEo9XHxg4tpDGrp5rkO9A5ExeK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738412936; c=relaxed/simple;
	bh=PeAv1ohVq/9CJQ5CWS1Ia+gRzPC6s/Y2RhYB/ivIyz8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=kwMsYMZbEprqkVEFATk2wefwos1kNh/6sCsUeSkiptXZ4P9+hy+j7JK64ghXsX6gIwKBRQg072O9Lk3HVz+S/SvryS7+cdMbxcGCPKAD/NyeopaE80ew9TAW7ictJp/iSAvGxs6HYJ9BjEQo58+fZFDijzEEXib9w/78VR1zvWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=T4bkRsEy; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="T4bkRsEy"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738412930;
	bh=PeAv1ohVq/9CJQ5CWS1Ia+gRzPC6s/Y2RhYB/ivIyz8=;
	h=Date:Subject:From:To:References:In-Reply-To:From:Reply-To:Subject:
	 Date:To:Cc:Resent-Date:Resent-From:Resent-To:Resent-Cc:In-Reply-To:
	 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	 List-Post:List-Owner:List-Archive;
	b=T4bkRsEyABJhaadfRn8ebmo6FB6TBzq98I4S5TeSw+QHlNQXu4lVnesLlhaXyaw54
	 VpaKO+zREu/F4WIImqZ3qUU1gRAUNhY6AToL7ajeJIlEjqJckBT+PXzkhMqP6SdrM/
	 1mIhFPHJ9vblQJCM50oI+h1YHP4zWZY9gxjy62Wul0tFNXJAdJ/8PjzrNti0ie1cTU
	 kYCIUtyfos7HAgn6beeXGb+HvyGwQvaa4k7ckrFTIdH/fd/UMPsbxrcDh/CjRCuB7X
	 EYGegKUI8vxzkuqyHuV3f3sjzSjbtUBY4XyRmqtp0ANh9jiNvo2tf3XfuVcnTWd57b
	 bZDLGwaxB3JnQgSmCfVLzUTubsQUeYtYJCVZ9wcFTV0EvRr5jwp32s1VYiCDWummFo
	 j8uW1m2aJDmEilDBU7w0cmtRfaor+tstjPMLdYm/q/4W6mZBcEG4qWhjxNDgQOqHN+
	 NAdqMkUtQgudpsEMRLPGeEP8mtxrg97JalUBrCGiI02PmZ3J9cG3pUj6EZdTM0T0G4
	 nLwFGoE//DpeUSwyyoBuFKVbWl1o+kBSnjXIYYqRT5B9F46tW8dbKUmKLBtRc69zZK
	 nLnnIoRgoANfmrg+M8Y95DskUbrB41tl0ETmtPMnG5HpQPcNY/StT0/pJlr7mMgTV/
	 6GwEGtzhiwkox1d1hj4KSEuQ=
Received: from [192.168.20.100] (p5496968b.dip0.t-ipconnect.de [84.150.150.139])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 511CSomB2019429
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 1 Feb 2025 13:28:50 +0100
Message-ID: <ca99756d-0926-46b5-a375-d7f470723c6c@binarus.de>
Date: Sat, 1 Feb 2025 13:28:49 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: Netfilter not dropping packets as it should (addendum: netfilter
 and kernel versions)
From: Binarus <lists@binarus.de>
To: netfilter@vger.kernel.org
References: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
Content-Language: en-US, de-DE
In-Reply-To: <ee288424-68d5-44e4-95e4-91cf43751e54@binarus.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear all,

On 30.01.2025 20:35, Binarus wrote:
> Dear experts,
> 
> this is a cross posting, see https://unix.stackexchange.com/questions/789174/netfilter-not-dropping-packets-as-it-should. Since I didn't get an answer there for a couple of weeks, I am repeating the question here in the hope that the problem can easily be reproduced. For me this is a very important key point in understanding netfilter / nftables.
> 
> Please consider the ruleset that's at the end of this post. It doesn't make any sense, but it lets everybody reproduce the problem easily.
> 
> With this ruleset, all IPv4 packets that come in via enp0s3 are accepted in the ingress hook, but finally traverse a chain with a drop policy. Each of these chains does not contain any explicit rule besides the drop policy, and thus should behave as it would (only) contain an explicit drop verdict for all packets.
> 
> Hence, applications on that machine should not see any IPv4 packets that originate from other machines.
> 
> But they definitely do. For example, I have an SSH daemon running on that machine. The daemon listens on an IPv4 address only (in fact, I have disabled IPv6 on that machine completely by adding ipv6.disable=1 to the kernel command line). Even after I have loaded the ruleset below, I can connect to the SSH daemon via IPv4 from the outside without any issue.

In my first post, I forgot to mention the kernel and netfilter versions. They are 6.1.0 and 1.0.6, respectively. This happens on a vanilla debian bookworm installation with the latest security fixes at the time of writing.

> > Can somebody please explain why the rules below don't make the kernel drop all incoming IPv4 packets? Did I misunderstand the purpose of the drop policy?
> 
> 
> 
> 
> table netdev t_NETDEV_enp0s3 {
>    chain enp0s3-ingress-filter {
>      type filter hook ingress device "enp0s3" priority filter; policy drop;
>      ether type 0x0806 arp ptype 0x0800 accept
>      ether type 0x0800 accept
>      log prefix "foo: " drop
>    }
> }
> 
> table ip t_IP {
> 
>    chain prerouting-nat {
>      type nat hook prerouting priority dstnat; policy drop;
>      log prefix "ip4-prerouting-nat:" drop;
>    }
>    chain prerouting-filter {
>      type filter hook prerouting priority filter; policy drop;
>      log prefix "ip4-prerouting-filter:" drop;
>    }
> 
>    chain input-nat {
>      type nat hook input priority dstnat; policy drop;
>      log prefix "ip4-input-nat:" drop;
>    }
>    chain input-filter {
>      type filter hook input priority filter; policy drop;
>      log prefix "ip4-input-filter:" drop;
>    }
> 
>    chain forward-filter {
>      type filter hook forward priority filter; policy drop;
>      log prefix "ip4-forward-filter:" drop;
>    }
> 
>    chain output-nat {
>      type nat hook output priority srcnat; policy drop;
>      log prefix "ip4-output-nat:" drop;
>    }
>    chain output-filter {
>      type filter hook output priority filter; policy drop;
>      log prefix "ip4-output-filter:" drop;
>    }
>    chain output-route {
>      type route hook output priority mangle; policy drop;
>      log prefix "ip4-output-route:" drop;
>    }
> 
>    chain postrouting-nat {
>      type nat hook postrouting priority srcnat; policy drop;
>      log prefix "ip4-postrouting-nat:" drop;
>    }
>    chain postrouting-filter {
>      type filter hook postrouting priority filter; policy drop;
>      log prefix "ip4-postrouting-filter:" drop;
>    }
> }
> 

