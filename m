From: Hongyi Zhao <hongyi.zhao@gmail.com>
Subject: The differences between hash:ip and hash:net.
Date: Wed, 14 Oct 2015 07:19:46 +0000 (UTC)
Message-ID: <mvkvmi$7k2$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

From the ipset manpage, I can see the following depictions:

hash:ip
  The  hash:ip  set type uses a hash to store
  IP host addresses (default) or network addresses.

hash:net
  The hash:net set type uses a hash to store different
  sized  IP  network addresses.

So, it seems that both types can be used to store the network addresses.

Hence, my issues are:

1- Since the hash:ip can be used to store both host addresses and network 
addresses, why the developer design another set type hash:net?

2- It's well know that any host addresses can be written into the form of 
the 32-bits cidr prefix form. Since the ipset type hash:net should also 
can be used to store the host addresses and network addresses.

In one word: what's the differences between hash:ip and hash:net?

Regards
-- 
.: Hongyi Zhao [ hongyi.zhao AT gmail.com ] Free as in Freedom :.

