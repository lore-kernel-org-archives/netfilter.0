From: Alexander Maus <amaus@gmx.de>
Subject: Patch-o-matic failed... Why?
Date: Wed, 19 Feb 2003 04:12:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E52F62D.587D4657@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm using kernel 2.4.19 and need the talk-conntrack-patch.
So I got the latest version of netfilter by CVS.
Running './runme extra/talk-conntrack-nat.patch' showed:

=== cut ===
Welcome to Rusty's Patch-o-matic!

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Testing... talk-conntrack-nat.patch NOT APPLIED ( 3 missing files)
The extra/talk-conntrack-nat patch:
   Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
   Status: Alpha
   
   This adds CONFIG_IP_NF_TALK: talk support module for netfilter
   connection tracking and NAT.  This allows both the callee client -
   caller server and callee client - caller client connections to work
   through connection tracking and NAT.
   
   Default both talk (UDP port 517) and ntalk/ntalk2 (UDP port 518) are
   supported. talk/ntalk/ntalk2 supports can selectively be enabled/disabled
   by the module parameters of the ip_conntrack_talk and ip_nat_talk
   modules:
   
   talk=0|1
   ntalk=0|1
   ntalk2=0|1
   
   where '0' means 'don't support' while '1' means 'do support'
   the given protocol flavour.
   
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] t
Testing patch extra/talk-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
-----------------------------------------------------------------
=== cut ===

My question: What's wrong? I couldn't find any hints about this error ("Could
not find place to...").

Greetings
   Alexander

