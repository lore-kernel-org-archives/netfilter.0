From: Jochen Kaechelin <fvgi242ss@wlanhacking.de>
Subject: need assistence for PREROUTING
Date: Tue, 11 Jul 2006 01:43:56 +0200
Message-ID: <200607110143.56894.fvgi242ss@wlanhacking.de>
Reply-To: fvgi242ss@wlanhacking.de
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

I have a webserver/firewall behind a dsl-router.
The router opens port 80,...,...,4444.

machine 1:  192.168.178.112 + Firewall + Webserver Port 80, 1 Nic
machine 2:  192.168.178.32  + Webserver Port 80, 1 Nic

Now i want machine 1 to redirect all requests on Port 4444 to Port 
80 machine 2.


The following does not work:

$IPTABLES -t nat -A PREROUTING -i $ETH -p tcp --sport 
$UNPRIVPORTS --dport 4444 -d xxx.xxx.xxx.xxx -j DNAT --t
o-destination 192.168.178.32

$IPTABLES -A FORWARD -i $ETH -o $ETH --p tcp --sport $UNPRIVPORTS -d 
192.168.178.32 --dport 80 -m state --state NEW -j
 ACCEPT

$IPTABLES -A FORWARD -i $ETH -o $ETH -m state --state 
ETABLISHED,RELATED -j ACCEPT

Any hints?

Thanx.

-- 
Jochen Kaechelin, fvgi242ss, wlanhacking.de
http://mail.wlanhacking.de/cgi-bin/mailman/listinfo
http://www.gissmoh.de - Mein sonstiges Leben!!

