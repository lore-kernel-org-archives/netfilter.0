From: Ernst Lehmann <lehmann@acheron.franken.de>
Subject: ipsec in kernel 2.6 and conn tracking
Date: Tue, 22 Jun 2004 00:03:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087855434.26562.28.camel@hadley.lv426.org>
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

Hi,

am I right, that at the momenent there is no working code for netfilter
with connection_tracking with ipsec in kernel2.6 ??

after some hours of reading the list, and trying:

- kernel 2.6.7
- patch-o-matic-ng (20040620), only with:
	- nf_reset
	- ipsec-XX-* 

I also tried kernel 2.6.3 with the same patches....

my setup is as followed:

network1 -> firewall1 ->internet -> firewall2 -> network2

Betwenn firewall1 and firewall2 is a ipsec tunnel established. And it is
working. The firewall1 one is desingend for conn-track connections to
network2.

my default rule in forward-chain has as the first rule:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


but it does not seem to work, if I put a LOG rule just behind it, I get
the packets logged, but the conn-tracking does not handle them.


Have I missed anything ?? Or is kernel 2.6 with ipsec and netfilter not
realy useable at the moment ??

Thanks in advance for any help regarding this problem....



-- 

Bye

	Ernst
---------
Ernst Lehmann             Email: lehmann@acheron.franken.de



