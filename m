From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: tcp match --syn option and FIN flag
Date: Thu, 12 Jul 2007 23:12:27 +0200
Message-ID: <4696993B.6070605@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Liste Netfilter <netfilter@lists.netfilter.org>

Hello,

Found in iptables 1.3.2 changelog :

- Include FIN bit in mask of "--syn" bits

With this change a TCP packet must have the FIN flag cleared in order to 
match the --syn option, while it was not necessary with previous 
iptables versions.
Why ? Isn't the SYN flag supposed to have precedence over the FIN flag, 
so shouldn't FIN be ignored when SYN is set ?
Besides, this change has been applied only to libipt_tcp.c, not to 
libip6t_tcp.c. Is there a reason to this ?

Thanks for your attention.

