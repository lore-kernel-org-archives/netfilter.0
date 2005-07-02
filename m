From: "David Leangen" <dleangen@canada.com>
Subject: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 11:53:12 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAEECBBDAB.dleangen@canada.com>
Reply-To: dleangen@canada.com
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


Hello!

On FC3, my file /etc/sysconfig/iptables is not being loaded on reboot. For
some reason, my iptables is being loaded with some kind of default values.

I thought that the file /etc/sysconfig/iptables was supposed to be loaded
via iptables-restore (and indeed this appears to be so according to the
startup script in /etc/rc.d/init.d/iptables). Is there something that I am
not understanding correctly?


Thank you!


