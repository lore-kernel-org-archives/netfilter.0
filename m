From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: two ISP but only one NAT
Date: Thu, 12 Apr 2007 17:54:10 -0300
Message-ID: <20070412175410.4e97a929@pulsar.inexo.com.br>
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


Hi All

Let's see if I can make that clear.

I have two ISP. ISP-A gave me just one IP and ISP-B gave a hole class-C.
Both ISPs are connected to a Linux Router via ethernet cards

I need that connections originated inside my Class-C be "NATed" thru
ISP-A IP.
And connections from outside to one of my Class-C IPs be NOT "NATed" when
outgoing.

i.e it must be possible to someone outside my Class-C to connect to some
host inside it without "NATing" the packages that goes out.

something like (i did not tried that. I am still wondering how to)

iptables -t nat -A PREROUNTING -o ISP-A \
		-m state --state  NEW \
		-j SNAT --to_source SOME_IP 

(will this rule continue to NAT the packets that follows the NEW one (the
ESTABLISHED or RELATED ones for instance)?

Fuzzy??

Regards

Ethy


