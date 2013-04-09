From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Zone based rules
Date: Tue, 09 Apr 2013 17:31:46 +0200
Message-ID: <1365521506.25705.28.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:date:content-type:x-mailer
         :mime-version:content-transfer-encoding;
        bh=PeDhzbh2kkeKXRiTtENSOvzSgpq/6xKZq1wAUASErLE=;
        b=kjMAZ4xTVJiGofEtahsfoLPhznfjV3FiBD6nf6huVInclUrgC1bc7Vc7p/cn+GzRAC
         wc7oNP7Yctv8mAay4dC/MTahY5LeFJNte+JF5oKIIAy+9/OGYOA3PNMVmrLzmUkD41FJ
         DQ1N531fONKrsmqjjvMGIDuKuqgs9YwCAItffL6tMovbHjR9InJYFy5tmOdKYtaCtb5r
         BmNd9+SNYr3s5ztBhVEAb669GhiauDSLmJq5bKx11prtNjOmCbbQ+b3pGE0A6/hquJmu
         L92v8aZ9dvkz68uJsrDdiJjPYZ5ne8Sawdtvvq2zfZhbqTu0HxAhu1ZxJHxSHYbFEkJB
         wo1Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I've got a Linux box sitting between different local networks. I'd like
to set up access policies between each network so I though about a zone
based firewall.

Each zone is responsible of its incoming and outgoing traffic. However
this role is played by the same box and if a packet is accepted by a
zone, it cannot be denied by another zone.

Let me give you an example:

 -----------
| Marketing |---------
 -----------          | eth0
                 ----------
                | Firewall |
                 ----------
 ---------            | eth1
| Servers |-----------
 ---------

Marketing wants to reach a server. However, marketing is very large on
its outgoing traffic (allows everything) on the server side however we
would reject any SSH connection coming from marketing.

Here are the iptables rules I would go for:

  # Zones creation.
  -N ZONE_MRKT
  -N MRKT_OUT

  -N ZONE_SRV
  -N SRV_IN

  # Traffic coming from the zones.
  -A FORWARD -i eth0 ZONE_MRKT
  -A FORWARD -i eth1 ZONE_SRV

  # Traffic to the zones.
  -A FORWARD -o eth0 ZONE_MRKT
  -A FORWARD -o eth1 ZONE_SRV


  # Let's look at marketing.
  -A ZONE_MKRT -i eth0 -s mar.ket.ing.net/mask -d any/0 -j MRKT_OUT
  # Marketing allows any outgoing traffic.
  -A MRKT_OUT -j ACCEPT

  # Servers
  -A ZONE_SRV -o eth1 -s any/0 -d ser.ver.s.net/mask -j SRV_IN
  -A SRV_IN -s mar.ket.ing.net/mask -p tcp --dport 22 -j DROP


In this example traffic leaving a zone is checked first so any traffic
from marketing is allowed while the servers zone denies traffic from
marketing.

In can change the rules order but this will not solve the problem.
Another solution would be to mark the packet and then check the mark at
the end to decide on whether to accept or reject. But how about
performances on a large set of rules as the firewall will have to go
through all of them before taking a decision?

How would you manage such a case?

--
Jimmy


