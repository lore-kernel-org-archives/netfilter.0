From: Giuseppe Fontana Padilha <giuseppe@contato.net>
Subject: Tproxy patch
Date: Tue, 27 Sep 2005 08:52:29 -0300
Message-ID: <4339327D.9090903@contato.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello People, this is my first post and is trying to apply the Patch 
tproxy of the Balabit and I am not obtaining.  I did not understand 
because not to have obtained to apply this patch.  I looked for in 
google and also I did not discover nothing.

I noticed that it asks for first to apply the Patch of nat-reservations, 
I go to try to apply and happens this:
---------------------------------------------------------------------------------------------------------------
Testing nat-reservations... not applied
The nat-reservations patch:
   Author: Krisztian Kovacs <hidden@balabit.hu>
   Status: Alpha

NAT reservations support for Netfilter

This module implements reservation of manips, which won't be allocated
by the Netfilter NAT subsystem except explicitly requested. It can be
used in NAT helpers for complicated protocols, for example it may be
needed in case the protocol's command channel requires negotiation of
the exact endpoints of the data channel, and both of them need to be
translated.
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] t
newfile: 1 files in our way, unable to apply
---------------------------------------------------------------------------------------------------------------


As I do not obtain, I go to try to apply patch tproxy, and happens this:
---------------------------------------------------------------------------------------------------------------
Testing tproxy... not applied
The tproxy patch:
   Author: Balazs Scheidler <bazsi () balabit dot hu>, Krisztian Kovacs 
<hidden () balabit dot hu>
   Status: Alpha
   Version: 1.9.6

Transparent proxying support for Netfilter

This module implements transparent proxying functionality in Netfilter. It
can be used to implement user-space transparent proxies for complex
protocols over TCP/UDP. A table named 'tproxy' is implemented, which takes
care of dynamically setting up NAT mappings for the appropriate
connections.

To support transparent proxying in the iptables rulesets, the 'tproxy'
match matches all packets related to proxied connections, and the 'TPROXY'
rule can be used to redirect new connections to the proxy.

A more complete package with some documentation and examples can be
downloaded from http://www.balabit.com/downloads/tproxy/linux-2.4/
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] t
unable to find ladd slot in src 
/usr/src/linux/net/ipv4/netfilter/Kconfig 
(./patchlets/nat-reservations/linux-2.6/./net/ipv4/netfilter/Kconfig.ladd)
nat-reservations not applied
patchlets/tcp-window-tracking does not match your source trees, skipping...
newfile: 1 files in our way, unable to apply
unable to find ladd slot in src /tmp/pom-2711/net/ipv4/netfilter/Kconfig 
(./patchlets/nat-reservations/linux-2.6/./net/ipv4/netfilter/Kconfig.ladd)
apply_dependency: unable to apply dependent nat-reservations
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
---------------------------------------------------------------------------------------------------------------


Somebody obtained to apply this patch?

My Kernel is 2.6.12, and Iptables 1.3.3. Patch-o-matic-ng-20040621 
and/or patch-o-matic-ng-20050918.

Sorry for my bad English.

Regards,
Giuseppe

