From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: mangle table: FORWARD vs. PRE/POSTROUTING ?
Date: Wed, 2 Mar 2005 11:39:48 +0300
Message-ID: <200503021139.49045.e-boogie@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello everybody,

One more question. :-)  AFAICS, the majority of iptables scripts
available in the Internet use PREROUTING chain to mangle TOS
values.  Are there any benefits of using PREROUTING but not
FORWARD or, say, POSTROUTING?  (It seems that in certain
situations it is easier to write a rule for FORWARD chain rather
than for PREROUTING one.)

Thanks!

Mikhail

