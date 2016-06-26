From: Brilliantov Kirill Vladimirovich <brilliantov@inbox.ru>
Subject: Routing packet on bridge with wireless
Date: Sun, 26 Jun 2016 19:42:33 +0300
Message-ID: <20160626164233.GA2136@kirill.netbynet.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
	h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=3TdgohI29173rwzSwYoR0udwOHZiz3+eUZb5f0U/Yaw=;
	b=DC0L4d/R2BmHQaNDolS3gYuX9loXwFvWVUpoomfg3GK+U9c+CD3C6zLuCuBEeAcvLFxAzDp6NCxHpPTK1895V+JqI6+L9yicf2IE79F5aC+ETm/MMzPkUCf4Hkry1WUXr89P50C80DpsubDeugO2qKc6l0SPvVAY76oQBsNfDeE=;
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello!
I have bridge from eth0 (wired interface) and wlan0 (wireless interface),
wlan0 connected with router via wpa_supplicant.

~ # brctl show
 bridge name     bridge id               STP enabled     interfaces
 br0             8000.544a1612d064       no              eth0
                                                         wlan0

~ # ip l
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast master
br0
    link/ether f8:dc:7a:07:20:76 brd ff:ff:ff:ff:ff:ff
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master br0 qlen
100
    link/ether 54:4a:16:12:d0:64 brd ff:ff:ff:ff:ff:ff
4: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
    link/ether 54:4a:16:12:d0:64 brd ff:ff:ff:ff:ff:ff

~ # ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
	inet 127.0.0.1/8 scope host lo
   valid_lft forever preferred_lft forever
2: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast master
br0
    link/ether f8:dc:7a:07:20:76 brd ff:ff:ff:ff:ff:ff
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master br0 qlen
100
    link/ether 54:4a:16:12:d0:64 brd ff:ff:ff:ff:ff:ff
4: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
    link/ether 54:4a:16:12:d0:64 brd ff:ff:ff:ff:ff:ff
	inet 192.168.1.3/24 scope global br0
   valid_lft forever preferred_lft forever

~ # ip r
192.168.1.0/24 dev br0  src 192.168.1.3

Unfortunately I not get answer on pings, but I see what packet use wlan0 as out
interface.
~ # ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1): 56 data bytes
^C
--- 192.168.1.1 ping statistics ---
9 packets transmitted, 0 packets received, 100% packet loss

Can solve this problem if I will be use netfilter.

Thank you and excuse my bad english.
