From: Matteo Pampolini <matteo.pampolini@ciaolab.com>
Subject: Please help me with iptables/NAT
Date: Mon, 16 Feb 2004 16:22:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4030E03D.6050502@ciaolab.com>
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

Hi everybody,

I have a Linux box running kernel 2.4.17 and iptables 1.2.5 where
a DNAT rule is applied and I'm experiencing a strange behaviour.

If I delete the rule while no connections related to it are active,
then everything works fine, otherwise rule is apparently deleted
but network traffic is still active while it shouldn't.

Same thing with another box doing masquerading: if a start a ping
from the inside private network to the outside and the remove the
rule, then the rules listing is OK but ping still works.

Is it a bug or is a choice? In the latter case, why?

Thanks in advance,

Matteo.


