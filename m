From: Antonio Di Bacco <antonio.dibacco@aruba.it>
Subject: DNAT problem
Date: Sat, 8 Jul 2006 23:00:48 +0200
Message-ID: <200607082300.48752.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I receive on an interface (eth0, NOARP , ipaddr: 192.168.0.20 ) a tcp packet 
in this way (I have dumped it with tcpdump):

SRC: 192.168.0.21:6000 
DST: 192.168.0.21:80

I have an iptables rule:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT 
--to-destination 192.168.0.20:80

Why my web server listening on eth0 doesn't receive it?

Thank you,
Antonio.

