From: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Subject: pptp-conntrack-nat
Date: Thu, 27 Nov 2003 18:34:15 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13121614429.20031127183415@internetplustravel.ru>
Reply-To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
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

I tryed to install extra package - pptp-conntrack-nat
but failed to do this.

The script tells me "Could not find place to slot in
ip_conntrack.h line", while testing and if I force it to install,
it installs.
And after that I do not see additional configure options while
configuring my kernel.
Do you have any ideas what to do?


Welcome to Rusty's Patch-o-matic!
Kernel:    /usr/src/kernel-source-2.4.18
Userspace: /usr/src
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Testing... pptp-conntrack-nat.patch NOT APPLIED (8 missing files)
The extra/pptp-conntrack-nat patch:
   Author: Harald Welte <laforge@gnumonks.org>
   Status: Beta
   This adds CONFIG_IP_NF_PPTP:
   Connection tracking and NAT support for PPTP.
   Note that this code currently has limitations
   - can only NAT connections from PNS to PAC
   - doesnt' support multiple calls within one session
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
Testing patch extra/pptp-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
   Placed new Makefile line
   Placed new ip_conntrack.h line
   Placed new ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.
[Press enter to continue]
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] f
Applying patch extra/pptp-conntrack-nat.patch...
Failed to patch copy of /usr/src/kernel-source-2.4.18

  

-- 
working tel.+7-095-933-2033
mob. tel.+7-095-790-5354
Regards Oleg
Oleg                          mailto:savostyanov@internetplustravel.ru


