From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Fwd: IPTables stops logging after long uptime
Date: Sun, 9 Feb 2003 22:47:20 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302092247.20930.fabrice@netfilter.org>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


Anybody had this problem ?

[I don't have this problem since my
uptime is never that long..]

Have a nice day,

Fabrice.

----------  Forwarded Message  ----------

Subject: IPTables stops logging after long uptime
Date: Saturday 08 February 2003 01:21
From: Chris Travers <chris@travelamericas.com>
To: focus-linux@securityfocus.com

Hi all--

I was wondering if anyone has seen similar problems with IPTables/Netfilter.

I am running a firewall which consists of a small system (AMD K5 @133MHz
w/32 MB Ram).  It has 2 3c509 ethernet cards, is running FreeS/wan, and
IPTables.  It also has all QoS options enabled.  The kernel is compiled
without support for LKM so all of these are statically linked.  I am
running the Linux Kernel 2.4.18.

If the system has been up for a month or so and I try to reapply the
firewall rules, something odd happens.  Instead of getting the normal
IPTables entries:
Feb  2  18:29:47 fwhost -- MARK --

Rebooting solves the problem.  As the kernel is entirely statically
linked, I can't remove and reinstall the IPTables module into the
kernel.  Note that restarting Syslog does not solve the problem, and
syslog does log everything else correctly. so the problem appears to be
with the kernel at this point.

Any ideas what causes this?  Or should I file a bug with the Linux
Kernel email list?

Best Wishes,
Chris Travers
-----------------------------------------

--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

