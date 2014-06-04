From: Alex Bligh <alex@alex.org.uk>
Subject: ebtables, MAC masquerading, and ARP and ND rewriting
Date: Wed, 4 Jun 2014 16:15:43 +0100
Message-ID: <A84A4D9E-256A-48E6-A004-111F07E6091B@alex.org.uk>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

I am trying to use Linux to perform in a bridge configuration using
ebtables. The particular bridge I am plugging Linux into appears to
have some design flaws (for anyone interested, it's the bridge inside
VMware with NIC teaming), and the vendor appears to be uninterested
in fixing it.

The configuration looks like this:

   |          ..........      ......................  aa:bb:cc:dd:ee:01
   |  NIC-A   : VMware :      :    Linux bridge    :------------ Dev1
   +----------: bridge :      :                    : 
   |          :        :      : 11:22:33:44:55:66  :  aa:bb:cc:dd:ee:02
   |          :        :------: eth0               :------------ Dev2
   |  NIC-B   :        :      :                    :
   +----------:        :      :                    :  aa:bb:cc:dd:ee:03
   |          :        :      :                    :------------ Dev3
   |          :........:      :....................:
  LAN

NIC-A and NIC-B are in active/passive mode, however, passive does not
mean 'does not transmit packets'.

What happens is a broadcast packet leaves device Dev1 with source address
aa:bb:cc:dd:ee:01, is passed through the linux bridge and transmitted
through device eth0 to the VMware bridge. It is then transmitted
out of NIC-A onto the LAN. What then happens is that the switch(es)
on the LAN transmits the packet through NIC-B back to the VMware
bridge.

The VMware bridge appears to have an 'interesting' bridge algorithm,
in that it is not a learning bridge that it appears to examine the
source address of the packet, and determine that as it is not the MAC of
the VM device (11:22:33:44:55:66), it transmits it to eth0. This
causes the linux bridge to learn (incorrectly) that aa:bb:cc:dd:ee:01
can be reached through eth0.

Essentially VMware has not been designed with there being more
than one MAC address used to the right of the bridge.

One route here would be to drop all packets coming in from eth0
that have the MAC addresses of Dev1 to Dev3. But that is hard
as I'd need to know in advance what Dev1 to Dev3's MAC addresses
are and indeed these can change real time.

A better route (I think) be to do what VMware wants, and only use
one MAC source address to the right of the bridge. This would require
MAC masquerading. I know how to do this with ebtables, but I don't
know how to handle the issue of ARP (IPv4) and ND (IPv6) packets.

The ebtables examples page suggests this is handled by the BROUTE
table DROP-ing, and hence routing the packets. That won't work
for me as I'm not using the IP stack under Linux and indeed there
may be IP address conflicts between the management of the Linux
box and the VLANs which are bridged. What I think I need to do is
rewrite the outgoing arp replies and ND replies going through eth0
so that all MAC addresses are set to that of eth0 (i.e. 11:22:33:44:55:66
on the above). I don't think I can use arptables to do this as
this requires the packets are routed. And that doesn't help with ND.

Any ideas?

-- 
Alex Bligh




