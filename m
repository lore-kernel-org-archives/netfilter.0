Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCBB69E19
	for <netfilter@vger.kernel.org>; Mon, 26 Feb 2024 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708941022; cv=none; b=ngLSm3lHi7CRszhSrGS1IXDJuVu4CqAvjl69Eha57U1PDY92cIEy9Tvhbjear1ZnFg4vn5NTEa/xTd9KfMASkRWM7aMoqzXXZLs+lBh2dvJCQuGo5WIKcWrwQjjflo9rBNf76LLOl0IJ2RPacJ1OUbUGIVg0fo9j5gxReZmk8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708941022; c=relaxed/simple;
	bh=rNSNVI3tzTqfpPmOTM6ruXpXcNaeUXxc38pllYk63NE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=lPNEdtdVSd4wvIjBo1pDJpFFZHRzzLOgtlFo753Cd/Btrkr6CL2Drck3vwEzwAHk74xVu1qrHGxdmgrhg34qFNUt54dlufl081BSlAVrJxkdNCrFLVAQ619DtJRdAEgKtQYmHi3FXQeWw8E8jsLaHzpKkYgNMR4Zx6dftr27FHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpR8c41S; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpR8c41S"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e48153c13aso1312701a34.3
        for <netfilter@vger.kernel.org>; Mon, 26 Feb 2024 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708941020; x=1709545820; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abfz/0fx8CUHHBhrf6gwzeBOxw0AgVD2IbkeUbWzeHs=;
        b=DpR8c41SQ67c48Bf0mRCoFf2KJu2VLa2gALUbc4nHMZ+bW7lm034u77N3XoNBXPgPz
         0v5beiGMNZVKB9KYdAgXjho/TVJzMTC+fSN5iFwphPSXgLciQqPeqII4Bmxy2TIkX2TO
         08llkGbh3XDbci+BONBjfxHSrGuY+oyT1M3wuj8LSqXUVUXQuZZI8Lp3PXQiblPce7+B
         8DkGo7k2QVetQhAQm+rvK61cCY6VWIuco0NyvYjXg0U7uFzUSi0WvohmJ2LRMQZqfKd3
         sJ3alLCec9pvPCDPF7TNy/NFcGJ7QKo8I1KMN9fBrBzeFX7FBMT0D/alSF2UY/20cqij
         Af8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708941020; x=1709545820;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abfz/0fx8CUHHBhrf6gwzeBOxw0AgVD2IbkeUbWzeHs=;
        b=QqUReeUNBtX0S0FqYjAikIw7J23ccYRdN+CkhrOxLDqFYkWOrnEIXarhMY390c8E0h
         9s5ik+hdTHeRID05pGrqrtl1SzvM/vr7VeHKjE+zwWHMBzU8mT7OSGqPVThmjMEkAh00
         quTPYd5cThJIhPmmKw48+OBYjK0Pa4LSPqbX2mP8I2pT2jH3Ze3MPgfqX1eoyU0Eoh2G
         TQblsoTL85ORuWy1z/igbQW9Jr2vJNp/WAZPfBZZyrXornH2wTjThR/dqSfCwuBrr6+8
         UH+J3vgpLJNLVsyzLM+0iR3dDsVBuYubeZ852kRNFfPMMpx/QPxFh1r044PBn1QWRjyg
         +ahA==
X-Gm-Message-State: AOJu0YxjSfYD90UMWVr6miUUQVFB6s8jAHfjcVOCv7vFy2MNIswI/cDs
	L4Eb/gromCsg8C5jrZytpyy00/LNPWAyFZ/GIal34uwLi7WMrMuUnAsqTKTB
X-Google-Smtp-Source: AGHT+IHW3r6u9s+IP8Tiq5t9VSwNhwZUcd0jAWKUK4YvKv+3Zrm8QIXbO73lkTAW9SPUScAeknLZ8A==
X-Received: by 2002:a05:6830:1495:b0:6e4:64e6:c1a6 with SMTP id s21-20020a056830149500b006e464e6c1a6mr6910192otq.22.1708941019792;
        Mon, 26 Feb 2024 01:50:19 -0800 (PST)
Received: from [198.18.0.1] (198.55.124.115.adsl.inet-telecom.org. [198.55.124.115])
        by smtp.gmail.com with ESMTPSA id t23-20020a9d7f97000000b006e494eeaaa2sm804739otp.17.2024.02.26.01.50.18
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:50:19 -0800 (PST)
Message-ID: <845cf958-5334-44e1-b3da-cd8972b2835b@gmail.com>
Date: Mon, 26 Feb 2024 13:20:16 +0330
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: Morteza Behboodian <xeptore@gmail.com>
Subject: Question: How to pass Docker container traffic through iptables
 tproxy?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have a TPROXY-supported proxy server running on my machine (listening 
on 127.0.0.1:8080). I configured iptables to redirect traffic to this 
proxy server using `TPROXY` target as below:

