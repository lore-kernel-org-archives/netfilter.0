From: RUMI Szabolcs <rumi_ml@rtfm.hu>
Subject: MASQUERADE/SNAT before IPsec
Date: Sat, 2 Feb 2008 22:00:14 +0100
Message-ID: <20080202220014.ab018f1d.rumi_ml@rtfm.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!

I'm trying to achieve the following:

I would like to connect a LAN behind a NAT gateway to an IPsec VPN.
The IPsec VPN gets connected to via IPsec tunnelmode by the NAT
gateway that is getting a single dynamic IP address valid on the
VPN and this is what the LAN machines had to be MASQUERADEd to.

On the NAT gateway a WAN address is assigned to eth0 and the
dynamic IPsec VPN address is assigned to eth0:0. I can ping hosts
on the IPsec VPN through the tunnel from the NAT gateway itself
but I cannot ping them from any LAN hosts behind the gateway.

The problem is that when I set up proper FORWARD and MASQUERADE rules
for the LAN network, the MASQUERADEd packets seem to go out on eth0
unencrypted without ever getting into the IPsec tunnel. I have also
tried -j SNAT --to-source <address of eth0:0 valid on IPsec VPN>
just to be sure and the same thing happens as with MASQUERADE.

Environment: linux-2.6.22, iptables-1.3.8

Is this behaviour intentional?
How could I achieve what I described above?

Thanks in advance!

Best regards,
Sab
