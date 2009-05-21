From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Re:(ebtables log) (DHCP) Ebtables ruleset isn't working, any ideas?
Date: Thu, 21 May 2009 08:46:16 -0700 (PDT)
Message-ID: <408810.56442.qm@web44812.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242920776; bh=nIQHxtsBjg7dTNQY91TPr6wKiBqn1CqGjisUF7Ac6rM=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=flLxFBP7cIGKOOwWw9MuSy6d/MluZVxOKMI5o5cvHxMTeFipL8QSilFiGjirIMuGWvOFZCCZ/pOke+p9/c3NqH5VIKo+eCzbS1Mj0BgyQozs2g+qK4fzADnwrWVqckqVV8eWgshXtNNYHmWaL39/mFSxXId5BQwDI3dPlfIKSJE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


Eth2 is the management interface. The box should be sending whatever comes in via eth1 to eth2.

--- On Thu, 5/21/09, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:

> From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> Subject: Re:(ebtables log) (DHCP) Ebtables ruleset isn't working, any ideas?
> To: "Miguel Ghobangieno" <mikeeusa@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Thursday, May 21, 2009, 10:47 AM
> On Wed, 20 May 2009, Miguel
> Ghobangieno wrote:
> 
> > /usr/sbin/brctl addbr br0
> > /usr/sbin/brctl addif br0 eth0
> > /usr/sbin/brctl addif br0 eth1
> > /sbin/ip link set br0 up
> > /sbin/ip link set eth0 up # don't ask me why
> > /sbin/ip link set eth1 up # don't ask me why
> > #/sbin/ip addr add 192.168.0.6 brd + dev br0
> > #/sbin/route add default gw 192.168.0.1 dev br0 ##Only
> needed if eth2 hasn't allready set default gateway
> > 
> > # ebtables...
> > # example rule: block all ICMP
> > ebtables -F FORWARD
> > ebtables -P FORWARD DROP
> > ebtables -A FORWARD -p ip --log --log-ip --log-arp
> --log-prefix MISC
> > ebtables -A FORWARD -p ip --ip-proto icmp -j DROP
> --log --log-ip --log-arp --log-prefix ICMP ## block all
> ICMP
> > 
> > ebtables -A FORWARD -p 0x800 --ip-proto udp --ip-sport
> 67:68 -j ACCEPT --log --log-ip --log-arp --log-prefix a67
> > ebtables -A FORWARD -p 0x800 --ip-proto udp --ip-dport
> 67:68 -j ACCEPT --log --log-ip --log-arp --log-prefix b67
> [...]
> 
> > May 21 01:03:46 debian-firewall-0 kernel: MISC IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0800 IP SRC=0.0.0.0 IP
> DST=255.255.255.255, IP tos=0x10, IP proto=17 SPT=68 DPT=67
> 
> Here comes a DHCP request, prefixed as "MISC".
> 
> > May 21 01:03:46 debian-firewall-0 kernel: a67 IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0800 IP SRC=0.0.0.0 IP
> DST=255.255.255.255, IP tos=0x10, IP proto=17 SPT=68 DPT=67
> 
> The DHCP request is allowed through your bridging firewall,
> via eth0. 
> According to your logs, never answered by a DHCP server.
> 
> > May 21 01:03:47 debian-firewall-0 kernel: ARP IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800,
> OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP
> SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP
> DST=167.206.3.203
> > May 21 01:03:48 debian-firewall-0 kernel: ARP IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800,
> OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP
> SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP
> DST=167.206.3.203
> > May 21 01:03:49 debian-firewall-0 kernel: ARP IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800,
> OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP
> SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP
> DST=167.206.3.203
> > May 21 01:03:51 debian-firewall-0 kernel: ARP IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800,
> OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP
> SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP
> DST=192.168.1.1
> > May 21 01:03:52 debian-firewall-0 kernel: ARP IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800,
> OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP
> SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP
> DST=192.168.1.1
> > May 21 01:03:53 debian-firewall-0 kernel: ARP IN=eth1
> OUT=eth0 MAC source = 00:08:0d:54:13:c9 MAC dest =
> ff:ff:ff:ff:ff:ff proto = 0x0806 ARP HTYPE=1, PTYPE=0x0800,
> OPCODE=1 ARP MAC SRC=00:08:0d:54:13:c9  ARP IP
> SRC=169.254.5.88 ARP MAC DST=00:00:00:00:00:00  ARP IP
> DST=192.168.1.1
> 
> Unanswered ARP requests.
> 
> In your description, you network behind br0 (eth0, eth1) is
> 
> 192.168.0.0(/24). So where come IP addresses 169.254.5.88
> and 
> 167.206.3.203 in an ARP request from this network?
> 
> > May 21 01:03:57 debian-firewall-0 dhclient:
> DHCPREQUEST on eth2 to 192.168.0.1 port 67
> 
> According to your settings above the firewall has got the
> interfaces eth0, 
> eth1 and br0 activated. From where comes the interface eth2
> then? Why does 
> the dhcp client on the firewall send the dhcp request via
> eth2 to 
> 192.168.0.1, when - again, according to your own drawing -
> 192.168.0.1 is 
> behind eth0.
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
> 


      

