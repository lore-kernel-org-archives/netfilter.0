From: <stevesz@enternet.hu>
Subject: ipt_MASQUERADE issue
Date: Thu, 6 Sep 2007 15:35:31 +0200
Message-ID: <b70c82af8f71069ac473eeaf715dca69@62.112.192.6>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All,

I'm using kernel v. 2.6.22.1, iptables v. 1.3.8.
I have an ADSL connection with dynamic IP.
I use ipp2p to indentify and CONNMARK to mark p2p
traffic. Then I classify the marked packets to a
low-prio class. This all work fine until the first
ip change comes. Because ipt_MASQUERADE flushes all
the conntrack entries which belong to my external
interface, so the marks are reset along with this.
Then the p2p traffic goes to the default class, which
is not good for me.
Is it possible to tell ipt_MASQUERADE not to flush
these entries, just update them with the new IP?
Or is there an alternative solution for this?

Thanx in advance.
Steve


