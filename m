From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re:(ebtables log) (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Wed, 20 May 2009 22:06:06 -0700 (PDT)
Message-ID: <238541.5612.qm@web44808.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242882366; bh=P67FcKrDTvTx8V3fOTM83Cfa/aJzEL4Ly6Cv5ssr81s=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=C0mT2D7Ikg4LRQF2ZncZ6AaYoU+nB+PqLKUz8un6AIyJ20OQYVNJKfY11cUaLpnsLOxprJc/N0UPiwSEh8k4haJBTao1ZmwR0W514b7EoLC2hSSMN94fMl7Xj5LAq3bk5kNQctyM3mNu0rLm8z+S2mcWGU5Iof+1CGJx28mZF30=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


Ok I logged it:

/usr/sbin/brctl addbr br0
/usr/sbin/brctl addif br0 eth0
/usr/sbin/brctl addif br0 eth1
/sbin/ip link set br0 up
/sbin/ip link set eth0 up # don't ask me why
/sbin/ip link set eth1 up # don't ask me why
#/sbin/ip addr add 192.168.0.6 brd + dev br0
#/sbin/route add default gw 192.168.0.1 dev br0 ##Only needed if eth2 hasn't allready set default gateway

# ebtables...
# example rule: block all ICMP
ebtables -F FORWARD
ebtables -P FORWARD DROP
ebtables -A FORWARD -p ip --log --log-ip --log-arp --log-prefix MISC
ebtables -A FORWARD -p ip --ip-proto icmp -j DROP --log --log-ip --log-arp --log-prefix ICMP ## block all ICMP

ebtables -A FORWARD -p 0x800 --ip-proto udp --ip-sport 67:68 -j ACCEPT --log --log-ip --log-arp --log-prefix a67
ebtables -A FORWARD -p 0x800 --ip-proto udp --ip-dport 67:68 -j ACCEPT --log --log-ip --log-arp --log-prefix b67
## Arp for all
ebtables -A FORWARD -p 0x806 -j ACCEPT --log --log-ip --log-arp --log-prefix ARP ##Allow ARP
##Squid Server
ebtables -A FORWARD -p ip --ip-src 192.168.0.21 -s ! 00:08:0D:54:13:C9 -j DROP --log --log-ip --log-arp --log-prefix HTTPNOSPOOF #Drop any naively IP spoofed$
ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-dst 192.168.0.21 --ip-proto tcp --ip-sport 80 -j ACCEPT --log --log-ip --log-arp --log-prefix a80 #Allow sq$
ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-src 192.168.0.21 --ip-proto tcp --ip-dport 80 -j ACCEPT --log --log-ip --log-arp --log-prefix b80 #Allow sq$
ebtables -A FORWARD -i eth0 -o eth1 -p 0x800 --ip-dst 192.168.0.21 --ip-proto tcp --ip-sport 443 -j ACCEPT --log --log-ip --log-arp --log-prefix a443 #Allow $
ebtables -A FORWARD -i eth1 -o eth0 -p 0x800 --ip-src 192.168.0.21 --ip-proto tcp --ip-dport 443 -j ACCEPT --log --log-ip --log-arp --log-prefix b443 #Allow $
ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.21 --ip-dst 167.206.3.137 --ip-proto udp --ip-dport 53 -j ACCEPT --log --log-ip --log-arp --log-prefix aDNS #$
ebtables -A FORWARD -p 0x800 --ip-src 167.206.3.137 --ip-dst 192.168.0.21 --ip-proto udp --ip-sport 53 -j ACCEPT --log --log-ip --log-arp --log-prefix bDNS #$
##SSH Server
ebtables -A FORWARD -p ip --ip-src 192.168.0.21 -s ! 00:08:0D:54:13:C9 -j DROP --log --log-ip --log-arp --log-prefix SSHNOSPOOF #Drop any naively IP spoofed $
ebtables -A FORWARD -p 0x800 --ip-dst 192.168.0.21 --ip-proto tcp --ip-dport 22 -j ACCEPT --log --log-ip --log-arp --log-prefix a22 #Allow SSH from internet $
ebtables -A FORWARD -p 0x800 --ip-src 192.168.0.21 --ip-proto tcp --ip-sport 22 -j ACCEPT --log --log-ip --log-arp --log-prefix b22 #Allow SSH from internet $
## Everyone (If you want everyone to beable to do something :P
ebtables -A FORWARD -p 0x800 --ip-dst 167.206.3.137 --ip-proto udp --ip-dport 53 -j ACCEPT --log --log-ip --log-arp --log-prefix a53 #Allow DNS access throug$
ebtables -A FORWARD -p 0x800 --ip-src 167.206.3.137 --ip-proto udp --ip-sport 53 -j ACCEPT --log --log-ip --log-arp --log-prefix b53 #Allow DNS access throug$




Some Log:

x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=167.206.3.136
May 21 01:03:46 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=167.206.3.136
May 21 01:03:46 debian-firewall-0 kernel: INPUT DROP 5 IN=br0 OUT= PHYSIN=eth1 MAC=ff:ff:ff:ff:ff:ff:00:08:0d:54:13:c9:08:00 SRC=0.0.0.0 DST=255.255.255.255 LEN=328 TOS=0x10 PREC=0x00 TTL=64 ID=0 PROTO=UDP SPT=68 DPT=67 LEN=308 
May 21 01:03:46 debian-firewall-0 kernel: MISC IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x10, IP proto=17 SPT=68 DPT=67
May 21 01:03:46 debian-firewall-0 kernel: a67 IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0800 IP SRC=0.0.0.0 IP DST=255.255.255.255, IP tos=0x10, IP proto=17 SPT=68 DPT=67
May 21 01:03:47 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=167.206.3.203
May 21 01:03:48 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=167.206.3.203
May 21 01:03:49 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=167.206.3.203
May 21 01:03:51 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:03:52 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:03:53 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:03:57 debian-firewall-0 dhclient: DHCPREQUEST on eth2 to 192.168.0.1 port 67
May 21 01:03:58 debian-firewall-0 kernel: grsec: From 192.168.0.10: exec of /usr/bin/jed (jed /var/log/syslog ) by /bin/bash[bash:9627] uid/euid:0/0 gid/egid:0/0, parent /bin/bash[bash:8485] uid/euid:0/0 gid/egid:0/0
May 21 01:04:04 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:05 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:06 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:10 debian-firewall-0 dhclient: DHCPREQUEST on eth2 to 192.168.0.1 port 67
May 21 01:04:16 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:17 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:18 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:26 debian-firewall-0 dhclient: DHCPREQUEST on eth2 to 192.168.0.1 port 67
May 21 01:04:27 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:28 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:29 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:39 debian-firewall-0 dhclient: DHCPREQUEST on eth2 to 192.168.0.1 port 67
May 21 01:04:41 debian-firewall-0 kernel: grsec: From 192.168.0.10: exec of /bin/cat (cat /var/log/syslog ) by /bin/bash[bash:9628] uid/euid:0/0 gid/egid:0/0, parent /bin/bash[bash:8485] uid/euid:0/0 gid/egid:0/0
May 21 01:04:42 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:43 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1
May 21 01:04:44 debian-firewall-0 kernel: ARP IN=eth1 OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest = ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800, OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP DST=192.168.1.1


--- On Wed, 5/20/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re: (DHCP) Ebtables ruleset isn't working, any ideas?
> To: "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, May 20, 2009, 8:22 PM
> On Wed, 20 May 2009, Miguel
> Ghobangieno wrote:
> 
> > I did log, with tcpdump though
> 
> Makes no use when rules are not working.
> 
> > (ethertype file seems fine, shown below):
> 
> Just for a simple test, I cut&paste one of your rules:
> 
> ebtables -A FORWARD -p IPv4 --ip-sport 67:68 -j ACCEPT
> 
> Why don't you pay attention to the error message(s)
> reported by ebtables?
> 
> > > >       Why don't you
> log the packets??
> > > 
> > > Third times I write: why don't you log the
> packets?
> 
> Fourth times: why don't you log the packets (by
> >>ebtables<<): insert a 
> just logging rule as the first one into the FORWARD chain
> and add logging
> to every of your rules, with meaningful unique log prefixes
> everywhere.
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
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


      

