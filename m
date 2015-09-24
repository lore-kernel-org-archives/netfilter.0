From: Corin Langosch <info@corinlangosch.com>
Subject: migration of ebtables arp rule to nftables
Date: Thu, 24 Sep 2015 16:34:42 +0200
Message-ID: <56040A02.5060605@corinlangosch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi guys,

I'd like to move to nftables (Ubuntu trusty, kernel 3.19). So far it works quite well, however I wonder how to migrate
these ebtables rules:

-p ARP --arp-op Request --arp-ip-dst 192.168.178.237 -j ACCEPT
-p ARP --arp-op Reply --arp-ip-dst 192.168.178.237 -j ACCEPT
-j DROP

-p ARP --arp-op Request --arp-ip-src 192.168.178.237 --arp-mac-src 2:fb:c5:e0:ef:a3 -j ACCEPT
-p ARP --arp-op Reply --arp-ip-src 192.168.178.237 --arp-mac-src 2:fb:c5:e0:ef:a3 -j ACCEPT
-j DROP

They are used to prevent ARP spoofing of qemu quests using tap devices on the host. The rule "nft add rule bridge filter
qemu1-o arp operation request counter accept" works, however I have no idea how to add the ip/mac contraints to the rule.

Thanks for any help. :)

Cheers
Corin
