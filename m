From: <hamals@infinito.it>
Subject: bad tcp packets
Date: Tue, 23 Nov 2004 13:18:25 +0100
Message-ID: <web-23112413@infinito.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: franco.riggi@tiscali.it


Hello to everyone

I'm reading "Iptables Tutorial 1.1.19" by Oskar 
Andreasoon, and I cant understand these bad packets rules


$IPTABLES -N bad_tcp_packets
#
#
# bad_tcp_packets chain
#
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK 
SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state 
--state NEW -j LOG \
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state 
--state NEW -j DROP

someone could explain me why that are bad tcp packets?

Thanks

_______________________________________
Connessione ed e-mail gratuita da 10 mb
consultabile tramite web e tramite pop.
www.infinito.it vieni a scoprire tutti 
i nostri servizi!

http://www.infinito.it/xmail


