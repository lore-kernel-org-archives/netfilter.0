From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: IPtables and bridge interface
Date: Wed, 18 Oct 2006 08:13:10 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE1258B9@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
  I'm having a problem with my new gateway set-up and I'm not sure where
to start with the troubleshooting. I set up a gateway with two NICs in
bridge mode to allow for my public IP addresses to pass straight through
and then set up two virtual addresses on the bridge interface to NAT the
remainder of the machines on my network, but still keep then in
differing collision domains. The problem that I see is that Internet
connectivity is sporadic at best. The connection will stay up for a
minute or so, then go down for 5-60 seconds and then come back up. The
odd thing is that machines with public addresses never see this problem,
only the ones behind the NAT. I am running Debian Etch with kernel

Linux debian 2.6.16-2-686 #1 Fri Aug 18 19:01:49 UTC 2006 i686 GNU/Linux

I've also tried the 2.6.17-2-686 kernel with the same results. My
iptables script is pretty bare:

#! /bin/bash

modprobe ip_conntrack_ftp iptables_nat iptables_mangle ip_nat_ftp
echo "1" > /proc/sys/net/ipv4/ip_forward

iptables -t nat -F

iptables --out-interface br0 -t nat -A POSTROUTING -s 192.168.1.0/22 -j
SNAT --to EXTERNALIP

I had two iptables rules before, one for each subnet, but combined them
into one rule to see if that would help, but no luck. Can anyone point
me to how to get debug information from iptables or what I might try to
remedy this problem?

Thank you,
Robert LeBlanc

