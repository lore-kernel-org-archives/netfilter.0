From: Tim Fenn <fenn@stanford.edu>
Subject: recent match in SSH chain not working
Date: Sun, 4 Dec 2005 01:59:23 -0800
Message-ID: <20051204095923.GA20587@stanford.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm using a variant of Grant Taylor's SSH brute force chain table in
my firewall script, but I'm having a bit of trouble.  I first define a
SSH chain as:

/sbin/iptables -N SSH
/sbin/iptables -F SSH
/sbin/iptables -A SSH -m recent --name SSH --set --rsource
/sbin/iptables -A SSH -i ${IFint} -j RETURN
/sbin/iptables -A SSH -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN
/sbin/iptables -A SSH -j DUMP

(IFint is a trusted, internal network) and then a jump to the chain in
my INPUT rules:

/sbin/iptables -A INPUT -p tcp -i ${IFext} --dport ssh -m state --state NEW -j SSH
/sbin/iptables -A INPUT -p tcp -i ${IFext} --dport ssh -j ACCEPT

the jump to the SSH chain works fine, and I notice the recent list
being created correctly in /proc/net/ipt_recent/SSH.  However, the
rule:

/sbin/iptables -A SSH -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN

never matches any packets, and thus any connection from outside my
trusted network fails.  Strangely, this rule *worked* for awhile, and
only recently stopped allowing outside SSH connections, for reasons
I'm completely mystified by - my only guess is a recent upgrade borked
something, or I'm missing something obvious in the above ruleset.  Any
help/pointers would be greatly appreciated.

If its of any help, I'm using iptables 1.3.0 on a 2.6.12 kernel.

Regards,
Tim

