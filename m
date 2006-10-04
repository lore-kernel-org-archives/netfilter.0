From: Brent Clark <bclark@eccotours.co.za>
Subject: redirect all HTTP traffic
Date: Wed, 04 Oct 2006 12:06:33 +0200
Message-ID: <452387A9.3010906@eccotours.co.za>
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

Hey all

Ive been trying to redirect all HTTP traffic to my newly built proxy (squid).

But I cant seem to get it working.

This is what I have

$IPT -t nat -A PREROUTING -i eth1 -s 192.168.111.0/24 -p tcp --dport 80 -j DNAT --to 192.168.111.9:3128
$IPT -t nat -A POSTROUTING -o eth1 -s 192.168.111.0/24 -j SNAT --to 192.168.111.10

and

$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A FORWARD -i eth1 -o eth1 -p tcp --dport 80 -m state --state NEW -j ACCEPT


If anyone could assit, I would be most grateful.

Kind Regards
Brent Clark

