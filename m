From: Martin Mares <mj@ucw.cz>
Subject: ulogd2 and multiple outputs
Date: Wed, 4 Jul 2012 18:44:16 +0200
Message-ID: <mj+md-20120704.164008.2210.albireo@ucw.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, world!\n

I am configuring ulogd2 on my router and I would like to log all packets
rejected by the firewall to both a textual log and a PCAP file.

However, ulogd2 refuses to put multiple output modules in a single stack,
so I have to make iptables send packets to two different NFLOG groups
handled by separate ulogd stacks.

Is there any reason why multiple output modules cannot be combined?
From a brief inspection of the code, it does not appear to be.

				Have a nice fortnight
-- 
Martin `MJ' Mares                          <mj@ucw.cz>   http://mj.ucw.cz/
Faculty of Math and Physics, Charles University, Prague, Czech Rep., Earth
Immanuel doesn't pun, he Kant.
