From: "Martin Fandel" <pingu.freak@gmx.de>
Subject: Netmap on a single host?
Date: Mon, 10 Jan 2011 16:35:00 +0100
Message-ID: <20110110153500.255590@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

does the module NETMAP work on a single host environment? I have the following environment. It works perfectly by using two NETMAP systems. Here is an little connection flow overview:

Endhost 1: 10.10.10.10/32 <-> Gateway 1: 10.10.10.1/32 <---> Line Gateway 1: 192.168.1.1/32 <---> Line Gateway 2: 192.168.1.2/32 <---> Gateway 2: 10.10.10.1/32 <-> Endhost 2: 10.10.10.10/32

If Enhost 1 want to connect to Endhost 2, the host connects to 10.30.10.0/24, which is the netmap'ped net for Gateway 2. If Endhost 2 wants to connect to Endhost 1, the host connects to 10.20.10.0/24, which is the netmap'ped net for Gateway 1. 

The NETMAP solution works, but I can't migrate the two gateway hosts to one single host. Does anybody know how to manage this? I'm a little bit confused. I've it tried this way, but I can't get it working:

SingleHostGateway:

eth0 > vlan trunk to cisco
eth0.1 > vlan 1 for endhost 1 with the ip 10.10.10.1
eth0.2 > vlan 2 for endhost 2 with the ip 10.10.10.1

If I'm applying the iptables-Rules to this construct, it seems that it is not possible to set the Rules for single interfaces?!? Or that the Linux Routing can't do it.

Maybe someone of you guys can help me? That would be very nice.

Thanks a lot!

Regards,

Martin
-- 
GMX DSL Doppel-Flat ab 19,99 Euro/mtl.! Jetzt mit 
gratis Handy-Flat! http://portal.gmx.net/de/go/dsl
