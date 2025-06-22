Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [148.6.0.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909FF79F5
	for <netfilter@vger.kernel.org>; Sun, 22 Jun 2025 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750598380; cv=none; b=L1Q4ABT8mBvGoy3+m7hR2N9EmrNWEQiVKzDIb49570ZDnysDF4jFQ2kkLGpuTBaISPcyvdb8n0Vu0lFLiC2XIefaQKL0qbQn+yb9Opl8+8qK0GH74yAJ8GRDxjbc5MNO0luVn7X+lEfEbv6+Mc1b9RUu5f7ggEmuQCvdCrje8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750598380; c=relaxed/simple;
	bh=MAZ8k2Nwz4FHJOawQVgpJPVXtyE+vhQPn4sCBt7XiG8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oNUMezpeBUDISd7kzV3e8moLNYWSYrCNlsnT0D0qW6vOGo9h7HaKYNbJF6AEjkgJEEwTlmrkAA7H6xUZzhSHMDhOMuiZjNMhEUglPq110ItSVYJoaGMm9rDxs9vmRC9rxWRjRK8/I217JbrHR94RYLmv3QcrsZ53Mt8pWrhulgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=148.6.0.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from localhost (localhost [127.0.0.1])
	by smtp0.kfki.hu (Postfix) with ESMTP id 4bQBdL3H6tz3sb7m;
	Sun, 22 Jun 2025 15:19:34 +0200 (CEST)
X-Virus-Scanned: Debian amavis at smtp0.kfki.hu
Received: from smtp0.kfki.hu ([127.0.0.1])
 by localhost (smtp0.kfki.hu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id POVWxbC8KNE2; Sun, 22 Jun 2025 15:19:32 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (unknown [148.6.192.8])
	(Authenticated sender: kadlecsik.jozsef@wigner.hu)
	by smtp0.kfki.hu (Postfix) with ESMTPSA id 4bQBdJ24JKz3sb7f;
	Sun, 22 Jun 2025 15:19:32 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
	id 28439141033; Sun, 22 Jun 2025 15:19:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mentat.rmki.kfki.hu (Postfix) with ESMTP id 257CE1405BC;
	Sun, 22 Jun 2025 15:19:32 +0200 (CEST)
Date: Sun, 22 Jun 2025 15:19:32 +0200 (CEST)
From: Jozsef Kadlecsik <kadlec@netfilter.org>
To: Michael Tokarev <mjt@tls.msk.ru>
cc: netfilter@vger.kernel.org
Subject: Re: order of netfilter hooks and check for martian source
In-Reply-To: <fb77199a-cca5-49ca-a953-8cfa13f0210a@tls.msk.ru>
Message-ID: <d2f48184-bcf8-4c9b-0139-e006fb81c452@netfilter.org>
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru> <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru> <b69fa9d9-6e56-0e08-adec-ba768a108938@netfilter.org> <9fc435dd-547f-4e50-8c2c-862a1ff62a2c@tls.msk.ru> <c1ecb68e-d4ce-9773-8649-ebac5171da06@netfilter.org>
 <51d3ebab-f543-4cbf-9923-8a9d965de826@tls.msk.ru> <26692fd4-71d4-4a77-b581-064837e2bb07@tls.msk.ru> <0d34447b-5e69-40e2-a0ca-f44b1e74d47d@tls.msk.ru> <b2c876c8-df09-ed44-05c1-a1bd57ea2c7c@netfilter.org> <fb77199a-cca5-49ca-a953-8cfa13f0210a@tls.msk.ru>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Jun 2025, Michael Tokarev wrote:

> On 22.06.2025 13:10, Jozsef Kadlecsik wrote:
> 
> > You have got a non-simple routing configuration and reverse path filtering
> > has got its own troubles with it, which is further complicated by natting.
> 
> Exactly the same issue happens when one tries to redirect packets to a 
> service (eg, a transparent proxy) running on 127.0.0.1, - it does not 
> involve any complex routing setup, and it also fails with current order 
> of things.

That is also a case when routing and NAT-ing don't play well.
 
> > So it's best to separate the issues:
> > 
> > reverse path filtering: By enablink loose mode for both of the default
> > route interfaces should be enough because that way the routing engine can
> > find an entry in the FIB and won't drop the packets as martian.
> 
> Why can't netfilter dnat hook up AFTER martians check in network stack? 
> Yes, this requires separation of checking for martians (rp-filter) and 
> actual routing, but these are separate anyway, since they check for 
> different things (rp-filter is applied to source address of the incoming 
> packet, while routing is applied to destination).  Wouldn't this solve 
> this issue once and for all?

I can repeat only myself: routing is a whole system, independent of the 
netfilter framework. We can't pick parts of it or jump into a specific 
stage.

> > Due to NAT, wrong interface picked by the routing engine: you have got
> > source-based routing which don't play well with NAT. Therefore I suggested
> > marking and using a mark-based routing because that solves it, both in the
> > case of iptables and nftables.
> 
> I don't see a way to do that.  Because autoatic marking reply packets is 
> - apparenty - done at the same stage as de-DNAT-ification of these 
> packets, ie, too late, when routing decision has already been done. No 
> matter what, I don't see how to change the order of netfilter hook vs 
> routing of the reply packets.

Where comes this "apparently"? There's no automatic packet marking,
at all. You tell the system at exactly when should it happen. In 
iptables-save language, mark value 1 for original direction, mark 2 for 
reply

*filter
...
# Original direction
# In nftables it's not needed but in iptables 
# we don't have multiple targets
:mark-accept - [0:0]
-A mark-accept -j CONNMARK --mark 1
-A mark-accept -j LOG/ULOG ...
-A mark-accept -j ACCEPT
# Original direction, first packet
... -m state --state NEW ... -j mark-accept

# Reply direction
*mangle
...
-A PREROUTING -m state --ctdir REPLY -m connmark --mark 1 -j MARK --mark 2

> How one would change the internal SNAT priority so it's applied after or
> before routing?

table ip nat {
  chain postrouting {
    # Override default priority and set it before routing
    type nat hook postrouting priority dstnat; policy accept;
  }
  chain prerouting {
    type nat hook prerouting priority dstnat; policy accept;
  }
}

See https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks

> Can't the same mechanism be used to modify priority of regular dnat vs
> rp-filter?

With the above SNAT happens before routing, including rp-filter.

Best regards,
Jozsef
-- 
E-mail : kadlec@netfilter.org, kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
Address: Wigner Research Centre for Physics
         H-1525 Budapest 114, POB. 49, Hungary
