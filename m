From: cc <cc@belfordhk.com>
Subject: nfsim
Date: Fri, 22 Jul 2005 12:17:44 +0800
Message-ID: <42E07368.1030507@belfordhk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Dear All,

I was looking for the netfilter testsuite as stated
in the howtos/faq, but found out it's deprecated in
favor of nfsim.  Ok, I d/led it and after a bit of
fudging a symlink (btw, it doesn't like link-dtd
being symlink'ed to a xml-dtd-4.1.  It prefers
xml-dtd-4.1.2. (this is on a Slackware system,
mind you. YMMV)).

Anyway, I was wondering if there is a similar
app out there similar to nfsim, but processes
any gen_ip'd packets with the actual rule set
that is being used in a NAT firewall?

Right now, using nfsim, I can generate a packet
and see what happens to it, but what I would
like to do is have nfsim read in an actual
firewall script, and then when I run a gen_ip,
the packets follow the script rules instead
of the default one.

Or did I misunderstand the Netfilter Simulation
documentation?

Any help appreciated

Ed

