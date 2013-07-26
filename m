From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: dropping UNTRACKED packets, breaks IPv6 - why?
Date: Fri, 26 Jul 2013 03:59:22 +0200
Message-ID: <1374803962.5489.12.camel@fermat.scientia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	physik.uni-muenchen.de; h=content-transfer-encoding:x-mailer
	:mime-version:message-id:date:date:organization:content-type
	:content-type:from:from:subject:subject:received:received; s=
	sel-2011; t=1374803964; bh=yHxBEz7OUTiHGk1YN+N5FosXPjD1QuE7iMl+u
	kjVLLs=; b=qjou5Xx3Axa9OckKshUHa6kvgDdxQrSLWniNskvM1JmBlm0ALE+aV
	Q0Nu9BnIqmb3WoWcWcJtRxI4ymkyM32ZkpMD7IIW8CxCORlVbt6ZGO/XoAOnQ4n8
	2DASTF2oE0A4JkvDLf52Vbyt70EE+SyOSjv4ynG6MS0q/66OWW1L5s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi.

I usually have some default rules in place on all nodes which look about
like this:
---------------------
-A INPUT        --in-interface lo       -j ACCEPT
-A OUTPUT       --out-interface lo      -j ACCEPT

-A INPUT       -m state  --state UNTRACKED     -j DROP
-A FORWARD      -m state  --state UNTRACKED     -j DROP
-A OUTPUT      -m state  --state UNTRACKED     -j DROP

-A INPUT        -m state  --state INVALID       -j DROP
-A FORWARD      -m state  --state INVALID       -j DROP
-A OUTPUT       -m state  --state INVALID       -j DROP

#handle IPsec only sources/destinations
#snip/snap

#allow incoming packets for all established and all related connections
-A INPUT        -m state  --state ESTABLISHED,RELATED   -j ACCEPT

#allow incoming ICMP packets
-A INPUT        --protocol icmpv6       -j ACCEPT
---------------------
And the same for IPv4.

The idea with dropping the UNTRACKED/INVALID was that such packages are
probably not good fellows and should stay out...

Okay... now with IPv4 everything works as expected...


But with v6 nothing works at all and I get Destination unreachables
(even on pings)... I can't even reach the gateway.

When I disable dropping the untracked packets... it starts working,...
even when afterwards I enable it again.
Seems that there is some connection between the host an the gateway
shown then by conntrack.


Now... question is why?


Cheers,
Chris.

