From: Richard Norton <richard@arachnia.dynip.com>
Subject: H323 Patch-o-matic
Date: Mon, 23 Dec 2002 13:28:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212231328.17654.richard@arachnia.dynip.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
I am trying to get H323 working over using nat so i have been trying to patch my kernel (RedHat 8.0 stock 2.4.18-14) using the patch-o-matic.
When i apply the h323-conntrack-nat.patch, it complains that there are problems:

Testing patch extra/h323-conntrack-nat.patch...
   Placed new Config.in line
   Placed new Config.in line
   Placed new Configure.help entry
   Placed new Makefile line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line
Could not find place to slot in ip_conntrack.h line

How do i fix this?

Cheers,

Richard.

