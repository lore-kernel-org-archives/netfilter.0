From: Prashant Batra <prashant0100@gmail.com>
Subject: IPv6 routes too much
Date: Fri, 8 Feb 2013 16:18:31 +0530
Message-ID: <CAG+XuE7FaAwwSq98JTSr3SOxSP2rN1hxFYQ7O=0L_3E=9kVreg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=QEgXzK9sTedjFDdCVOnsCwvoLB//jEk85mRGYnTv5OY=;
        b=XsnT2IwqlzHUXtWkZ/HP3xSRLXXV1iNjWZHUuysrHujm3jhBg6vuWoXk7Q0xGOQF3B
         T+32NEnzVqq7iA+tYCZjbmYbQjzB3mp4Jb614f/o+eNgycTRkaMjwdzXwS7mrFq0Auhf
         507rF5JgTdfvaRFDEinVAKqn2CcqFHme5+uKxxaJoTu+pwjqp8tU9qeB9iy1b/Y6YWB2
         Yqcogn9TiL+OMGeUnZHEcCFTCxdb/lEwcUtQrUTb7BVXjDOWSVay/dhTM1O3ZW0n6zFr
         VSlTlEpIs3xlFKf89jjefamXk4yjzD/E6UcBts9c1x48TjS4ppjvTYyd/rjvVS5fcu4P
         5iBA==
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie@vger.kernel.org, netfilter@vger.kernel.org

Hi,

I have a case wherein I have a route to a network connected to my
linux machine via an interface, which I added like-

route add -inet6 9aa::/16 gw 2001:db8:0:242::2 dev eth0

Now, when I send packets to ipv6 addresses in this network, from my
linux server, I see kernel adding routes for each of these addresses.
Is this behaviour correct. How can it be avoided?

My problem starts when I have millions of addresses in this network
that I am trying to reach.

A look of my routing table shows-
9aa:0:0:250::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:251::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:252::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:253::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:254::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:255::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:256::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:257::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:258::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:259::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:25a::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:25b::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0
9aa:0:0:25c::/128                           2001:db8:0:242::2
             UGC   0      23       0 eth0

like this I get 10k routes
#cat /proc/net/ipv6_route | wc -l
10015


Any help is highly appreciated.

thanks,
Prashant
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
