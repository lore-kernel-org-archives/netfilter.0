From: Ignacio Freyre <nachofw@hotmail.com>
Subject: limit usage
Date: Tue, 28 Jun 2022 11:26:17 +0000
Message-ID: <FRBP284MB01856E4314EE564A2124614BB5B89@FRBP284MB0185.BRAP284.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsGW2B8eg8pCiLI9nd5TXAHQ36uggujCg8NCdMNsWWo=;
 b=VIFVsd9vMdeR87MoMosChLBH0qtv4c4ZnAYQQHC7VcMFOT2ikQhxQ6m4FGgmPM/L/slC7A5cbxbYeILq3Q6c5IJ8lesyGlLbhCXPHFWDH7k7n85pvP4oJXCBVdsetUwtERkQ35ZAl/Cd5r45E4C0W1zByCpSHAkuApWLqcfqOcV5g18abHaykF5JmqzYYLnPAr7vAlIBcd9pbqkw3Cx9iKM/twdOMNeV7zLqW7gupHIkyypijgrb35Zc0PIPmY/FRFfYykZW0YGKkBVTOsEFPygPU5zl8KmOt8BKHGFABE4GPlrmAQGMooazse9URDW2drM2VruuIMTuwXMwr0HTBA==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi guys, i'm hoping you clarify nftables usage of the kernels conntrack.=0A=
=0A=
I've been having some ddos attacks on my dns servers so I used the notrack =
flag to avoid filling the conntrack table like so:=0A=
=0A=
> add table ip raw=0A=
> add chain ip raw PREROUTING { type filter hook prerouting priority -300; =
policy accept; }=0A=
> add rule ip raw PREROUTING iif eno1 ip protocol {tcp, udp} th dport 53 co=
unter notrack=0A=
=0A=
But then i though of also rate limiting by ipv4 source address, i was wande=
ring if you could clarify in the case of the usage of the "limit" functiona=
lity if nftables is using the conntrack table or its own memory for the fol=
lowing config for the purpose of tracking the amount of packets that alread=
y arrived on the interface by source IP.=0A=
=0A=
> add set my_filter_table dns_meter { type ipv4_addr . inet_service\; flags=
 timeout, dynamic \;}=0A=
> add rule my_filter_table my_input_chain tcp dport 53 ct state new add u/d=
ns_meter { ip saddr . tcp dport timeout 60s limit rate 20/second } accept=
=0A=
