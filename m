From: Alex Bligh <alex@alex.org.uk>
Subject: MAC masquerade issue
Date: Tue, 15 Mar 2011 22:24:53 +0000
Message-ID: <8B8015062CA255FAF97EEBAC@nimrod.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: Alex Bligh <alex@alex.org.uk>

I have a VM configured on a physical machine with a bridge. The hosting
provider concerned filters MAC addresses, so I need to masquerade the
MAC address of the VM. The config is something like:


PROVIDER      PROVIDER      eth0       vnet0
ROUTER  <---> SWITCH   <--------> PHYS <--------> VM
192.200.1.1     00:30:48:c9:39:60                 192.200.1.214/24
                                                  fe:54:00:68:b7:71 


(IP address range changed for confidentiality)

I am using the commands below to translate (I hope) MAC addresses and
mangle ARP appropriately.


MAC_OF_BRIDGE=00:30:48:c9:39:60

MAC=fe:54:00:68:b7:71
IP=192.200.1.24

# Translate packets coming IN from vlan0 and out to eth0 

ebtables -t nat -A POSTROUTING -o eth0 -j snat --to-src $MAC_OF_BRIDGE 
--snat-arp --snat-target ACCEPT

# translate packets coming IN from eth0 and out to vnet0 

ebtables -t nat -A PREROUTING -p IPv4 -i eth0 --ip-dst $IP -j dnat --to-dst 
$MAC --dnat-target ACCEPT
ebtables -t nat -A PREROUTING -p ARP -i eth0 --arp-ip-dst $IP -j dnat 
--to-dst $MAC --dnat-target ACCEPT


VM cannot ARP for the default router

If on PHYS I do a tcpdump on vnet0, I see the expected unmangled packets
going out, but no replies.

shed:/vm# tcpdump -n -e -ivnet0 host 192.200.1.214 and not port 22
tcpdump: WARNING: vnet0: no IPv4 address assigned
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on vnet0, link-type EN10MB (Ethernet), capture size 65535 bytes
22:14:41.542672 52:54:00:68:b7:71 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 42: Request who-has 192.200.1.1 tell 192.200.1.214, length 
28
22:14:42.542550 52:54:00:68:b7:71 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 42: Request who-has 192.200.1.1 tell 192.200.1.214, length 
28

If I do a tcpdump on eth0, I see the mangled packets going out (correctly
I think), and replies

# tcpdump -n -e -ieth0 host 192.200.1.214 and not port 22
tcpdump: WARNING: eth0: no IPv4 address assigned
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 65535 bytes
22:12:09.532619 00:30:48:c9:39:60 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 42: Request who-has 192.200.1.1 tell 192.200.1.214, length 
28
22:12:09.533028 00:00:0c:07:ac:34 > 00:30:48:c9:39:60, ethertype ARP 
(0x0806), length 60: Reply 192.200.1.1 is-at 00:00:0c:07:ac:34, length 46


It seems ebtables is not translating the replies. What have I done wrong?

-- 
Alex Bligh
