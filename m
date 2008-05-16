From: =?ISO-8859-2?Q?Daniel_Dvo=F8=E1k?= <dandee@hellteam.net>
Subject: logdrop rule does not work any more
Date: Fri, 16 May 2008 17:40:25 +0200
Message-ID: <482DAAE9.80708@hellteam.net>
Reply-To: dandee@hellteam.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
=20
I haven=B4t found any hint about my problem so I would like to ask abou=
t=20
logdrop rule.
=20
I had iptables 1.3.6 from Debian Etch distro and I use logdrop rule lik=
e=20
these rules:
=20
ipt=3D"/sbin/iptables"
=20
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ipt_MASQUERADE
modprobe ipt_state
=20
$ipt -P INPUT ACCEPT
$ipt -P OUTPUT ACCEPT
$ipt -P FORWARD ACCEPT
$ipt -P logdrop ACCEPT
=20
$ipt -F INPUT
$ipt -F OUTPUT
$ipt -F -t nat
$ipt -F -t mangle
$ipt -F logdrop
=20
$ipt -X logdrop
$ipt -N logdrop
$ipt -A logdrop -j LOG --log-prefix "logdrop"
$ipt -A logdrop -j DROP
=2E..
$ipt -t mangle -A POSTROUTING -p tcp --dport 25 -j logdrop ... for exam=
ple
=20
It worked fain until I had to compile new iptables version 1.4.0 and my=
=20
problem has appeared every time when I start my firewall script.
=20
The error message is here:
=20
iptables: Bad built-in chain name
iptables v1.4.0: Couldn't load target=20
`logdrop':/usr/local/lib/iptables/libipt_logdrop.so: cannot open shared=
=20
object file: No such file or directory
=20
Try `iptables -h' or 'iptables --help' for more information.
I do not know why during the compilation of new iptables, there is not=20
libipt_logdrop.so module while in version 1.3.6 there had to be in=20
directory, because no errors ever appeared.
=20
In changelog from 1.3.6 to 1.4.0, there is no information about=20
cancelling logdrop support.
=20
So where is the problem ?
What do I do in wrong way ?
=20
Thank you.
=20
Dan
=20
P.S.: I am not subscribed in mailling list, mail me directly please.
