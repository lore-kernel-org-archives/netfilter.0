From: Alexander Piavka <piavka@cs.bgu.ac.il>
Subject: is NOTRACK modules the only way to avoid connection tracking?
Date: Mon, 7 Feb 2005 14:00:25 +0200 (IST)
Message-ID: <Pine.GSO.4.33.0502071342280.1529-100000@indigo>
References: <1107767854.10815.3.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
In-Reply-To: <1107767854.10815.3.camel@nostromo.bgsecm.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


 Hello, i have a question about connection tracking.

if i have at least one iptables rule with -m state ,no matter in which
chain,then the conntrack module gets loaded in all iptables hooks and
thus all packets will be connection tracked, even if i need to track
only a small subset of packets. This means that the only way to avoid
connection tracking for most of packes is to use the NOTRACK module in raw
table to match them. Is my understanding correct?
Or i can avoid connection tracking without the use of NOTRACK modules?

Thanks a lot
Piavlo Alexander


