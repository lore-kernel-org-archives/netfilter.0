From: "Jonathan" <jonathan@jonathan.abda.net>
Subject: ways to lookup or query rules?
Date: Tue, 5 Oct 2004 21:24:08 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <002201c4ab53$f4264300$2001a8c0@mantis>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, if this is a classic case of RTFM go ahead and shoot me.

Is there an option or a command to look up rules in your iptables,
especially if there's the ability to search by rulenumber or some
kind of key?

The only solution I've seen so far, is to use the -l option, capture the
output, and then process it, but that's a very dirty solution.
I'm writing a script that needs to update the iptables automatically, and I
assume it needs to know whether ot use the add or update
option by verifying whether a rule exists, in order to decide whether to
update the rule, or add a new one.

Jonathan


