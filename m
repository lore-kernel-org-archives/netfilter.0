From: Mike <debian@good-with-numbers.com>
Subject: DHCP broadcasts coming from a "mystery" interface
Date: Thu, 8 Jan 2015 03:53:39 +0000
Message-ID: <20150108035339.GA17214@64-142-29-25.dsl.static.sonic.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I just installed a barebones Debian "Wheezy" on a SuperMicro A1SRi-2558F.
http://www.supermicro.com/products/motherboard/Atom/A1SRi-2558F.cfm

I then noticed DHCP broadcasts on the VLAN on which its eth0 is connected.
(None of the other three LAN ports, nor the IPMI port, are connected.)

19:29:50.972187 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:29:54.062182 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:17.212146 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:20.302188 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:23.392586 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:46.542248 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:49.632095 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:52.722288 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:30:54.361734 00:25:90:__:__:__ > 33:33:00:01:00:02, ethertype IPv6 (0x86dd), length 98: fe80::225:90ff:fe__:____.546 > ff02::1:2.547: dhcp6 inf-req
19:31:15.871399 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:31:18.962200 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548
19:31:22.052291 00:25:90:__:__:__ > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 590: 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:25:90:__:__:__, length 548

My switch associates the MAC with this new system, so I know it's the source.
But on this system:

# cat /sys/class/net/eth*/address
0c:c4:7a:__:__:04
0c:c4:7a:__:__:05
0c:c4:7a:__:__:06
0c:c4:7a:__:__:07

(All of these are SuperMicro OUIs.)

So how can I find the interface from which the 00:25:90:... packet originates,
and squelch it?

I changed "filter" INPUT policy on the source machine to DROP, but had to
explicitly DROP --dst-type BROADCAST to keep it from passing through anyway.
The packets don't hit "filter" OUTPUT at all.
