From: "Shazad Malik" <smalik@vistawiz.com>
Subject: H323 compile question again!
Date: Fri, 7 Jun 2002 13:16:14 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1103.24.168.132.35.1023470174.squirrel@mail.vistawiz.com>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello everyone......

I might be killing everyone with this question but I know what I'm
implementing is not wrong but i just cant get this DAMN h323 working! It's
getting very frustrating!

I have recompiled everything from scratch with the kernel and new iptables
but no luck!  This is what I have done: So can someone please tell me.

Approach ONE:
=============
iptables 1.2.6a and 2.4.18 kernel
1) make pending-patches KERNEL_DIR=/usr/src/linux
2) recompiled the kernel
3) make KERNEL_DIR=/usr/src/linux
4) make install KERNEL_DIR=/usr/src/linux


Approach TWO:
=============
iptables from snapshot iptables--20020605 and 2.4.18 kernel
1) cd iptables--20020605/patch-o-matic
2) ./runme base
3) ./runme extra
4) recompile the kernel
5) make KERNEL_DIR=/usr/src/linux
6) make install KERNEL_DIR=/usr/src/linux

I keep gettinf errors on newnat, h323 and talk patches like shown below:

=====================================================================
Testing... 0-newnat8.patch NOT APPLIED (93 rejects out of 96 hunks)
The newnat/0-newnat8 patch:
   Author: Harald Welte <laforge@gnumonks.org>,
   modified by Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
   Status: Pending for kernel inclusion

   Implementation of the new nat API for kernel 2.4.17 and above.

   The whole newnat suite is dependent of it.
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch newnat/0-newnat8.patch...
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

====================================================================
Testing... h323-conntrack-nat.patch NOT APPLIED ( 3 missing files)
The newnat/h323-conntrack-nat patch:
   Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
   Status: Alpha

   This adds CONFIG_IP_NF_H323: H.323/netmeeting support module for
netfilter
   connection tracking and NAT. H.323 uses/relies on the following data
streams:

   Port         Description
   389          Internet Locator Server (TCP)
   522          User Location Server (TCP)
   1503                 T.120 Protocol (TCP)
   1720         H.323 (H.225 call setup, TCP)
   1731         Audio call control (TCP)
   Dynamic              H.245 call control (TCP)
   Dynamic              RTCP/RTP streaming (UDP)

   The H.323 conntrack/NAT modules support the connection tracking/NATing of
   the data streams requested on the dynamic ports. The helpers use the
   search/replace hack from the ip_masq_h323.c module for the 2.2 kernel
   series.

   At the very minimum, H.323/netmeeting (video/audio) is functional by
letting
   trough the 1720 port and loading these H.323 module(s).

   The H.323 conntrack/NAT modules do not support

   - H.245 tunnelling
   - H.225 RAS (gatekeepers)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch newnat/h323-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
TEST FAILED: patch NOT applied.

Can someone help me out here............... I am just going crazy here and
have spend endless hours on this problem!

Cheers,
shazad

-- 
Shazad Malik
work: (845)623-2161
fax: (845) 623-1154



