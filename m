From: frank@uptonhall.wirral.sch.uk
Subject: Port Forwarding for Videoconferencing
Date: Thu, 21 Oct 2010 16:38:12 +0100
Message-ID: <20101021152303.M38770@uptonhall.wirral.sch.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I seem to have got myself completely lost in trying to figure out port forwarding to 
enable video conferencing.

We have a server with two NIC cards running Fedora 12:

eth0 is connected to the internal network and has a fixed private IP address of 
10.1.4.73.
eth1 is connected to the internet and has a dynamic public IP address.

The videoconferencing equipment has a fixed IP address of 10.1.0.14 (default gateway 
10.1.4.73).

The remote border controller has an IP address of 217.3.2.254.

The requirements are that the following ports are forwarded in an outbound direction 
to 217.3.2.254:

1719 UDP
1720 TCP
2776 TCP
2776 UDP
2777 UDP
2777 TCP

I know that this should be very straightforward, but I've got myself totally confused!

Regards

Frank

--
Upton Hall School FCJ.

