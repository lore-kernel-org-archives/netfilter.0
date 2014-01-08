From: Sean Palmer <sepalmer@metrocast.com>
Subject: spurious packets on netfilter queue fd
Date: Wed, 8 Jan 2014 23:07:43 +0000
Message-ID: <B4E0F27BF52B614E8E3C8A6D9EC47597CDE8EB@roch-exmb-01.harron.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Sometimes I get an infinite flood of 52-byte netlink packets, every time
I call recv() on the queue fd. I have ip6tables configured to only queue
up certain TCP packets on port 25:

ip6tables -I INPUT -i eth0 -p tcp -m tcp --dport 25 \
          --tcp-flags FIN,SYN,RST,ACK SYN -j QUEUE

ip6tables -nvL during this flood doesn't show the number of packets
increasing, so I don't know where the traffic is coming from. If I remove
the rule once the flood has started, packets keep coming even though there
is no QUEUE rule left!

Messages with TCP/IPv4 are 100 bytes, and TCP/IPv6 are 120, so it's a lot
smaller than those. Calling nfq_handle_packet() on them returns -1.

Where do these packets come from, and how do I get rid of them?

Thanks,
Sean Palmer
