From: Martin Kahlert <martin.kahlert@gmx.de>
Subject: Re: Howto redirect internet traffic from local machine back to
	local machine?
Date: Mon, 28 Nov 2005 09:29:20 +0100
Message-ID: <20051128082920.GA11660@keksy.local>
References: <20051128075525.GA11446@keksy.local>
	<33022.213.27.158.85.1133166020.squirrel@66.118.183.110>
	<438AC0B8.5030603@india.tejasnetworks.com>
Reply-To: martin.kahlert@gmx.de
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <438AC0B8.5030603@india.tejasnetworks.com>
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
To: Aseem Rastogi <aseem@india.tejasnetworks.com>
Cc: netfilter@lists.netfilter.org

Hi!

On Mon, Nov 28, 2005 at 02:02:56PM +0530, Aseem Rastogi wrote:
> also traffic from local machine doesn't pass through PREROUTING chain
> . add this rule to OUTPUT chain of NAT table.

i already tried that. But:

# iptables -t nat -A OUTPUT -p tcp -d ! 192.168.100.0/24 --dport 25 -j DNAT \
           --to 127.0.0.1:25
iptables: Invalid argument

Regards,
Martin

