From: Jacky Lam <sylam@alumni.cuhk.edu.hk>
Subject: Iptables startup failed
Date: Sat, 08 Oct 2005 08:48:21 +0800
Message-ID: <43471755.5010601@alumni.cuhk.edu.hk>
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

Dear all,

	I am not familiar with firewall stuff. Currently, I update my kernel
from 2.6.10 (Fedora Core 2) to 2.6.13.3. I find iptable fail to start.
After tracing for while, the error are happened at the following line:

-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
ACCEPT

	I don't know if I have missed any component in kernel and I don't have
enough information why it fails.

	Please help. Thanks.

Yours,
Jacky

