From: "John Hill" <jhill@noach.com>
Subject: Second Request for help!!
Date: Mon, 7 Feb 2005 09:57:55 -0500
Message-ID: <200502071457.j17EvuYX018439@commserver.noach.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Kernel 2.4.29
Patch-0-Matic 2005 02 01 patched for fixes and pptp
iptables-1.3.0rc1

20+ errors in ipv4 and ipv6 about Declare_Mutex declared static but never
defined defaults to int etc.
Some are ipv4/iptables.h:339 and ipv6/ip6_tables.h:109 all about
Declare_Mutex errors?

I have had these errors on all iptables except 1.2.11 and pom2040621. I have
not been able to update since 6-2004.
I searched the lists and found some mention but no clear answer.

Thanks

--john


