From: Iva "Cabric" Cabric <ivac@gnjilux.srk.fer.hr>
Subject: ULOG with -m state
Date: Fri, 22 Nov 2002 16:53:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021122155352.GA5665@gnjilux.srk.fer.hr>
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

Hello,
I have found a bug in iptables when "-j ULOG" and "-m state" are
used together, for example:

$ iptables -A ssh -j ULOG -p tcp -m state --state NEW

reports:

iptables v1.2.6a: You must specify `--state'
Try `iptables -h' or 'iptables --help' for more information.

but using DROP works fine:

$ iptables -A ssh -j DROP -p tcp -m state --state NEW
(no error)

$ iptables -L ssh
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             xxx.xxx.xxx.xxx    state ESTABLISHED
DROP       tcp  --  anywhere             anywhere           state NEW 
(first rule is not important...)

Kernel is 2.4.19, iptables are v1.2.6a and system is Debian based
(iptables are from .deb packet, and kernel is manually bulit from
kernel-source-2.4.19).

I haven't found anything about that in changelog for v1.2.7a, but
maybe it has been already fixed. Anyone else with same problem?

p.s.

It could also be Debian specific problem, in that case I'll send
bug report to them, but I would like to check with you first.

TIA


