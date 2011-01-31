From: Guido Winkelmann <guido-nf@thisisnotatest.de>
Subject: Preventing IPv6 address spoofing with ebtables - --ip6-src rules sometimes don't match?
Date: Mon, 31 Jan 2011 17:43:45 +0100
Message-ID: <201101311743.46263.guido-nf@thisisnotatest.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a virtual machine host with a number of virtual machines running (using kvm),
and I want to hook them up to the network using a bridge. Since the intended users of
the virtual guest machines are not necessarily trusted, I need to make sure they
cannot spoof their source addresses, neither for IPv4, nor for IPv6, nor for the MAC. 
My approach was to, for every protocol, define some rules that match the addresses
that particular host is allowed to use (taken from a database at the moment the rules
are defined) with -j ACCEPT, then follow it with a catch-all rule for all other
addresses with -j DROP.

This works fine as long as I have only a small number of guest machines, but as soon as
the number of guests, and with it the size of the ebtables chain, grows larger, I get
weird effects - namely some of the guests cannot send any IPv6 packets anymore, not
even with their assigned or autoconfigured addresses. It looks to me like the preceding
-j ACCEPT rules with the correct source addresses just stop matching at some point - 
though I cannot see any logical explanation for that.

The impact of this varies wildly. Sometimes most guest machines are affected, sometimes
all are, sometimes it's only a small fraction.

Here's an excerpt for a rule for one of the hosts:

-A PREROUTING -p IPv4 -s 52:54:0:84:6d:87 -i vnet30 --ip-src 62.48.93.33 --log-level notice --log-prefix "vnet30 ip4-src 62.48.93.33 A" --log-ip --log-ip6 -j ACCEPT
-A PREROUTING -p IPv4 -i vnet30 --ip-src 0.0.0.0 --log-level notice --log-prefix "vnet30 ipv4-src dhcp A" --log-ip --log-ip6 -j ACCEPT
-A PREROUTING -p IPv4 -i vnet30 --log-level notice --log-prefix "vnet30 ipv4 default D" --log-ip --log-ip6 -j DROP
-A PREROUTING -p IPv6 -s 52:54:0:84:6d:87 -i vnet30 --ip6-src 2a00:e68:0:fe00::39 --log-level notice --log-prefix "vnet30 ipv6-src 0 A" --log-ip --log-ip6 -j ACCEPT
-A PREROUTING -p IPv6 -s 52:54:0:84:6d:87 -i vnet30 --ip6-src 2a00:e68:0:fe00:5054:ff:fe84:6d87 --log-level notice --log-prefix "vnet30 ipv6-src 1 A" --log-ip --log-ip6 -j ACCEPT
-A PREROUTING -p IPv6 -s 52:54:0:84:6d:87 -i vnet30 --ip6-src fe80::5054:ff:fe84:6d87 --log-level notice --log-prefix "vnet30 ipv6-src 2 A" --log-ip --log-ip6 -j ACCEPT
-A PREROUTING -p IPv6 -i vnet30 --log-level notice --log-prefix "vnet30 ipv6 default D" --log-ip --log-ip6 -j DROP
-A PREROUTING -p ARP -s 52:54:0:84:6d:87 -i vnet30 --arp-ip-src 62.48.93.33 --arp-mac-src 52:54:0:84:6d:87 --log-level notice --log-prefix "vnet30 arp-src 62.48.93.33 A" --log-ip 
--log-ip6 -j ACCEPT
-A PREROUTING -p ARP -i vnet30 --log-level notice --log-prefix "vnet30 arp default D" --log-ip --log-ip6 -j DROP

Note, I tried the same thing in the FORWARD chain instead - it didn't make any
difference.
The rules above are the only ones in the chain that reference interface vnet30, and
there is no rule that does not specify any input interface. (I don't filter for
destinations.)
The host in question has three valid IPv6 addresses: one manually configured, one
autoconfigured on router advertisements, one autoconfigured for link-local.

The rules are created automatically by a script, which pipes them into
ebtables-restore, meaning for every change, the entire ebtables ruleset is dropped and
completely recreated.
I've ended up adding unique log prefixes to the rules so I would at least see which
rule would actually drop the outgoing packets.

Now when I ping6 2a00:e68:0:fe00::39 while the firewall is up, I see the following line
in /var/log/messages on the host:

vnet30 ipv6 default D IN=vnet30 OUT= MAC source = 52:54:00:84:6d:87 MAC dest = 00:26:b9:7e:03:b9 proto = 0x86dd IPv6 SRC=2a00:0e68:0000:fe00:0000:0000:0000:0039 IPv6 
DST=2a00:0e68:0000:fe00:0226:b9ff:fe7e:03b9, IPv6 priority=0x0, Next Header=58

As you can see, the packet is matched and dropped by the seventh rule in the excerpt
above, even though it already should have been matched and accepted before it could
even reach that point of the rule chain by rule number four.

I'm still not sure if I'm doing something wrong here or if that is a bug in netfilter.
Can somebody help me with this?

The host is running Fedora 14, with Kernel 2.6.35.10-74.fc14.x86_64 and ebtables
v2.0.9-2

Regards,

	Guido
