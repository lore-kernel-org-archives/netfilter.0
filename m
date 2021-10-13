From: =?iso-8859-1?Q?VELARTIS_Philipp_D=FCrhammer?= 
        <p.duerhammer@velartis.at>
Subject: packet reassembling and fragmentation
Date: Wed, 13 Oct 2021 11:05:39 +0000
Message-ID: <5e7b57b199084a6792249600b534f951@velartis.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi,

we use proxmox and changed from a normal bridge to a "vlan aware bridge". Since then packages > 1500 don't get forwarded to the bond device after the bridge. But only if they are vlan tagged.

Setup not working:
tapX (tagged) <- -> vmbr0 <- - > bond0

Setup working:
tapX (untagged) <- -> vmbr0 <- - > bond0

Setup also working:
tapX < - - > vmbr0v350 < -- > bond0.350 < -- > bond0

All packages are inspected by the firewall. If I turn net.bridge.bridge-nf-call-iptables to 0 all traffick works again. So the netfilter module as it should reassembles the packages for the firewall but with VLAN tag they never get fragmented again. Who is in charge for fragmenting the packages again if they quere reassembled by netfilter? Ist it the bridge or netflter? Normally a bridge should not fragement as it is layer to so I assume it should be netfilter? Maybe some kind of bug?

Example:

I see this with ping -s 1500

On tap interface: 
11:19:35.141414 62:47:e0:fe:f9:31 > 54:e0:32:27:6e:50, ethertype IPv4 (0x0800), length 1514: (tos 0x0, ttl 64, id 39999, offset 0, flags [+], proto ICMP (1), length 1500)
    37.16.72.52 > 77.244.240.131: ICMP echo request, id 2182, seq 4, length 1480
11:19:35.141430 62:47:e0:fe:f9:31 > 54:e0:32:27:6e:50, ethertype IPv4 (0x0800), length 562: (tos 0x0, ttl 64, id 39999, offset 1480, flags [none], proto ICMP (1), length 548)
    37.16.72.52 > 77.244.240.131: ip-proto-1

On vmbr0:
11:19:35.141442 62:47:e0:fe:f9:31 > 54:e0:32:27:6e:50, ethertype 802.1Q (0x8100), length 2046: vlan 350, p 0, ethertype IPv4 (0x0800), (tos 0x0, ttl 64, id 39999, offset 0, flags [none], proto ICMP (1), length 2028)
    37.16.72.52 > 77.244.240.131: ICMP echo request, id 2182, seq 4, length 2008

On bond0 its gone....


