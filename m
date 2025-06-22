Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E517736
	for <netfilter@vger.kernel.org>; Sun, 22 Jun 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.62.121.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750587848; cv=none; b=JiZkNlZZESuSlI1d1dnrQMXfEP/3PnArPNKClyWnLUSxuXvYV1as3vVdW3p0biI4Sc9KHdJG3NgsWw7lWrDoYRS9sJPVI7pjMh37Ur/yuN/1otolsLK10QhAzmFnQUBmRqDU/XKjuuJ9Mji8KHwtazbdcy6LuML/2b5a4hZEZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750587848; c=relaxed/simple;
	bh=D23t39UgNIK+Q3aX9Qoc1dfH6Ipp5H3dl7Xv/mFqsVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbGOf0z4aaNHUl+ENrNdNRXssBLxFpP7Cr+EWS+uK8jB7dpz5tSINtvghRzBuLVLvL0cHzYTp1DmVdPq8ujVKx2C9KCOaDBL7oS1LV/Lx1/NeFagjoT3kBQU5yb0zoQpBvICg0EYZt1tb44DSis4IqltxFHNym+8xlVixRgCiqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru; spf=pass smtp.mailfrom=tls.msk.ru; arc=none smtp.client-ip=86.62.121.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DDA6412F2FD;
	Sun, 22 Jun 2025 13:23:43 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
	by tsrv.corpit.ru (Postfix) with ESMTP id D6C5022B822;
	Sun, 22 Jun 2025 13:23:49 +0300 (MSK)
Message-ID: <fb77199a-cca5-49ca-a953-8cfa13f0210a@tls.msk.ru>
Date: Sun, 22 Jun 2025 13:23:49 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: order of netfilter hooks and check for martian source
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru>
 <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
 <b69fa9d9-6e56-0e08-adec-ba768a108938@netfilter.org>
 <9fc435dd-547f-4e50-8c2c-862a1ff62a2c@tls.msk.ru>
 <c1ecb68e-d4ce-9773-8649-ebac5171da06@netfilter.org>
 <51d3ebab-f543-4cbf-9923-8a9d965de826@tls.msk.ru>
 <26692fd4-71d4-4a77-b581-064837e2bb07@tls.msk.ru>
 <0d34447b-5e69-40e2-a0ca-f44b1e74d47d@tls.msk.ru>
 <b2c876c8-df09-ed44-05c1-a1bd57ea2c7c@netfilter.org>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <b2c876c8-df09-ed44-05c1-a1bd57ea2c7c@netfilter.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.06.2025 13:10, Jozsef Kadlecsik wrote:

> You have got a non-simple routing configuration and reverse path filtering
> has got its own troubles with it, which is further complicated by natting.

Exactly the same issue happens when one tries to redirect packets to a
service (eg, a transparent proxy) running on 127.0.0.1, - it does not
involve any complex routing setup, and it also fails with current order
of things.

> So it's best to separate the issues:
> 
> reverse path filtering: By enablink loose mode for both of the default
> route interfaces should be enough because that way the routing engine can
> find an entry in the FIB and won't drop the packets as martian.

Why can't netfilter dnat hook up AFTER martians check in network stack? 
Yes, this requires separation of checking for martians (rp-filter) and
actual routing, but these are separate anyway, since they check for
different things (rp-filter is applied to source address of the incoming
packet, while routing is applied to destination).  Wouldn't this solve
this issue once and for all?

> Due to NAT, wrong interface picked by the routing engine: you have got
> source-based routing which don't play well with NAT. Therefore I suggested
> marking and using a mark-based routing because that solves it, both in the
> case of iptables and nftables.

I don't see a way to do that.  Because autoatic marking reply packets is
- apparenty - done at the same stage as de-DNAT-ification of these
packets, ie, too late, when routing decision has already been done.
No matter what, I don't see how to change the order of netfilter hook
vs routing of the reply packets.

>      If you can pick another IP address which
> matches the good entry in the routing table, that's also good. There's
> third solution if you use nftables: the reverse direction for DNAT is an
> internal SNAT and in nftables you *can* set the SNAT priority to the same
> as DNAT, i.e. before routing. That way routing'll see the natted source
> address and source-based routing can pick the good outgoing interface.
> However, if you use SNAT as well otherwise, then that can also be affected
> in routing.

How one would change the internal SNAT priority so it's applied after or
before routing?

Can't the same mechanism be used to modify priority of regular dnat vs
rp-filter?

> [Personally, I always check ingress-egress in netfilter, regardless of the
> reverse path filtering.]

Yeah, I'm slowly going towards this direction as well, - but more
because of the current issues with netfilter I'm facing.

Thanks,

/mjt
