From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: tcp-window-tracking.patch fails to apply
Date: 26 Apr 2003 05:19:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051339036.4860.26.camel@jasiiitosh.nexusmgmt.com>
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

I very much wanted to use the window tracking patch but an unable to get
it to apply.  I am running RedHat 7.3 with kernel 2.4.20.  The
patch-o-matic test replies:

Testing... tcp-window-tracking.patch NOT APPLIED (29 rejects out of 32
hunks)

When I try to apply the patch I get:

Patch extra/tcp-window-tracking.patch conflicts with
extra/ip_conntrack-timeouts.patch...
ip_conntrack-timeouts.patch NOT APPLIED (1 missing files)
Testing patch extra/tcp-window-tracking.patch...
   Placed new Makefile line
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

I do not have ip_conntrack-timeouts.patch installed.  I even tried
reversing that patch in case it was installed without my knowing it but
it is not there.

I rebuilt the kernel and tried the tcp-window-tracking patch as the only
patch but that didn't work either.  I tried applying it separately after
applying all other patches.  That didn't work.  What am I doing wrong?
Thanks - John

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


