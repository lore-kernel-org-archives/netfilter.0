From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: BUG: soft lockup on kernel 5.19.9 when attempting FTP connections
Date: Tue, 20 Sep 2022 17:48:13 +0200
Message-ID: <1c5e3db2-6151-fde8-881f-99eef63df02e@thelounge.net>
References: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ah that was the reason why after update our Fedora 36 based firewall=20
from 5.18.8 to 5.19.7 and everything looked fine from 1:00 AM to 4:40 AM=20
and started to crash at 5:00 AM several times until VMware HA gave up to=20
reset the VM

i didn't wish to see my boss the first time since 2019 in front of my=20
apartment because of this and Google broke Anrdoid's "repeated callers=20
are allowed" to ring...

----------------

and no i didn't have anything useful in the serial console file on the=20
host except tons of "CPU#1 stuck for MANYs!"

obiosuly the webcams of some customers are starting to upload images at=20
that time every few minutes.....

Am 20.09.22 um 16:12 schrieb Bruno de Paula Larini:
> While testing my iptables ruleset on a Fedora 36, I've encountered an=20
> unexpected behaviour regarding FTP connection forwarding.
> I've reduced the ruleset to look like below.
> I've tried to "modprobe nf_conntrack_ftp" alone, but external clients=20
> still won't get data connections.
> Then I "modprobe nf_nat_ftp". It loads normally but after the first=20
> attempt to establish an FTP connection, the system freezes and sometimes =

> prints the following message:
>=20
> Message from syslogd@fw1-test at Sep 20 09:33:28 ...
>  =C2=A0kernel:watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [swapper/=
1:0]
>=20
> This problem happens on the newest Fedora 36 stock kernel as of=20
> 20/09/2022, version 5.19.9-200.fc36.x86_64 (and at least on the previous =

> 5.19.8-200.fc36.x86_64), but (apparently) works normally on version=20
> 5.17.5-300.fc36.x86_64, which was the default kernel from ISO install.
>=20
> Is it a bug, maybe?
> Just wanted to report this, maybe someone on this list can do something=20
> about it.
>=20
>=20
> ### My eclipsed ruleset in which this problem happens
> # eth0: LAN
> # eth1: Public
> # 192.168.22.5: internal FTP server
>=20
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper
>=20
> modprobe nf_conntrack_ftp
> modprobe nf_nat_ftp
>=20
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -s 192.168.22.0/24 -j ACCEPT
>=20
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -s 192.168.22.0/24 -j ACCEPT
> iptables -A FORWARD -i eth1 -d 192.168.22.5 -p tcp --dport 21 -j ACCEPT
>=20
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 21 -j DNAT=20
> --to-destination 192.168.22.5
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
