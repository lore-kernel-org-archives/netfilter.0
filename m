From: =?UTF-8?B?UGF3ZcWCIFN0YXN6ZXdza2k=?= <pstaszewski@artcom.pl>
Subject: nf-hipac 0.9 compile problem
Date: Tue, 04 Oct 2005 10:27:38 +0200
Message-ID: <43423CFA.5010009@artcom.pl>
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
To: netfilter@lists.netfilter.org

Hello


I applied nf-hipac-0.9 patch to 2.6.13 kernel tree and i found that with 
gcc >= 3.4 :

net/ipv4/netfilter/nf-hipac/dimtree.c: In function 'history_undo':
net/ipv4/netfilter/nf-hipac/dimtree.c:44: sorry, unimplemented: inlining 
failed in call to 'elem_free': function body not available
net/ipv4/netfilter/nf-hipac/dimtree.c:59: sorry, unimplemented: called 
from here
make[2]: *** [net/ipv4/netfilter/nf-hipac/dimtree.o] Error 1
make[1]: *** [net/ipv4/netfilter/nf-hipac] Error 2
make: *** [net/ipv4/netfilter/] Error 2

With gcc = 3.3.6 all kernel things is compiled succesfuly... :)



