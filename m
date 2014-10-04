From: John Smithee <for-gmane@mutluit.com>
Subject: Basic routing
Date: Sat, 04 Oct 2014 03:10:58 +0200
Message-ID: <m0nhf2$oqq$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I've 2 NICs on a machine, both attached to seperate networks
(192.168.68.0/24 and 192.168.69.0/24). I'm trying to set up a
basic gateway (or routing?) between the two networks.

The first network has a gateway to other networks behind it,
it can reach all networks well, incl. the first network.

The second network can reach the first, but reaching anything
beyond (ie. the other networks behind the first network) is
somehow not possible.

Only IPv4 is used, and IP forwarding on the machine is enabled (ie. 
net.ipv4.ip_forward=1 in /etc/sysctl.conf).

Is this a classical routing issue or has this to be done via iptables?

I rather would like to keep the original IPs in the packet headers,
ie. not use NAT, and also not use bridging.
How can this be done?

