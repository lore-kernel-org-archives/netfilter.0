From: Pedro Salazar <pedro-b-salazar@ptinovacao.pt>
Subject: load-balancing with netfilter: round robin or what??
Date: 06 Oct 2003 10:59:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065434375.1604.33.camel@vitoria.intra.cet.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Greetings,

I pretend to load-balancing to two servers but apparently I think only
one machine is getting the requests.

These are the rules I run in iptables:

/sbin/iptables -v -P INPUT ACCEPT
/sbin/iptables -v -P OUTPUT ACCEPT
/sbin/iptables -v -P FORWARD ACCEPT
/sbin/iptables -v -t nat -A PREROUTING --dst 192.168.89.44 -p tcp \
 --dport 9000 -j DNAT --to-destination 192.168.89.158:80 \
 --to-destination 192.168.89.159:80
/sbin/iptables -v -t nat -A POSTROUTING --dst 192.168.89.158/31 \ 
-p tcp --dport 80 -j SNAT --to-source 192.168.89.44
/sbin/iptables -v -t nat -A OUTPUT -p tcp -m tcp --dport 9000 \ 
--dst 192.168.89.44 -j DNAT --to-destination 192.168.89.158:80 \
 --to-destination 192.168.89.159:80

As you can see, I have two destinations hosts, 192.168.89.158/31. The
192.168.89.44 is the gateway itself that is redirecting requests on port
9000 to the two http servers. All of them are in the same network.

However, I think only the .158 is getting the requests (I have verified
that with tcpdump).

So, what is wrong or what is needed? I supposed the requests would be
load-balanced...

I'm using a linux redhat 7.3 box with default kernel 2.4.18-3. 

thanks,
Pedro Salazar.
-- 
PS
pedro-b-salazar@ptinovacao.pt
PGP:0E129E31D803BC61


