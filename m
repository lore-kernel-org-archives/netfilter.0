From: Earl A.Killian <netfilter@lists.killian.com>
Subject: anti-spoofing rule placement question
Date: Thu, 23 Oct 2003 07:19:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16279.58204.161920.989846@teak.killian.com>
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

The iptables firewalls I've seen put anti-spoofing rules in the
filter/INPUT and filter/FORWARD chains.  The documentation that this
is where filtering is best done.

However, if you put them in one of the PREROUTING chains, you would
not have to duplicate the N calls to them (one call per interface
usually), since that is common to the path to INPUT and FORWARD.  Is
there a problem in doing that (e.g. put them in the nat/PREROUTING
chain)?

