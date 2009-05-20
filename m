From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 11:42:31 -0700 (PDT)
Message-ID: <594168.503.qm@web44807.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242844951; bh=14sKqYU+iu1KjnxHB+3pg9sLytV6KIah1pbhdIqQITI=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=4v7BwzbFqoCiNjbCddAXSWyzIXASGUTr7zOkfBeiR5yjXWAjXHXqZLfXLazdqDQ1OcixYChHS7AOsyL1sxstBHC3rF2UF4uqiKb+rmZVdycIkxkHRAiV1eGOrxz48FE89kN4QoM1Es/jvf86ETqClW14RuoQl6IdbHFaO3+Km1c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


I did log, with tcpdump though (ethertype file seems fine, shown below):

debian-firewall-0:/etc/Bastille# tcpdump -i br0
tcpdump: WARNING: br0: no IPv4 address assigned
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on br0, link-type EN10MB (Ethernet), capture size 96 bytes
01:21:53.041277 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:21:56.041145 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:21:59.041106 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:22:06.041040 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:22:09.040964 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:22:17.036982 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:22:28.036967 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 
01:22:37.060312 arp who-has 192.168.0.1 tell 192.168.0.21
01:22:37.060750 arp reply 192.168.0.1 is-at 00:06:25:f0:2e:fd (oui Unknown)
01:22:37.060898 IP 192.168.0.21 > 192.168.0.1: ICMP echo request, id 53019, seq 
01:22:37.064312 IP 192.168.0.21 > IGMP.MCAST.NET: igmp v3 report, 1 group record
01:22:37.297162 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0 [3q] [5n][|domain]
01:22:37.340502 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0*- [0q] 2/0/0 PTR[|dom
01:22:37.548553 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0 [3q] [5n][|domain]
01:22:37.800601 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0 [3q] [5n][|domain]
01:22:38.000694 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0*- [0q] 5/0/0[|domain]
01:22:38.528443 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0*- [0q] 5/0/0 PTR[|dom
01:22:39.188652 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0*- [0q] 5/0/0[|domain]
01:22:40.716560 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0*- [0q] 5/0/0 PTR[|dom
01:22:41.208356 IP 192.168.0.21 > IGMP.MCAST.NET: igmp v3 report, 1 group record
01:22:41.376602 IP 192.168.0.21.mdns > 224.0.0.251.mdns: 0*- [0q] 5/0/0[|domain]
01:22:45.629011 00:50:8b:11:82:f8 (oui Unknown) > Broadcast, ethertype Unknown (
        0x0000:  1000 ffff ff01 0000 0000 0000 0000 0000  ................
        0x0010:  0000                                     ..
01:22:45.629093 00:c0:4f:2d:5b:68 (oui Unknown) > Broadcast, ethertype Unknown (
        0x0000:  1000 ffff ff01 0000 0000 0000 0000 0000  ................
        0x0010:  0000 3535 3535 3535 3535 3535 3535 3535  ..55555555555555
        0x0020:  3535 3535 3535 3535 3535 3535 3535       55555555555555
01:22:47.094032 arp who-has 169.254.5.88 tell 0.0.0.0
01:22:48.528175 arp who-has 169.254.5.88 tell 0.0.0.0
01:22:49.048433 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request 


#
# Ethernet frame types
#               This file describes some of the various Ethernet
#               protocol types that are used on Ethernet networks.
#
# This list could be found on:
#         http://www.iana.org/assignments/ethernet-numbers
#
# <name>    <hexnumber> <alias1>...<alias35> #Comment
#
IPv4            0800    ip ip4          # Internet IP (IPv4)
X25             0805
ARP             0806    ether-arp       #
FR_ARP          0808                    # Frame Relay ARP        [RFC1701]
BPQ             08FF                    # G8BPQ AX.25 Ethernet Packet
DEC             6000                    # DEC Assigned proto
DNA_DL          6001                    # DEC DNA Dump/Load
DNA_RC          6002                    # DEC DNA Remote Console
DNA_RT          6003                    # DEC DNA Routing
LAT             6004                    # DEC LAT
DIAG            6005                    # DEC Diagnostics
CUST            6006                    # DEC Customer use
SCA             6007                    # DEC Systems Comms Arch
TEB             6558                    # Trans Ether Bridging   [RFC1701]
RAW_FR          6559                    # Raw Frame Relay        [RFC1701]
AARP            80F3                    # Appletalk AARP
ATALK           809B                    # Appletalk
802_1Q          8100    8021q 1q 802.1q dot1q # 802.1Q Virtual LAN tagged frame
IPX             8137                    # Novell IPX
NetBEUI         8191                    # NetBEUI
IPv6            86DD    ip6             # IP version 6
PPP             880B                    # PPP
ATMMPOA         884C                    # MultiProtocol over ATM
PPP_DISC        8863                    # PPPoE discovery messages
PPP_SES         8864                    # PPPoE session messages
ATMFATE         8884                    # Frame-based ATM Transport over Ethernet
LOOP            9000    loopback        # loop proto


--- On Wed, 5/20/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
> To: "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, May 20, 2009, 5:03 PM
> On Wed, 20 May 2009, Miguel
> Ghobangieno wrote:
> 
> > Those are various rules I've tried. I've tried the
> hex, then when that
> > didn't work I tried the "ip and IPv4" stuff. None
> worked.
> > 
> > Here is the test network currently:
> > laptop---(crossover
> >
> cable)-->[eth1](BridgingFirewall[Br0])[eth0]---->[192.168.0.1](Linksys
> > router)--->[Internet]
> 
> OK. So the linksys box is the dhcp server.
>  
> >       But it's really strange
> and suspicious that names do not work,
> >       something is really
> broken on your system. Have you got a
> >       correct 
> >       /etc/ethertypes file?
> Does you run the ebtables commands in
> >       chroot?
> 
> Why don't you check that file?
> 
> >       Why don't you log the
> packets??
> 
> Third times I write: why don't you log the packets?
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu,
> kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear
> Physics
>           H-1525 Budapest 114,
> POB. 49, Hungary


      

