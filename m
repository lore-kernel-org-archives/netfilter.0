From: Christian Hedegaard <christian.hedegaard@trustcommerce.com>
Subject: trying to get DNAT and SNAT working together.
Date: Fri, 15 Apr 2005 11:29:03 -0700
Message-ID: <426007EF.1020903@trustcommerce.com>
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


Hey everyone. I'm trying to achieve something relatively simple (I think).

I want a machine to sit on a public IP. when a request comes in for that 
public IP, it redirects the packets to another machine on some public 
IP. (iptables DNAT)

when that machine gets the packet, it should think that it came from the 
iptables DNAT machine, and send it back there. which is where iptables 
SNAT comes in.

however. I can't seem to get the two working together.

in my office I have three machines.

1.87 (running apache)
1.72 (me)
1.85 (iptables)

I have these two rules:
iptables -t nat -A PREROUTING -p tcp -d 1.85 --dport 80 -j DNAT \
     --to-destination 1.87

iptables -t nat -A POSTROUTING -p tcp -d 1.87 --dport 80 -j SNAT \
     --to-source 1.85

theoretically, this says that packets destined for 80 coming to the 
iptables machine should get forwarded to the apache machine (1.87), and 
any packets destined for the apache machine should be SNAT'ed back to 
the firewall machine.

basically, I just want a totally transparent packet forwarder that will 
redirect traffic to the proper machine.

however, it's not working. something in my config is wrong and I can't 
figure it out.


-- 
Christian Hedegaard-Schou
Sr. Systems Administrator
TrustCommerce
2 Park Plaza, Suite 350
Irvine, CA 92614
(949) 387 - 3747
christian.hedegaard@trustcommerce.com
http://www.trustcommerce.com/

