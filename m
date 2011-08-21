From: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 05:51:52 -0300
Message-ID: <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=7evc/LgW+QpM0iptAT+o6h6L8FKozMw4AuMv+EFZYMY=;
        b=NrHvyrjBif8c7vsMEQV2rjzMC83NldKBiT0jjEz9wdr/7zhmv1TOZ5f7nCtXYq3/cm
         49pQG62iN2/EmvuntAMCfjJyIENf5fuFPilIvPb7SzHBNnaLnggAB3Kwn7B/3oYWxWWX
         7J5mxdKKz2+TxiJP46HluLR2Z1Zm8C1qPpAM4=
In-Reply-To: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter <netfilter@vger.kernel.org>

2011/8/20 Vinicius Massuchetto <viniciusmassuchetto@gmail.com>:
> I had this configuration before, and it used to work well, but now I
> got a new server and I can't setup it to share the internet connectio=
n
> from ppp0.
>
> The client connects directly on eth0 through a dhcp server, and it ca=
n
> get an IP just fine. The problem seems only to appear when I set this
> rule:
> `iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE`
>
> Just after that, the client won't be able to receive an IP from the
> server anymore. Here's the configuration files:
>
> The /etc/dhcp/dhcpd.conf file:
> ---
> ddns-update-style none;
> default-lease-time 600;
> max-lease-time 7200;
> log-facility local7;
> subnet 192.168.0.0 netmask 255.255.255.0 {
> =C2=A0 =C2=A0option routers 192.168.0.1;
> =C2=A0 =C2=A0option domain-name "onix";
> =C2=A0 =C2=A0range 192.168.0.2 192.168.0.10;
> =C2=A0 =C2=A0option domain-name-servers 201.10.120.2, 201.10.128.2;
> =C2=A0 =C2=A0option broadcast-address 192.168.0.1;
> =C2=A0 =C2=A0option ip-forwarding on;
> }
> ---
>
> The connection script:
> ---
> #!/bin/bash
>
> /sbin/ifconfig eth0 192.168.0.1 netmask 255.255.255.0 broadcast 192.1=
68.0.1
> /etc/init.d/isc-dhcp-server stop
> /etc/init.d/isc-dhcp-server start
>
> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
> iptables -X
>
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i ppp0 -o eth0 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables -A FORWARD -i ppp0 -o ppp0 -j REJECT
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
> ---
>
> After the problem appears I ran tcpdump on both eth interfaces of
> client and server while the client send DHCPDISCOVER:
>
> Client tcpdump:
> ---
> listening on eth0, link-type EN10MB (Ethernet), capture size 65535 by=
tes
> 17:32:10.848029 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:16.000175 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:30.004579 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:37.005508 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:49.007886 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:56.000168 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> ^C
> 6 packets captured
> 6 packets received by filter
> 0 packets dropped by kernel
> ---
>
> Server tcpdump:
> ---
> listening on eth0, link-type EN10MB (Ethernet), capture size 65535 by=
tes
> 17:32:10.533386 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:10.536878 ARP, Request who-has 192.168.0.2 tell onix.local, len=
gth 28
> 17:32:10.634525 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 255.255.255.255.in-addr.arpa. (46)
> 17:32:10.634596 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 255.255.255.255.in-addr.arpa. (46)
> 17:32:11.000641 IP onix.local.bootps > 192.168.0.2.bootpc: BOOTP/DHCP=
,
> Reply, length 300
> 17:32:11.535919 ARP, Request who-has 192.168.0.2 tell onix.local, len=
gth 28
> 17:32:11.635959 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 255.255.255.255.in-addr.arpa. (46)
> 17:32:11.636049 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 255.255.255.255.in-addr.arpa. (46)
> 17:32:12.535882 ARP, Request who-has 192.168.0.2 tell onix.local, len=
gth 28
> 17:32:13.638404 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 255.255.255.255.in-addr.arpa. (46)
> 17:32:13.638488 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 255.255.255.255.in-addr.arpa. (46)
> 17:32:15.636359 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 0.0.0.0.in-addr.arpa. (38)
> 17:32:15.636444 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 0.0.0.0.in-addr.arpa. (38)
> 17:32:15.685847 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:15.686038 IP onix.local.bootps > 192.168.0.2.bootpc: BOOTP/DHCP=
,
> Reply, length 300
> 17:32:16.637294 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 0.0.0.0.in-addr.arpa. (38)
> 17:32:16.637362 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 0.0.0.0.in-addr.arpa. (38)
> 17:32:18.638762 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 0.0.0.0.in-addr.arpa. (38)
> 17:32:18.638856 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 0.0.0.0.in-addr.arpa. (38)
> 17:32:20.639711 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 2.0.168.192.in-addr.arpa. (42)
> 17:32:20.639797 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 2.0.168.192.in-addr.arpa. (42)
> 17:32:21.641098 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 2.0.168.192.in-addr.arpa. (42)
> 17:32:21.641193 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 2.0.168.192.in-addr.arpa. (42)
> 17:32:23.642208 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 2.0.168.192.in-addr.arpa. (42)
> 17:32:23.642301 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 2.0.168.192.in-addr.arpa. (42)
> 17:32:25.642116 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 1.0.168.192.in-addr.arpa. (42)
> 17:32:25.642198 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 1.0.168.192.in-addr.arpa. (42)
> 17:32:25.642272 IP onix.local.mdns > 224.0.0.251.mdns: 0*- [0q] 1/0/0
> (Cache flush) PTR onix.local. (60)
> 17:32:25.743060 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 251.0.0.224.in-addr.arpa. (42)
> 17:32:25.743136 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 251.0.0.224.in-addr.arpa. (42)
> 17:32:26.743316 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 251.0.0.224.in-addr.arpa. (42)
> 17:32:26.743409 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 251.0.0.224.in-addr.arpa. (42)
> 17:32:28.744853 IP6 fe80::f24d:a2ff:fed9:35c.mdns > ff02::fb.mdns: 0
> PTR (QM)? 251.0.0.224.in-addr.arpa. (42)
> 17:32:28.744955 IP onix.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)?
> 251.0.0.224.in-addr.arpa. (42)
> 17:32:36.692468 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:36.692678 IP onix.local.bootps > 192.168.0.2.bootpc: BOOTP/DHCP=
,
> Reply, length 300
> 17:32:48.695611 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:48.695863 IP onix.local.bootps > 192.168.0.2.bootpc: BOOTP/DHCP=
,
> Reply, length 300
> 17:32:55.688296 IP 0.0.0.0.bootpc > 255.255.255.255.bootps:
> BOOTP/DHCP, Request from 00:16:36:96:2b:15 (oui Unknown), length 300
> 17:32:55.688546 IP onix.local.bootps > 192.168.0.2.bootpc: BOOTP/DHCP=
,
> Reply, length 300
> ^C
> 40 packets captured
> 42 packets received by filter
> 2 packets dropped by kernel
> ---

