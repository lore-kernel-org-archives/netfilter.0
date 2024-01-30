Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE89762C8
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706645613; cv=pass; b=N8h1ikn6gGzv2U+GG3PqVIaJxA+UBzLk3cDqAh9+ZB8lK66MExoORwwZnN+tyomQfwNg+jKx9vrSF2KChlOEB4JyqCg9jU/wJSSAPstbFXYURpZ2V/7drAwt9uCNdc/YUStn5vOAGyC8ozKmVEy7ZfWsquSwJy88B1A6syUy0rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706645613; c=relaxed/simple;
	bh=C528mfPnvq15ZfQ1xcRsVnCzw6x7IpVXWfDXGHVpMvU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=RLclh6+57dWewCgb4bQsTBxatxFOsEwS0mgLpGUcO6nxYOuHomrwd78J+cyeQ0vUYQvlYaEFdp5i+BHjbvVyimGMCWzUkKKSFUgrLrMvncAgI/LaiBIEY2d5e8K0bjsZGQsgrsFlwLlys58mant6si3Z+R9Wg3TvSaehAlXrNy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=owDU6lGa; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="owDU6lGa"
Received: from mail.home (82-181-196-180.bb.dnainternet.fi [82.181.196.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: timo.lindfors)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TPbvq4KhRzyVW
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 22:13:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706645607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=sCOJCHLp2+vwqruEc/LF53WG+UEEdVK3IgAO3xbwUis=;
	b=owDU6lGalFwp1iMiRWCPvdKfumJjSt/ny7GiuEVBlWcNi1yCnyVZWYzS6pzb33NhHUf1+N
	mDsX+9+mGj7blxqUaU1veiVdbB4TNm1xRzUxx+FCxztgBSH4Ur7pPEPVziRtlUYirXs4CR
	GlsisqikuYFXSzwjtEY3gZYWKq6Qjvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706645607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=sCOJCHLp2+vwqruEc/LF53WG+UEEdVK3IgAO3xbwUis=;
	b=V0a9f72FW+y4Dn8wE87HCFpvHvtYd58sazEm7oXiqOtfdiO/Hu58AfAL6TdGg+DcX9QigO
	c1RlNmRyBSMyU6sRqfUYYC9Ur7vxkGTxCB4s5lVC1ozgnXC8kocG+pEJhJvEQQ+oL5RmlU
	L8M0O/CNuWVP/RVSldORpz/BejUrBKU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=timo.lindfors smtp.mailfrom=timo.lindfors@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706645607; a=rsa-sha256; cv=none;
	b=eEIgQGFYxbzvhMI37sHWM9OxGTOqF2M5Ac1o+KLqT9vqzdwGgzHEq3V/HEmjNB1+yxSxz4
	sasfEW/hgdiFbRYdxMxzKNsdZT4akGN+eSgqNf7SBa21BpCh8sbSYJWdUh+WRC8+NgusYn
	oc9BiTQfYL3n+VKYh59fV0usFzFZ/hw=
Received: from localhost ([127.0.0.1])
	by mail.home with esmtp (Exim 4.89)
	(envelope-from <timo.lindfors@iki.fi>)
	id 1rUuU2-0007BA-5H
	for netfilter@vger.kernel.org; Tue, 30 Jan 2024 22:13:26 +0200
Date: Tue, 30 Jan 2024 22:13:26 +0200 (EET)
From: Timo Lindfors <timo.lindfors@iki.fi>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Analyzing firewall rules programmatically
Message-ID: <alpine.DEB.2.20.2401302150460.27550@mail.home>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII

Hi,

I spent some time trying to figure out how to programmatically answer 
questions like "Does the ruleset R allow reaching service listening on port P from 
interface I?" or "Does the ruleset R1 allow something that ruleset R2 does 
not allow?".

I tried to find prior work on this area and was able to find "Verified 
iptables Firewall Analysis and Verification" [1] that uses 
the Isabelle proof assistant for iptables rules and "Automated Analysis 
and Debugging of Network Connectivity Policies" [2, 3] that uses Z3 for 
some simple Azure firewall ACL rules.

I could not find anything relevant for netfilter so I began experimenting 
a bit by writing a python function that tries to simulate nftables 
behavior given a ruleset and a packet. I used output of "nft --json list 
ruleset" to and soon noticed that it doesn't quite contain all the 
necessary information for this task.

For example, the default ufw configuration uses iptables to setup

Chain ufw-not-local (1 references)
  pkts bytes target     prot opt in     out     source               destination
   779 46756 RETURN     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ADDRTYPE match dst-type LOCAL

which shows up as

$ sudo nft -a list ruleset | grep "handle 247"
 		fib daddr type local counter packets 772 bytes 46336

in in the "normal" output. However, in the JSON output critical 
information (mainly "LOCAL") is entirely missing:

$ sudo nft -a --json list ruleset | jq . | grep -B5 -A19 '"handle": 247'
     {
       "rule": {
         "family": "ip",
         "table": "filter",
         "chain": "ufw-not-local",
         "handle": 247,
         "expr": [
           {
             "xt": {
               "type": "match",
               "name": "addrtype"
             }
           },
           {
             "counter": {
               "packets": 778,
               "bytes": 46696
             }
           },
           {
             "return": null
           }
         ]
       }
     },


I understand that ufw is using a compatibility interface. Nevertheless, 
I'm in need of a way to analyze firewall configurations of large number of 
real-world systems programmatically. Can you suggest how I should approach 
this? I can think of at least the following options:

1) Fix the JSON output.

2) Ignore the JSON output and try to parse the output of "nft list 
ruleset".

3) Use JSON output of most of the stuff but fill the gaps by also 
parsing "nft list ruleset".

4) Try to parse the raw netlink traffic seen in "nft --debug=netlink list 
ruleset".

4) Create separate tools for parsing iptables and netfilter rules and 
hope that no system mixes these two.


[1] https://link.springer.com/article/10.1007/s10817-017-9445-1
[2] https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/secguru.pdf
[3] https://github.com/Z3Prover/FirewallChecker


