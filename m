From: "John Black" <black@arbbs.net>
Subject: Static NAT Mappings
Date: Wed, 06 Oct 2004 17:25:16 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <416470cc.39e.491e.214291233@arbbs.net>
Reply-To: black@arbbs.net
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to setup static NAT mappings.

this is what i did, but it doesn't work:
public address 1.2.3.4/24
ifconfig eth0:0 1.2.3.4 netmask 255.255.255.0

then in my firwall script:
iptables -t nat -A POSTROUTING -s 192.168.0.4 \
 -o eth0 -j SNAT --to 1.2.3.4

i tried this also:
iptables -t nat -A POSTROUTING -s 192.168.0.4/24
  -o eth0 -j SNAT --to 1.2.3.4

i have read the howto on the netfilter web site. 
but i'm still lost.


thanks
john

