From: "J. Bakshi" <joydeep@infoservices.in>
Subject: How to force all packet go through tun0 ?
Date: Wed, 5 Dec 2012 15:31:59 +0530
Message-ID: <20121205153159.2f96e942@shiva.selfip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I have reconnect script which reconnect the vpn connection if
tun0 is missing. Still during the reconnect phase, the packets
go through the eth0. How can I force all packets to go through
tun0 and how can I exclude the domain required for vpn connection
to be established ?

Thanks
