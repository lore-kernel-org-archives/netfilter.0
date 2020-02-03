From: Jaga Doe <jaga.doe@aol.com>
Subject: nftables simple configuration
Date: Mon, 3 Feb 2020 21:09:43 +0000 (UTC)
Message-ID: <1991613112.828781.1580764183006@mail.yahoo.com>
References: <1991613112.828781.1580764183006.ref@mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1580764187; bh=YKJV0wjExP5tqPwgN5roNWT2Ob7RXAukjf+z4OfShA8=; h=Date:From:To:Subject:References:From:Subject; b=DcJm75t3I2WikjFSgmk8sMWuRvMZE3JsKbzx6aD7wwsWC0aB3UUzaauLHGDGqdnemhoGPUV+XaoT7isTqsei1xm5kzd5GwB0mmG5bLen4AFzhOp6FGurE+0ftPIHyiDn8MvuxCRdYcgyw1RZEi1aljPiBDmtu+QGunjB8h+kfLDdYNlysX3xWObdNRjoBQ2DHLY4Kurz8OvsZ/x8B/eqAjiv8wa+x8ykFX1cxkcv3BX1Sd3EaEh2puvdHAIFbCnw1tUxTTzxLVIYc8s67CCMVmkmRCAdTq+hjiW0ln28Sdm2aqntsex3SMGxePbcPZzAAFw5efbZ2JYZDRYxuvVMKA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

        Hello,
   I am very new in Linux (just bought a while ago a PI unit) and while playing with what Linux can do I found about nftables. The tool seem fantastic and while at first sight is quite simple I am not able to create a very simple configuration. Here is what I am trying to do:
                                         +-------+
                                         |DHCP|
                                         +-+----+
                                             |
+--------------+               +---v-------+           +------------+   direct     +-------------+
|  WinPC1   +--------->+ Router +---------->+  myPI  |-------------->+ WinPC2 |
+--------------+               +------------+           +------------+   cable     +-------------+
IP: 192.168.10.11                                    eth1        eth2                 IP: 192.168.10.30
MAC:10:ab:34:e2:93:45                                                                  MAC: 10:ab:34:f9:a2:ec

In my PI device I am trying to do this:

1. all traffic arriving on eth1 and not having as destination WinPC2 port 3000 must be forwarded to eth2 (without changing IP/MAC of the source)
2. all traffic arriving on eth2 not originating on WinPC2 port 3000 should be forwarded to eth1
3. the traffic entering on eth1 and having as destination WinPC2 port 3000 must be send to a local process listening on port 3300.
4. the local process which is intercepting the traffic at #3 will connect to the WinPC2 port 3000 and will send packages with the source being set to WinPC1 IP/MAC
5. the WinPC2 replies coming from port 3000 should go back to my local process and this will send them to the WinPC1 having the IP/MAC of WinPC2.

The traffic which is going directly from eth1 to eth2 and vice versa should allow everything, including ARP, ICMP, etc.
Practically I need to intercept a specific connection (plain unencrypted TCP connection) between WinPC1 and WinPC2 and act as a man in the middle for that connection.

Thank you and best regards,
Jaga.
