From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: BUG: soft lockup on kernel 5.19.9 when attempting FTP connections
Date: Tue, 20 Sep 2022 11:12:56 -0300
Message-ID: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
dkim-signature: v=1; c=relaxed; h=message-id:date:mime-version:to:from:subject:content-type:content-transfer-encoding;
 d=riosoft.com.br; s=default; a=rsa-sha256;
 bh=nQ/IuFpNGADLj54IvezZYnQPybfCzBIuMVl0WcaLO9I=;
 b=gJikpp7KfPUYF8LrZiee9065BeiHtkTAdaqSMH0neoBTxKg3DA+yoxKBXa8Igsvft
 i0Gi4dMfem76qwXwUNPbFgcF2jhmamtXBQzPw5bCiXOUeAr1mnzWAzjWUzR9/McxKWS
 4X5k8W1VTpDYr4K15ocavqVsYJgrcXJZRkfMdp4=;
Content-Language: pt-BR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
While testing my iptables ruleset on a Fedora 36, I've encountered an=20
unexpected behaviour regarding FTP connection forwarding.
I've reduced the ruleset to look like below.
I've tried to "modprobe nf_conntrack_ftp" alone, but external clients=20
still won't get data connections.
Then I "modprobe nf_nat_ftp". It loads normally but after the first=20
attempt to establish an FTP connection, the system freezes and sometimes=20
prints the following message:

Message from syslogd@fw1-test at Sep 20 09:33:28 ...
 =C2=A0kernel:watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [swapper/1:=
0]

This problem happens on the newest Fedora 36 stock kernel as of=20
20/09/2022, version 5.19.9-200.fc36.x86_64 (and at least on the previous=20
5.19.8-200.fc36.x86_64), but (apparently) works normally on version=20
5.17.5-300.fc36.x86_64, which was the default kernel from ISO install.

Is it a bug, maybe?
Just wanted to report this, maybe someone on this list can do something=20
about it.


### My eclipsed ruleset in which this problem happens
# eth0: LAN
# eth1: Public
# 192.168.22.5: internal FTP server

iptables -P INPUT DROP
iptables -P FORWARD DROP

echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper

modprobe nf_conntrack_ftp
modprobe nf_nat_ftp

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -s 192.168.22.0/24 -j ACCEPT

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -s 192.168.22.0/24 -j ACCEPT
iptables -A FORWARD -i eth1 -d 192.168.22.5 -p tcp --dport 21 -j ACCEPT

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 21 -j DNAT=20
--to-destination 192.168.22.5
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

