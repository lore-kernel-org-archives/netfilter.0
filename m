From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: More question about ipset - protocol ?
Date: Tue, 10 Oct 2006 17:51:06 +0800
Message-ID: <011d01c6ec51$9b514ae0$0100a8c0@newlife>
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


I still have more questions with ipset, I noticed that
in the portmap, there is no mentioned of protocol,
whether should it be tcp or udp. Taking the example
from the url :-

            http://ipset.netfilter.org/features.html

iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT
iptables -A FORWARD -j DROP

You notice that the ipmap 'server' binds to a portmap, but there is 
no mentioned of protocol ( whether it should be tcp or udp ).

Does it mean I have to specify the protocol in the iptables command,
Shoudn't there be a way the protocol be mentioned in the binding
somewhere  ? 

Cheers. 




