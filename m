From: Richard Horton <arimus.uk@googlemail.com>
Subject: dumb question on NAT and multicast
Date: Fri, 29 May 2009 14:21:40 +0100
Message-ID: <56378e320905290621x2890b876xfb15c79a31b11e85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=jEIAgTOMLLzYR2tPl+iaHv6LARXSDkPJcCCToA3b0s0=;
        b=RfenA/aEOr5u2b7etFw9mxLjwqOjAFP2C6P1DkFeMOyl5zRnMn88LCNxiFv0oAIS1b
         DNR6tFZlThDfsOULpdrqdpCM+lcIHPlXrQPbGDcyLHa5liuiWgXDp6HluLms2RLOVtMX
         ifQqB+iS3cD62Mg/LYBVtNy2qSjBq3alb//PU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Probably the wrong list... but here goes.

We have some linux PC's acting as routers. We have some dumber
terminals which do not support multicast, but for our application we
need to support multicast (groan).

Anyway, using iptables on the routers I can easily convert traffic
from the terminals to multicast:
  iptables -t nat -A PREROUTING -i eth0 -d 172.168.0.0/24 -j DNAT
--to-destination 224.0.1.1

(So any traffic to our backbone network from one of the terminals will
get NAT'd to the mcast address).

All the various routers are members of the multicast group and happily
receive the multicast traffic (using iptables logging I can see the
traffic in the various parts of netfilter).

The problem that we're facing is converting the Multicast address back
to a unicast address -
 iptables -t nat -A PREROUTING -d 224.0.1.1 -j DNAT --to-destination
192.168.0.2
doesn't work (192.168.0.2 is a terminal address, so on each router
this would be different).

Using various log directives as soon as the traffic hits the DNAT rule
above it drops out of sight... I've got log directives in the raw,
'normal' and nat tables - only the ones before it hits the dnat rule
are tripped, the rest aren't (and there is no filtering on the logs -
just the log prefix so I know where in the chains it came from).

Any ideas?


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
