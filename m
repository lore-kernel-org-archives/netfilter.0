From: "Walter H." <walter.h@mathemainzel.info>
Subject: User defined chains to reduce/make more readable
Date: Wed, 26 Jul 2017 10:03:22 +0200
Message-ID: <aa7cbc43bc58207ef3867861ecaa0169.1501056202@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:Message-ID; bh=Il28wHGz4iu3RqwGZA6xhUNKSjyRX21q4nq6td918CI=;
        b=qPj7wUQ7XWlQUGJTfDJennebGEO2o+SnUFoj0p9/gsEgUTl81eHgISZ9BDKIbCzTmMDTmhhjh58Ryy2rq/En202jHxFpZ6jiRMOIvFBYYq10QIdyNsKkn7vN4Xj6Oi7R5OqM6plQRcXQ1DqqLK5cAU3vKlD8ul44l3LUQ6PoGlw=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I define this chain:

-N RESTRICT-HOST
-A RESTRICT-HOST -p icmp -j ACCEPT
-A RESTRICT-HOST -p udp --dport 123 -j ACCEPT
-A RESTRICT-HOST -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT
-A RESTRICT-HOST -j LOG --log-prefix "xxx: " --log-level 7
-A RESTRICT-HOST -j REJECT

and would use it like this:

-A FORWARD -i eth0 -o eth1 -s 192.168.1.1 -j RESTRICT-HOST
-A FORWARD -i eth0 -o eth1 -s 192.168.11.11 -j RESTRICT-HOST
-A FORWARD -i eth0 -o eth1 -s 192.168.111.111 -j RESTRICT-HOST

where eth0 is the LAN port and eth1 the WAN port of the router

is there a possibility where I can change these rules similar to these:

-A FORWARD -i eth0 -o eth1 -s 192.168.1.1 -j RESTRICT-HOST "game-pc: "
-A FORWARD -i eth0 -o eth1 -s 192.168.11.11 -j RESTRICT-HOST "office-pc: "
-A FORWARD -i eth0 -o eth1 -s 192.168.111.111 -j RESTRICT-HOST "tablet-pc: "

and a rule in the chain takes "game-pc: " instead of this "xxx: " as given
above?

Thanks,
Walter


