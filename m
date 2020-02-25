From: pauloric@contatogs.com.br
Subject: loadbalance  with 2 or more links
Date: Tue, 25 Feb 2020 16:59:38 -0300 (BRT)
Message-ID: <825530945.480.1582660778781.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br 0217D40211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1582660780;
        bh=4s0YRDfZBtlsjZo2L4lj/IbOuR6KGLZSf2qvtVSwaWk=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=TgUc6NOOGPvbKOiczK+A2XiEXJPc/4QXcVhnZjP15QtL/WWRCxtTsHZHLimOZ8wT5
         /pvrkuGQ7OXswiumTaif5Qr+9dcy2vUsSKDPtgJBDlqtUoX28TfHktMhtLYG3ByTcU
         niwllYxYBay0BlA+8TvHaj5crTZs/ikE21R5tLEWYY1ComNKAw37S6fuXFQTE52Fhz
         WSy1KV5hwJE9c1hAB0J3oNQLwadws7WNx0iwL73LHDMzxgmMlE8c4xvkeU9djPY5TM
         G4NtLnGtkT9FD1BItfT0gEQ6i8nx39u30Wv5LKvpWPIqa28mKxFSUAtCx6J57PpAgN
         nPPOTKDvsPGaQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi 

I have been working with iptables and now I'm  migrating to nftables ( BTW really nice job netfilter team 80)  ).

I have been using http://fatihusta.com/2015/03/07/network/linux-wan-load-balancing/  since nexthop is not working for a long time.

Studing nftables wiki I found 2 solutions:


a) nftbl   https://github.com/zevenet/nftlb

nftbl looks like very good, but very complex for a single load balance solution.

or

b) nftables + nat/loadbalance  https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing

98% is ok using iptables-restore-translate as example.


As I've been using  iptables + mangle + iproute, what is easiest solution to use with 2 or more links ??  


Best regards



