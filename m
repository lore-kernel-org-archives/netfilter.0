From: Daniel Smertnig <daniel.smertnig@gmail.com>
Subject: Remapping networks
Date: Wed, 05 Sep 2007 20:04:16 +0200
Message-ID: <1189015456.6943.0.camel@daniel-mobile.smertnig.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	b=YkcVL0efB6K0WPw7sG0vhg/vcH/VIwLpxiLytVsTkpYrO1cxDw0Tuxed31Ipt72Fek9B5yFabggmSqOh3tKjuw73cP1cdjASlkBCy4IhaZNTdkEpETE6Sid+viHxK0xoQinzsB/pqpt0XT7umDiXK6rD2jzpI8JN9703aGpZkg4=
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

Hi,

I am currently setting up a server which connects an internal LAN to
multiple other LANs via VPNs (i.e. my server acts as VPN client,
connecting to multiple VPNs at the same time). Since the addressing of
these LANs is not under my control (including the possibility of
collisions) I would like to remap them to another address space.

The VPNs are PPTP VPNs, so each connected VPN corresponds to one pppX
interface, while my internal LAN is on eth0. Unfortunately using the
SNAT, DNAT or NETMAP targets only allows me to rewrite the destination
address in the PREROUTING chain (i.e. when packets arrive on eth0) and
the source address on the POSTROUTING chain (i.e. when packets leave on
pppX). To avoid collisions on the server itself however I would seem to
need exactly the opposite -- rewriting the destination address from my
"fake address" to the actual address of the remote LAN in POSTROUTING
(when the packet goes out on pppX) and rewriting the source addresses
from the actual addresses of the remote LAN to my "fake" addresses of
incoming packets on pppX in PREROUTING, before my server sees them. 

I.e. what I would like is a 1:1 mapping of eg. 10.30.1.0/24 ("fake") to
192.168.0.0/24 (remote LAN), but to have this remapping happen in such a
way that my server sees the 10.30.1.0/24 network for routing so as to
avoid ambiguities on the server itself.

Is there a way to accomplish this with netfilter/iptables? Or is there a
better way to handle such a situation?

bye,
Daniel