Client's syslog:

Aug 21 04:52:13 amendoa dhclient: DHCPREQUEST on eth0 to 255.255.255.25=
5 port 67
Aug 21 04:52:20 amendoa dhclient: DHCPREQUEST on eth0 to 255.255.255.25=
5 port 67
Aug 21 04:52:41 amendoa dhclient: DHCPDISCOVER on eth0 to
255.255.255.255 port 67 interval 3
Aug 21 04:52:44 amendoa dhclient: DHCPDISCOVER on eth0 to
255.255.255.255 port 67 interval 7
Aug 21 04:52:51 amendoa dhclient: DHCPDISCOVER on eth0 to
255.255.255.255 port 67 interval 13

Server's syslog:

Aug 21 04:52:13 onix dhcpd: DHCPREQUEST for 192.168.0.2 from
00:16:36:96:2b:15 (amendoa) via eth0
Aug 21 04:52:13 onix dhcpd: DHCPACK on 192.168.0.2 to
00:16:36:96:2b:15 (amendoa) via eth0
Aug 21 04:52:20 onix dhcpd: DHCPREQUEST for 192.168.0.2 from
00:16:36:96:2b:15 (amendoa) via eth0
Aug 21 04:52:20 onix dhcpd: DHCPACK on 192.168.0.2 to
00:16:36:96:2b:15 (amendoa) via eth0
Aug 21 04:52:41 onix dhcpd: DHCPDISCOVER from 00:16:36:96:2b:15
(amendoa) via eth0
Aug 21 04:52:41 onix dhcpd: DHCPOFFER on 192.168.0.2 to
00:16:36:96:2b:15 (amendoa) via eth0
Aug 21 04:52:44 onix dhcpd: DHCPDISCOVER from 00:16:36:96:2b:15
(amendoa) via eth0
Aug 21 04:52:44 onix dhcpd: DHCPOFFER on 192.168.0.2 to
00:16:36:96:2b:15 (amendoa) via eth0
Aug 21 04:52:51 onix dhcpd: DHCPDISCOVER from 00:16:36:96:2b:15
(amendoa) via eth0
Aug 21 04:52:51 onix dhcpd: DHCPOFFER on 192.168.0.2 to
00:16:36:96:2b:15 (amendoa) via eth0

Thanks.
--=20
Vinicius Massuchetto
