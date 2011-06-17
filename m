From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: pcap files reading with iptables
Date: Fri, 17 Jun 2011 17:31:02 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106171730170.23087@frira.zrqbmnf.qr>
References: <9ac1a49b24c19951f264d6bee409fef9@cs.dal.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9ac1a49b24c19951f264d6bee409fef9@cs.dal.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrey <andrey@cs.dal.ca>
Cc: netfilter@vger.kernel.org

On Friday 2011-06-17 16:44, andrey wrote:

> Hello,
>
> I have tried to classify pcap files using layer7 userspace filter.
> In order to do that I need to set a rule in iptables that QUEUE the traffic.
> Since iptables does not read pcap files, I have used tcpreplay to replay the
> traffic form the pcap file.
> tcpreplay is replaying the data from the pcap file on the interface card.
> I have checked with wireshark if the packets get through and they do.
> My problem is that iptables seems to not receive the packets.
> What could be the problem? Do the packets get dropped somewhere?

AF_PACKET sockets bypass Netfilter. (Which is why, on the receive paths, 
you still see packets with tcpdump despite having applied an iptables 
filter.)
