From: Jonas Lindborg <jools@apollo.nu>
Subject: ip_conntrack vs netstat
Date: Sat, 30 Aug 2003 14:37:42 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308301423020.30825@apollo.rsn.bth.se>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

When comparing the output of /proc/net/ip_conntrack with the "netstat"
command, I'm seeing a few established connections in ip_conntrack that are
not presented by netstat.

These are familiar connections (ssh, imap) to known hosts that could very
well have been done by me but not in the last 24 hrs so they should have
timed out a long time ago.

"ps" shows no such processes running so this immediately raises the
suspicion that the machine could be compromised and connections are hidden
from netstat and ps.
But if this was the case there should be some connections to unknown hosts
showing in ip_conntrack as well so I should be able to rule out that
possibility (?).

Now for my question:
Can anyone confirm that ip_conntrack can show "ghost" connections like
these?

