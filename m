From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: SYN only packets
Date: Fri, 5 Aug 2005 07:22:53 +0200
Message-ID: <30644.5068250925$1123219503@news.gmane.org>
References: <42F2B892.30507@blackicehosting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42F2B892.30507@blackicehosting.com>
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

> The plan i'm looking at is possibly blocking all packets with SYN alone,
> no ACK.. would this be possible with iptables, and how would this affect
> other web services?

  The main problem with SYN dos's is the fact that, if is big enough, eats
machine resources, no matter what you can do at layer 3, it beats you down
at layer 1, cos every time the nic receives a packet, generates an
interrupt, and if you are receiving > 100.000 pps, simply your system
collapses in a few seconds. Against that, but not yet well implemented in
Linux, you can use polling (as, for example, freebsd can do), but this still
won't save you if the attack is big enough. Your only solution is then
asking your uplink to ratelimit the amount of syn per second arriving to
you.

  Regards,

- Ruben



