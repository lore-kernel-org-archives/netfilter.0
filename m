From: Eric Jarman <ehj38230@cmsu2.cmsu.edu>
Subject: iptables error: resource temporarily unavailable
Date: Mon, 12 Jul 2004 14:32:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F2E75A.9080002@cmsu2.cmsu.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have a firewall machine set up, with a fairly large number of rules in 
the mangle table (>4000) set up as an authenticated gateway.  Routinely, 
I am getting this error when trying to add new rules to the mangle table:

iptables: Resource temporarily unavailable.

Are there any tuning parameters that I can set to try to avoid this problem?

