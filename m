From: "Yannis Aribaud" <bugs@d6bell.net>
Subject: SYNPROXY and ICMP frag needed
Date: Thu, 22 Dec 2016 16:56:23 +0000
Message-ID: <e0247b470a7a8aca0d73863287f9de93@rcube.hebserv.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d6bell.net; s=default; t=1482425784; bh=uO+OW3hlnSaH6jzLXuGKGGHFw10OYFHldGOFm0ZSKok=; h=Mime-Version:Date:Content-Type:Content-Transfer-Encoding:Message-ID:From:Subject:To; b=HfrCLMcm/4H5x2HPx5pSLZh4wWKaX1nFqu/OuK+eLgLtf77RepXdlvjFNwr9PHwV6JX5DPAtrJxF3zEuLBgtwWaYGKjj92LtEGf3js1z5WTZzST5B1kXwaOD+0OfAJStg+LDjKuUhkSNWBnLd0HAGZVNNlv3E2f7qS/Q3fz5x418eVy7LfvkEPV8yKYukq+U0MJklBvVXNDQOe+hKdX9V06xgWiBmXWivycP0YvaFfcFuz41HK6ortX6beKUlgy+lxlK/pfM9p/Q2TAETyWX+MkrZpH+8O5mQWwGrudGkg04rNCuRt+II3rs8NptXGQz08nKV04UsWaHKAdk7rzX8Jcyw6qcIVOAhne+UQrHkcxqh5pV1cljf5L0OQLxuYLKLjpwqiZwqp8cKV1nkN+4gqHMv2ahCNjZaiKKXA4/yiN7meKL0LgU5/iR4carz6hKBu9gtrDttiy3FO1msmv4HED2N0+Nf4KLF6X3WkI8PIPNcu2AsGCYXN3DWn3aTKvG+Dg68uxaNI4mBekF/5exAgDQ5Z4NpJ+Y5S5pX2IztNCqkC6Et2B9EJpta
 GLg3OyU/CWBYwDEMwElK6ntxGQ2keUTTW9C9nB28N1y5qaGcvNwquGrpBFM6r67FUxACPuffBvfZYgi0KMq1PdsUcqXiDtm5Vc 
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,=0A=0AI hope that I do ask on the right list.=0AI'am using SYNPROXY ta=
rget in production and it's really great.=0A=0ABut I'm unable to make Lin=
ux Kernel passive PMTU discovery working when using the SYNPROXY target.=
=0AI suspect that it comes from the fact that the connctrack entry for th=
e established connexion do=0Anot match with the ICMP fragmentation needed=
 packet the server is receiving.=0A=0AThe setup is quite simple.=0A=0Aipt=
ables -t raw -A PREROUTING -i eth0 -p tcp --dport 80 --syn -j NOTRACK=0Ai=
ptables -A INPUT -p icmp -j ACCEPT=0Aiptables -A INPUT -i eth0 -p tcp --d=
port 80 -m state UNTRACKED,INVALID \=0A  -j SYNPROXY --sack-perm --timest=
amp --mss 1460 --wscale 7 --ecn=0A=0Aecho 0 > /proc/sys/net/netfilter/nf_=
conntrack_tcp_loose=0A=0AThe server using SYNPROXY is hosting a Haproxy w=
ith an MTU 1500 and a SYNPROXY MSS set to 1460. The=0Aclient has an small=
er MTU on his path (1400).=0AThe TCP handshake works correctly, the clien=
t send his request (GET /) then the server answer with=0Aa too big packet=
 and receives ICMP fragmentation needed packets which are accepted by ipt=
ables=0Arules, but the server keep retransmit too big packets and connect=
ion never works.=0A=0AI tried several kernel version (as now using 4.9) a=
nd as soon as I remove iptables SYNPROXY related=0Arules (SYNPROXY and TC=
P no track) the passive PMTU discovery works again.=0AHave you ever faced=
 this issue is it a known problem when using SYNPROXY or am I facing some=
thing=0Aelse ?=0A=0AThank you for your time.=0A=0ABest Regards,=0A-- =0AY=
annis Aribaud
