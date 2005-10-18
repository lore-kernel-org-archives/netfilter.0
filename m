From: Olivier GRALL <olivier.grall@neotip.com>
Subject: [IPTABLES] Symmetric NAT ?
Date: Tue, 18 Oct 2005 09:07:55 +0200
Message-ID: <43549F4B.2060705@neotip.com>
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

Hi,

I was making some tests with STUN when I realize that my NAT box was a 
simple Linux Box with an IPTABLES rule with a MASQ target. What seemed 
strange to me was that the STUN result was "Port restricted cone ".

I made a new with NATcheck.exe... same result.
http://midcom-p2p.sourceforge.net/

I was sure IPTABLES NAT was Symmetric and not Port restricted cone. What 
about it ?
In the "Procceding of NetFilter Developer WorkShop 2004",  Harald Welte 
reported "

netfilter however implements (SNAT and MASQ) as ssymmetric.
"


For me, with MASQ it is Port restricted cone and with SNAT+DNAT it is 
Symmetric. Is it true ?

Thanx,
-- 

	
Olivier GRALL
R&D Engineer 	*NeoTIP** S.A.*
4, rue Louis de Broglie
22300 Lannion
France
olivier.grall@neotip.com <mailto:olivier.grall@neotip.com> 	+33 (0)2 96 
48 66 94


