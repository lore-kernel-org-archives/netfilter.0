From: Michael Mattsson <michael.mattsson@gmail.com>
Subject: Different routes decided by source and/or dest. port
Date: Mon, 27 Jul 2009 11:16:20 +0200
Message-ID: <cffd2ab0907270216o625c4934p2fcda2cc843e81f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=h7xyikbIUbOMtAHxVuGgBRFOIRDaKSXH6Zqfy06VQd0=;
        b=eo3ete+1+SiTwS9lcTajRUc2TMOVZb22OuzCB0OnELbFEgy+51Zv5ifzJZQeiZNt8w
         /7zD+kLW4tVLDNo29VBTynuNsxy/xj6fwYDGEbsgh3xgLVfHEsQBC0BwtIBF0tYwi7S4
         hv+kffMg7h7m6UhjYAV/nVLUagcDFU6ZEelao=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!
I'm trying to determine if it's possible to have different routes
(interfaces) of traffic through an iptables NAT firewall.

The use case is that I've recently bought a VPN service to protect our
privacy due to the EU directive IPRED.
(http://en.wikipedia.org/wiki/IPRED) I have several hosts on my
network and I'm not interested in sending all traffic through the
tunnel, only traffic I'm interested in protecting. The only way I can
determine that is by looking at port ranges in and some cases source
host on my network.

I'm interested in getting pointers to what documentation that might be
relevant in accomplishing what I want to do. I'm quite novice in using
iptables as I use firewall builder to deploy my rules.

Many thanks,
Michael
