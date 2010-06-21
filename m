From: "Edwin van den Oosterkamp" <edwin@vandenoosterkamp.com>
Subject: Outbound traffic over two interfaces by port number
Date: Mon, 21 Jun 2010 13:58:06 +0100
Message-ID: <7628f5b45c96214fccdfcf03e8440ed2.squirrel@edders.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello All,

The requirement I have is bit unusual and unfortunately I have not found
any answers searching the archives and the Internet in general. I hope
that if it is actually possible this knowledge will be with this list. I'm
a programmer with quite a bit of experience on Linux kernel based systems,
but fairly new to netfilter specifics.

My system has two NICs (eth0 and eth1) and both are connected to different
networks. One network is for handling data streams, the other solely for
controlling. Both networks may have gateways, both networks may have
overlapping IP address ranges. Luckily, there is only a handful of ports
in use, which allows me to filter all the incoming packets and drop the
wrong type of packet (data/control traffic) from the wrong type of
interface (data/control interface). The system is not allowed to route
between the two networks.

The issue I'm having is that for outbound packets the kernel can select
the "wrong" interface - e.g. control traffic will then go out on the
data-only network (due to overlapping IP ranges or having two gateways for
example). Can I use netfilter to force/redirect these packets so that they
still go out on the "correct" interface, which in this case would be the
control-network? I can see from the port number on which interface (data
or control) the packet was supposed to go out and would like to use that
information to ensure that the packet does go out on the correct network.

I hope that I have been clear, if not then please let me know and will be
more than happy to elaborate.

Best regards,

Edwin.



