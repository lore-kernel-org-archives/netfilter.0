From: John Sage <jsage@finchhaven.com>
Subject: re: -m state --state
Date: Mon, 16 Jun 2003 16:34:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030616233414.GC7125@tweedle.finchhaven.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

From man 8 iptables, and the Linux 2.4 Packet Filtering HOWTO:

"--state [state]
Where state is a comma separated list of the connection states
to match..."

"Specifying `-m state' allows an additional `--state' option, which is
a comma-separated list of states to match (the `!'  flag indicates not
to match those states).  These states are..."


Is this comma-separated list creating a series of AND's or OR's?

Thus -m state --state INVALID,NEW is

INVALID AND NEW

or

INVALID OR NEW?


Somehow, OR seems to make more sense..


- John
-- 
"Obviously, we do not want to leave zombies around."