```sh
ip route add local default dev lo table 100
ip rule add fwmark 1 table 100

iptables -t mangle -N PROXY
# Ignore private IPs
iptables -t mangle -A PROXY -d 10.0.0.0/8 -j RETURN
iptables -t mangle -A PROXY -d 100.64.0.0/10 -j RETURN
iptables -t mangle -A PROXY -d 127.0.0.0/8 -j RETURN
iptables -t mangle -A PROXY -d 169.254.0.0/16 -j RETURN
iptables -t mangle -A PROXY -d 172.16.0.0/12 -j RETURN
iptables -t mangle -A PROXY -d 192.0.0.0/24 -j RETURN
iptables -t mangle -A PROXY -d 224.0.0.0/4 -j RETURN
iptables -t mangle -A PROXY -d 240.0.0.0/4 -j RETURN
iptables -t mangle -A PROXY -d 255.255.255.255/32 -j RETURN
iptables -t mangle -A PROXY -d 192.168.0.0/16 -j RETURN

iptables -t mangle -A PROXY -p tcp -j TPROXY --on-port 8080 --on-ip 
127.0.0.1 --tproxy-mark 1
iptables -t mangle -A PROXY -p udp -j TPROXY --on-port 8080 --on-ip 
127.0.0.1 --tproxy-mark 1
iptables -t mangle -A PREROUTING -j PROXY


iptables -t mangle -N PROXY_SELF
# Ignore private IPs
iptables -t mangle -A PROXY_SELF -d 10.0.0.0/8 -j RETURN
iptables -t mangle -A PROXY_SELF -d 100.64.0.0/10 -j RETURN
iptables -t mangle -A PROXY_SELF -d 127.0.0.0/8 -j RETURN
iptables -t mangle -A PROXY_SELF -d 169.254.0.0/16 -j RETURN
iptables -t mangle -A PROXY_SELF -d 172.16.0.0/12 -j RETURN
iptables -t mangle -A PROXY_SELF -d 192.0.0.0/24 -j RETURN
iptables -t mangle -A PROXY_SELF -d 224.0.0.0/4 -j RETURN
iptables -t mangle -A PROXY_SELF -d 240.0.0.0/4 -j RETURN
iptables -t mangle -A PROXY_SELF -d 255.255.255.255/32 -j RETURN
iptables -t mangle -A PROXY_SELF -d 192.168.0.0/16 -j RETURN

iptables -t mangle -A PROXY_SELF -m mark --mark 2 -j RETURN
iptables -t mangle -A PROXY_SELF -p tcp -j MARK --set-mark 1
iptables -t mangle -A PROXY_SELF -p udp -j MARK --set-mark 1
iptables -t mangle -A OUTPUT -j PROXY_SELF
```

It works as expected for locally-generated network. However, there's a 
problem with Docker container networks. As I didn't change any of its 
default network/iptables configuration, it uses internet-connected 
network device (`eth0`) as gateway to pass outgoing networks from. When 
I enable iptables tproxy to redirect traffic to the proxy server, all 
traffic originated from my machine is properly passed through the proxy 
server, but the traffic originated from inside Docker container does not 
reach the proxy server, and fails to access the internet. How can I 
resolve it?


I also used `LOG` iptables target for every chain in every table to see 
how packets traverse through, and to debug (or guess) what the issue is. 
 From what I understood, for locally-generated packets as they pass 
through `mangle` table `OUTPUT` chain, they are marked with fwmark 1, 
then routed to `lo` device (instead of the default internet-connected 
device `eth0`) because of the `ip route`, and `ip rule` commands, and 
they will then received on `lo` device, which get redirected to the 
proxy server by `tproxy` target defined in `mangle` table's `PREROUTING` 
chain, and the rest of the proxying process. On the other hand, for 
packets sent from Docker container, they are first received on `docker0` 
(default Docker bridge network device), and once they are redirected by 
`tproxy` target, the packet _hangs_ in `nat` table `INPUT` chain, which 
AFAIK is just before they are handed over to the proxy server process. 
As I don't see any log message from proxy server, I guess these packets 
are being dropped (?) somehow. I tested the followings as well:

- Running the proxy server bounded to `0.0.0.0`
- Enabling `net.ipv4.ip_forward` kernel option
- Letting `docker0` packets to pass through the `mangle` table 
`PREROUTING` chain first by just marking them with fwmark 1 (without 
jumping to `tproxy`), and let `ip route` to re-route them back to `lo` 
(similar to what happens for locally-generated packets), and then apply 
tproxy redirection for the associated packet that is received later on 
on the `lo` device. This works as expected for the _forwared_ packet, 
but the corresponding packet that is received on `lo` device hangs right 
after the `mangle` table's `PREROUTING` chain and does no proceed.

But with no results...

Any help is appreciated.

As I'm new to iptables advanced networking on Linux (started completely 
since 3 days ago), please also let me know if there is any more 
information that needs to be provided.

Cheers
