From: Mike Kazantsev <mk.fraggod@gmail.com>
Subject: IPv6 forwarding to TAP-interface with ip6tables fails
Date: Sat, 19 Dec 2009 16:20:47 +0500
Message-ID: <20091219162047.04be7ac3@coercion>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/ZDwwwn0XQNOcCoabZC47l77"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:x-mailer:mime-version:content-type;
        bh=9eJXu9uYuajtul2KZQgz4+wzzCZzkngbgoPFJpFq20s=;
        b=YPNXyNcl1nyD1H0ZNvXWcKiEWS2IBu7U+KeBw0glyknVp3Z+xh5T9fuGngVb9Sw1iM
         tXRxObQzV7j2hFawbIbRZHXpYwdYEQxdeNVWrkJ0YUyP/z63+sCtNW0ua/c/Zi8NcPuK
         T9lIgEFGaJ7lMzu6W6aPUNDvxcaLSP+KAvR0Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/ZDwwwn0XQNOcCoabZC47l77
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello, list.


I wonder if the following problem is a bug in netfilter or I'm just
doing something wrong, but it wasn't always like that.
Problem started probably with some kernel update on router machine,
since I can't trace any network layout updates since the point where it
still worked, and complete downgrade is quite a bad solution.


What I'm trying to do is to connect with ssh and/or ping6 from
2001:470:1f0b:11de::13 to 2001:470:1f0b:11de::21.
And it works at first (and worked fine before), but stops after some
time, which doesn't seem constant or relative to amount of data being
forwarded.

"tcpdump -i lan" shows a lot of tcp retransmission packets or icmp6 (in
case of ping6), but "tcpdump -i vde" shows none of them (while showing
all of them while the connection is still working).

I've tried setting -j LOG to FORWARD chain of ip6tables and it always
(both while the connection works and not) shows lines like this:
  Dec 19 14:09:48 kern.warn<4> kernel[-]@damnation: IN=3Dlan OUT=3Dvde
    SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
    DST=3D2001:0470:1f0b:11de:0000:0000:0000:0021
    LEN=3D104 TC=3D0 HOPLIMIT=3D63 FLOWLBL=3D0 PROTO=3DICMPv6
    TYPE=3D128 CODE=3D0 ID=3D29524 SEQ=3D8=20

So, I assume the packet is lost somewhere in netfilter, but I've no
idea how to tell why it's getting discarded like that.

Strangely enough (for me), when I type "ping6 2001:0470:1f0b:11de::21"
on router machine it gives "Destination unreachable: Address
unreachable" for the first packet and then it works for the rest of
them from both router and remote machine in "lan" network (whole
forwarding thing starts working).
When I stop this ping, situation repeats after some time.

IPv4 forwarding works fine over the same link, but it's NAT there.


Note that aforementioned "vde" is a tun/tap interface of Virtual
Distributed Ethernet link, but tcpdump should show the packet on tap
interface (vde) regardless of other software, monitoring it, so it's
not a VDE-related bug, right?
That's the first question that's bothering me.

It worked a few months ago but I haven't used it actively since then,
and now it doesn't. Same IPs, but different software versions (see below).

Is something wrong with the setup?
Are there any settings that can induce aforementioned behavior I should
check, apart from the ones, included in this mail?

And if not...
Is there any way to debug the problem futher, apart of inserting
(enabling) debug code in the kernel?
Does it look like a bug in netfilter forwarding, should I post it to
bugzilla?


Thanks in advance for any answers / suggestions.


ip addr:
  2: lan: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen=
 1000
      link/ether 00:22:15:3a:ef:7d brd ff:ff:ff:ff:ff:ff
      inet 192.168.0.10/29 scope global lan
      inet6 2001:470:1f0b:11de::10/125 scope global=20
         valid_lft forever preferred_lft forever
      inet6 2001:470:1f0b:11de::1/125 scope global=20
         valid_lft forever preferred_lft forever
      inet6 fe80::222:15ff:fe3a:ef7d/64 scope link=20
         valid_lft forever preferred_lft forever
  7: vde: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state=
 UNKNOWN qlen 500
      link/ether b2:f5:e7:68:fd:9e brd ff:ff:ff:ff:ff:ff
      inet 192.168.0.20/28 scope global vde
      inet6 2001:470:1f0b:11de::20/125 scope global=20
         valid_lft forever preferred_lft forever

ip -6 route:
  2001:470:1f0b:11de::/125 dev lan  proto kernel  metric 256  mtu 1500 advm=
ss 1440 hoplimit 4294967295
  2001:470:1f0b:11de::10/125 dev lan  proto kernel  metric 256  mtu 1500 ad=
vmss 1440 hoplimit 4294967295
  2001:470:1f0b:11de::20/125 dev vde  proto kernel  metric 256  mtu 1500 ad=
vmss 1440 hoplimit 4294967295
  fe80::/64 dev lan  proto kernel  metric 256  mtu 1500 advmss 1440 hoplimi=
t 4294967295
  fe80::/64 dev vde  proto kernel  metric 256  mtu 1500 advmss 1440 hoplimi=
t 4294967295

ip6tables has following rules (at the start of FORWARD chain):
  -I FORWARD -i vde -j ACCEPT
  -I FORWARD -i lan -j ACCEPT

Software:
  Linux damnation 2.6.32-gentoo-fg.mf_master #1 SMP Sun Dec 13 22:35:05
    YEKT 2009 x86_64 Intel(R) Xeon(R) CPU L5420 @ 2.50GHz GenuineIntel
    GNU/Linux (happened with .31 as well, will try official .32.2 today)
  iptables-1.4.5
  vde-2.2.3 (shouldn't be relevant?)

IPv6 forwarding is enabled in sysctl.


--=20
Mike Kazantsev // fraggod.net

--Sig_/ZDwwwn0XQNOcCoabZC47l77
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.13 (GNU/Linux)

iEYEARECAAYFAksstxoACgkQASbOZpzyXnHApACaA+mvyy7+o/W3+IxMKqDpHnas
zaIAoMyQWE50r/Ca1prJ4M/UI22KxVaC
=vHJ+
-----END PGP SIGNATURE-----

--Sig_/ZDwwwn0XQNOcCoabZC47l77--
