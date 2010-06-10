From: Thanasis <thanasis@asyr.hopto.org>
Subject: traffic shaping between two LANs and one ppp0 default gw
Date: Thu, 10 Jun 2010 05:20:11 +0300
Message-ID: <4C104BDB.7060706@asyr.hopto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Maybe this is not directly related to netfilter, but I believe that
someone may be able to help in this simple scenario:
A router (linux) has 3 NICs: eth1 (ppp0) connects to WAN via ADSL modem
~2Mbps/700Kbps up/down.
The other 2 NICs connect to local LANs with private IPs: eth0 to
192.168.0.0/24, and eth2 to 192.168.10.0/24.
The router provides internet connectivity to both LANs' PCs by NATing
(the one public IP).
We would like to divide the incoming and outgoing bandwidth equally
between those two LANs, ie:
PCs from the two LANs should not be able to upload more than 300Kbps
(total per LAN) via either eth2 or eth0, so as not to flood the outgoing
ppp0 interface.
On the other hand, routing packets between the 2 LANs (from eth2 to eth0
and vice versa) should not be restricted, ie should be at 100Mbps.
How would this be best and simplest implemented by using iproute2 (tc) ?

