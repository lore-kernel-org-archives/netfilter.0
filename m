From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: compiling nat_sip and ip_conntrack_h323 and pptp_conntrack_nat
Date: Mon, 17 Oct 2005 15:28:39 +0800
Message-ID: <023f01c5d2ec$6517f1b0$0100a8c0@newlife>
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

 
Below is the error I got with kernel 2.6.13.4 with patch-o-matic-ng10051016 :-

 CC [M]  net/ipv4/netfilter/ip_conntrack_sip.o
  CC [M]  net/ipv4/netfilter/ip_nat_sip.o
net/ipv4/netfilter/ip_nat_sip.c: In function `ip_nat_sip':
net/ipv4/netfilter/ip_nat_sip.c:97: warning: ISO C90 forbids mixed declarations and code
  CC [M]  net/ipv4/netfilter/ip_conntrack_h323_core.o
  CC [M]  net/ipv4/netfilter/ip_conntrack_h323_h225.o
net/ipv4/netfilter/ip_conntrack_h323_h225.c: In function `h225_parse_connect_uuie':
net/ipv4/netfilter/ip_conntrack_h323_h225.c:111: error: too few arguments to function `ip_conntrack_expect_alloc'
net/ipv4/netfilter/ip_conntrack_h323_h225.c:135: warning: implicit declaration of function `ip_conntrack_expect_free'
make[3]: *** [net/ipv4/netfilter/ip_conntrack_h323_h225.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

And I can't apply pptp_conntrack_nat :-

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
cannot apply (1 rejects out of 7 hunks)

Regards.




