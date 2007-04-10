From: Anton Sidorov <asidorov@mfmdb.com>
Subject: ESTABLISHED makes possible to connect to internal servers
Date: Tue, 10 Apr 2007 18:39:10 +0100
Message-ID: <461BCBBE.5060003@mfmdb.com>
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

Hi,

I have a slight problem and can not find any answers myself or in the
Internet.

I run iptables on Debian based router/firewall.

I do not use nat and private IP addresses.
vlan2 and vlan3 are external connections to ISPs
vlan101 and vlan82 are internal interfaces.

The problem is that if I put
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
or just
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT

it is possible to access my internal web server (and not only web
server) from outside
despite I did not open port 80 in FORWARD chain and policy for FORWARD
is DROP.

As soon as I remove those lines I can not connect to the Internet from
behind the firewall.

I've been fighting with that problem for two weeks now.
I rewrite my script several times and brought it to bare basic but
nothing has fixed the problem.

kernel 2.6.18-4-686
iptables v1.3.6

Please any hints or tips would be really appreciated.

Best regards,

Anton.




