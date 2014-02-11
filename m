From: Simon Schlumpf <sim@netmess.org>
Subject: Unknown symbol inet_frag_maybe_warn_overflow
Date: Tue, 11 Feb 2014 10:29:53 +0100
Message-ID: <52F9ED91.9030404@netmess.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter list <netfilter@vger.kernel.org>

Hey List

I have a problem on my digitalocean VPS which is virtualized with KVM I 
think.

When I try to add an ip6tables rule, I see this:

sudo ip6tables -A INPUT -p tcp --destination-port 22 --match state 
--state NEW -j ACCEPT
ip6tables: Protocol wrong type for socket.

It works without the --match..

My Linux version is:
Linux www.host.name 3.2.0-4-amd64 #1 SMP Debian 3.2.41-2+deb7u2 x86_64 
GNU/Linux

On boot, the kernel says something I'm not able to understand:

[    5.629314] ip6_tables: (C) 2000-2006 Netfilter Core Team
[    5.664445] nf_defrag_ipv6: Unknown symbol 
inet_frag_maybe_warn_overflow (err 0)
[    5.665391] cannot load conntrack support for proto=10
[   14.256084] eth0: no IPv6 routers present

If I try to ping6 google, I see this:

$ ping6 www.google.com
PING www.google.com(vc-in-x68.1e100.net) 56 data bytes
 From xxx.tunnel.tserv4.nyc4.ipv6.he.net icmp_seq=1 Destination 
unreachable: Address unreachable

even if all policies are on ACCEPT and no rules are present at the moment.

The IPv6 connectivity is made over tunnelbroker.net which works fine on 
an other DO VPS.

Can anyone point me to what I'm doing wrong here?

Thanks, Simon
