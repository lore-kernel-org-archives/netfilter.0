From: MaXxX <maxxx@anime-h.com>
Subject: terminating connections when an interface goes down
Date: Sat, 13 Mar 2004 19:24:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1127959457.20040313192408@anime-h.com>
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

Hello.

Having recently switched to a faster ISP but with dynamically assigned
(and forcibly changed every 24h) IP, I'd like the conntrack module to
TERMINATE all active connections when the IP changes. Some programs
behave very badly when their connections are left to time out, and
some services ban a user for quite a long time when they detect a
double login (and that's how a timeout-IP change-relogin looks to
them)...

So far I've been using the MASQUERADE target, but all the difference
between it and SNAT is that it forgets its connections. What I'd like
is that it terminated them - preferably by generating a two-way
FIN+RST (or whatever a "terminate" packet looks like).

Is there an option I can use for that, or should I try to make a patch
for it (if so, what source file should I be mostly looking at?)

-- 
 |\  /|      \~~~/     \~~~/
 | \/ |  /\   > <  \~/  > <    ICQ# 3146019
 |____| /__\ /___\ /_\ /___\    IQ# 3.14159
"This is Pearl Harbor! Japanese aircraft incom-" NO CARRIER



