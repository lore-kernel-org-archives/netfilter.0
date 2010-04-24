From: Jeff Jensen <jjensen@unyalli.com>
Subject: Help with ftp helper please
Date: Sat, 24 Apr 2010 10:48:56 -0600
Message-ID: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello netfilter people,

=C2=A0=C2=A0 I have an email conversation from Jan 9, 2010 between
mart.frauenlob@chello.at and margoandtodd@gmail.com with the subject
"passive mode ftp high ports driving me nuts". I have studied this
intensely and found out about this "helper" thing.

On a test ubuntu 9.04 box I have these rules and nothing else plus I
have added nf_conntrack_ipv4 and nf_conntrack_ftp to /etc/modules.

# Local host
iptables -A INPUT=C2=A0 -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
# DNS
iptables -A OUTPUT -o eth0 -p udp -m state --state NEW,ESTABLISHED
--dport 53 -j ACCEPT
iptables -A INPUT=C2=A0 -i eth0 -p udp -m state --state ESTABLISHED --s=
port
53 -j ACCEPT
# FTP Helper Chain
iptables -N FTPChn
iptables -A FTPChn -j LOG --log-prefix "FTP "
iptables -A FTPChn -j ACCEPT
# FTP
iptables -A OUTPUT -o eth0 -m helper --helper ftp -j FTPChn
iptables -A INPUT=C2=A0 -i eth0 -m helper --helper ftp -j FTPChn
iptables -A OUTPUT -o eth0 -p tcp -m state --state NEW --dport 21 -j FT=
PChn
# Log All Else
iptables -A INPUT=C2=A0=C2=A0 -j LOG --log-prefix "Filter Input=C2=A0=C2=
=A0 "
iptables -A OUTPUT=C2=A0 -j LOG --log-prefix "Filter Output=C2=A0 "
iptables -A FORWARD -j LOG --log-prefix "Filter Forward "
# And Reject
iptables -A INPUT=C2=A0=C2=A0 -j REJECT --reject-with icmp-host-prohibi=
ted
iptables -A OUTPUT=C2=A0 -j REJECT --reject-with icmp-host-prohibited
iptables -A FORWARD -j REJECT --reject-with icmp-host-prohibited

when I ftp to mirror.anl.gov this shows up in the log (trimmed for easy=
 reading)

=46TP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 IN=3D OUT=3Deth0 SRC=3D192.168.128.20 DST=3D146.137.96.15
PROTO=3DTCP SPT=3D36826 DPT=3D21 WINDOW=3D5840 SYN URGP=3D0
=46ilter Input=C2=A0=C2=A0 IN=3Deth0 OUT=3D SRC=3D146.137.96.15 DST=3D1=
92.168.128.20
PROTO=3DTCP SPT=3D21 DPT=3D36826 WINDOW=3D5792 ACK SYN URGP=3D0
=46ilter Output=C2=A0 IN=3D OUT=3Deth0 SRC=3D192.168.128.20 DST=3D146.1=
37.96.15
PROTO=3DTCP SPT=3D36826 DPT=3D21 WINDOW=3D5840 SYN URGP=3D0

Any idea what I'm missing?

Thank you

Jeff
