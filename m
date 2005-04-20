From: Anders Fugmann <afu@fugmann.net>
Subject: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 12:49:15 +0200
Message-ID: <1113994155.31280.29.camel@localhost.localdomain>
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

Hi,

I would like to request a very simple feature: The possibility to lock
all iptable rules in the kernel, making them immutable.

This would be usefull on machines which act both as a firewall and as a
server. The problem today if an unwanted guest manages to break into the
machine running the firewall and becomes root, the person can easilly
change the rules, compromising the network guarded by the hacked
firewall.

If it was somehow possible to lock the rules once setup, the attacker
would be unable to modify the rules, the network guarded by the firewall
would not (pending on how the firewall was setup) not be compromised,
even if an attacker gained access to the firewall itself.

I was thinking something in the lines of:

iptables --lock [--action <PANIC|LOG>],

where 'action' would specify how the machine should react if anyone was
to try and modify the rules. PANIC would cause the system to panic. LOG
would simple make the kernel log the attempt and then ignore the
request.

The only way to unlock the tables would be to reboot the machine. I know
that this system if not 100% foolproof, as the attacker could install a
custom kernel, and then reboot the machine, but it would cirtanly make
at lot harder for most attackers

I really hope that this feature could be implemented. I know that is is
not excatly trivial to implement as the address of the bit signifying
that the tables are lock would need to be hidden to avoid the attacker
to simply write a zero the the specific address to unlock the tables.

Regards
Anders Fugmann

P.s.
Please CC me on replys, as I'm not on the list.









