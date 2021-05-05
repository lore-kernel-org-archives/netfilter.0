From: =?UTF-8?Q?Przemys=c5=82aw_Kowalczyk?= <pkowalczyk@efigence.com>
Subject: nf does not DNAT, but also does not not-NAT
Date: Wed, 5 May 2021 15:43:38 +0200
Message-ID: <91e09af5-84f8-8d6d-7b03-a74f6a355cf6@efigence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Efigence.onmicrosoft.com; s=selector1-Efigence-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuxaA8Qf6ACELg4Gccug38rLO+O03bG7vp9sJPCJRPU=;
 b=n65oaFVkBYPdz0m8+MgdRKdaL6UYOdP4C1CDPYU038opRjEpZpL0oCzrBnNfqAmQxI3eDz+ieGhN1Z3FAiVumoMro1wKmGirA1EdssLrUjIOfvwA6w2FPXUS7xUni5QTfolopEqYkjqLmtFo4QYn5BA8Q8FHCvhDGBJiBIDZWqM=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I have a VPN server (StrongSwan IPSEC, OpenVPN), where multiple peers
have different network address translations (SNAT, DNAT, SNAT + DNAT)
configured and it worked until recently, when after small
reconfiguration one of the peers doesn't work properly.
SNAT works but DNAT doesn't in general. For further analysis I chose a
particular host pair. I can connect to 172.25.6.21 and the source
address is rewritten to 100.64.104.5, but that host cannot connect to
100.64.104.129, which should DNAT to 10.0.10.12. When I tcpdump the
traffic, I can only see 172.25.6.16/28 -> 100.64.104.129 [S], where
normally it should be followed by 172.25.6.16/28 -> 10.0.10.12 [S].
xtables-monitor tracing shows that this packet matches the DNAT rule,
but is discarded by the end of PREROUTING chain, having in fact its
destination address untouched.
At first, I wanted to check whether this packet is actually DNATted or
not and came up with the following ruleset:

=A0pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=A0 so=
urce=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
destination
=A0=A0 81=A0 4124 DNAT=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 *=A0=A0=A0=A0=A0 *=A0=
=A0=A0=A0=A0=A0 172.25.6.16/28=A0=A0=A0=A0=A0=A0
100.64.104.129=A0=A0=A0=A0=A0=A0 to:10.0.10.12
=A0=A0=A0 0=A0=A0=A0=A0 0 RETURN=A0=A0=A0=A0 all=A0 --=A0 *=A0=A0=A0=A0=A0=
=20
*=A0=A0=A0=A0=A0=A0 172.25.6.16/28=A0=A0=A0=A0=A0=A0
10.0.10.12
=A0=A0=A0 0=A0=A0=A0=A0 0 RETURN=A0=A0=A0=A0 all=A0 --=A0 *=A0=A0=A0=A0=A0=
=20
*=A0=A0=A0=A0=A0=A0 172.25.6.16/28=A0=A0=A0=A0=A0=A0
100.64.104.129

And this got me to the conclusion written in the subject. Notice the
packet counters - packet gets allegedly DNATted, but later matches
neither original nor translated destination.
What's important - there is one UDP service on my side, for which DNAT
works (!) until the remote application using it gets restarted - then it
doesn't (!!!).

What I've tried: kernel update, reboot, rephrasing the rules to match
different IPs, ports - to no avail.

AFAIK other peers that we DNAT have no problems.

# uname -a
Linux hq-sitevpn 4.19.0-16-amd64 #1 SMP Debian 4.19.181-1 (2021-03-19)
x86_64 GNU/Linux

# iptables -V
iptables v1.8.2 (nf_tables)

strongswan: 5.7.2-1

--
Przemyslaw Kowalczyk

