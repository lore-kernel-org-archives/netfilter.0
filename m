From: =?UTF-8?B?bWF0amHFvg==?= <matjazbercic@lavabit.com>
Subject: Possible bug in iptables : -m --uid-owner not working with ping
Date: Mon, 22 Oct 2012 16:38:35 +0200
Message-ID: <50855A6B.1070000@lavabit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
Is it possible that owner matching does not work correctly ?
I tried blocking internet access to one user, but found out he can stil=
l=20
use ping.
Pleas see below : (I removed some lines from ping output for clarity -=20
also there are no other rules in iptables)

matjaz@laptop:~$ iptables --version
iptables v1.4.16.3
matjaz@laptop:~$ sudo iptables -F -t nat ; sudo iptables -F
matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D46.9 ms
# ok, works
matjaz@laptop:~$ id nonet
uid=3D1002(nonet) gid=3D1003(nonet) groups=3D1003(nonet)
matjaz@laptop:~$ sudo iptables -A OUTPUT -p icmp -m owner --uid-owner=20
1002 -j REJECT
matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D46.7 ms
# not ok, still works
matjaz@laptop:~$ sudo iptables -A OUTPUT -p icmp -j REJECT
matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
ping: sendmsg: Operation not permitted

My machine :
matjaz@laptop:~$ cat /etc/issue
Ubuntu 12.04.1 LTS \n \l
matjaz@laptop:~$ uname -a
Linux laptop 3.2.0-32-generic #51-Ubuntu SMP Wed Sep 26 21:33:09 UTC=20
2012 x86_64 x86_64 x86_64 GNU/Linux

I installed the latest version of iptables (this didn't work even with=20
the ubuntu supplied version) from source and rebooted before testing. I=
=20
didn't uninstall the previous version before installation.

Also : the -match --uid-owner seems to work on other protocols.

Oddly enough, using group id instead seems to work :
matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D47.6 ms
--- 173.194.35.145 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev =3D 46.284/46.994/47.659/0.615 ms
matjaz@laptop:~$ sudo iptables -A OUTPUT -p icmp -m owner --gid-owner=20
1003 -j REJECT
matjaz@laptop:~$ sudo -u nonet ping -c 3 173.194.35.145
PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
 From 192.168.2.151 icmp_seq=3D1 Destination Port Unreachable
--- 173.194.35.145 ping statistics ---
0 packets transmitted, 0 received, +3 errors
matjaz@laptop:~$ ping -c 3 173.194.35.145
PING 173.194.35.145 (173.194.35.145) 56(84) bytes of data.
64 bytes from 173.194.35.145: icmp_req=3D1 ttl=3D51 time=3D47.3 ms
--- 173.194.35.145 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev =3D 46.645/46.933/47.373/0.402 ms

Is this expected behaviour ?
Best regards,
Matja=C5=BE Ber=C4=8Di=C4=8D


