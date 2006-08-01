From: Andre Grueneberg <andre@grueneberg.de>
Subject: Re: Host not reachable problem
Date: Tue, 1 Aug 2006 18:54:53 +0200
Message-ID: <20060801165453.GP5908@leela.home.grueneberg.de>
References: <008901c6b589$9241ca50$0b4613ac@shs1>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <008901c6b589$9241ca50$0b4613ac@shs1>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Steffen Heil wrote:
> What I would need is a routing table entry which routes my /26-network to
> "host not reachable" and which has a lower priority than my explizit routing
> rules.
> How can I do that?

ip route add unreachable <network>/26

Your host routes are more specific so they overrule this network rule.

Andre
-- 
RECOVER.COM: a little slice of hell.

