From: marcus <marcus@lanhelp.com.br>
Subject: mangle squid packets
Date: Fri, 01 Jul 2005 17:31:17 -0300
Message-ID: <42C5A815.8040301@lanhelp.com.br>
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

Hi, I've managed to work a 3 gateway linux router using this mangle rule
to mark local net incoming packets:

iptables -A PREROUTING -t mangle -s 10.0.0.0/8 -d 0/0 -j MARK --set-mark 3

Works, great. But i cant do the same with squid activated, I'm using
transparent proxy:

iptables -t nat -A PREROUTING -i eth0 -p TCP --dport 80 -j REDIRECT
--to-port 3128

I dont know what mangle rule I need to mark squid transparent packets, I
have tried all the following (One at a time):

        iptables -A PREROUTING -t mangle -s 10.0.0.0/8 -d 0/0 -j MARK
--set-mark 3
        iptables -A PREROUTING -t mangle -s 127.0.0.1 -d 0/0  -j MARK
--set-mark 3
        iptables -A PREROUTING -t mangle -p tcp --dport 80 -j MARK
--set-mark 3
        iptables -A PREROUTING -t mangle -p tcp --dport 3128 -j MARK
--set-mark 3

Any ideas??

Thanks.

-- 
<http://www.lanhelp.com.br> 	Atenciosamente,
Marcus Leandro
Suporte / Consultoria
marcus@lanhelp.com.br

