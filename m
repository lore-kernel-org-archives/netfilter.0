From: Jacques Rodary <jrodary@free.fr>
Subject: kernel panic
Date: Mon, 25 Sep 2006 14:32:28 +0200
Message-ID: <1159187548.3522.25.camel@ns.jrodary.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: 
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

Hi Miha
I first didn't see your post, and posted independently on the same
subject (with a typo). I have the same message than yours, but not
always, but it always ends with "Fatal exception in interrupt", includes
sometimes "common_interrupt+0x1a/0x20" and sometimes
"ip_nat_fn..[iptables_nat]". And I never had this before I used NAT on a
SMP box (2 dual-core Xeons).
Also in my logs I found these kernel errors: e1000: eth0: e1000_up:
Unable to allocate interrupt Error: -16 ...:  5 Time(s), but it's
perhaps unrelated.
Finally I can obtain this kernel panic by trying to connect to vncserver
from outside.

Have you got any answer? Thanks in advance.
	Jacques Rodary
P.S.: You Can see my config in the post Kernet (sic) panic with NAT.


