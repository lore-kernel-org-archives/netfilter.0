From: Fabian Wolter <netfilter-ml@fabian-wolter.de>
Subject: Re: How to masquerade when using ROUTE
Date: Sun, 08 May 2005 18:22:54 +0200
Message-ID: <427E3CDE.1030008@fabian-wolter.de>
References: <427D52FA.8020805@fabian-wolter.de>
	<f48e768e05050807559b74d35@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f48e768e05050807559b74d35@mail.gmail.com>
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

Glaucius Djalma Pereira Junior wrote:
> 1) create an entry in /etc/iproute2/rt_tables
> 
> echo "200            fabian

I named it mail.out.

# echo "200	mail.out" >>/etc/iproute2/rt_tables

> 2) create the route default to route fabian
> ip route add default via x.x.x.x dev ethX table fabian

I think you meant ppp1 instead of ethX?

# ip route add default via 217.5.98.57 dev eth0 table mail.out
RTNETLINK answers: Network is unreachable
# ip route add default via 217.5.98.57 dev ppp1 table mail.out
#

217.5.98.57 is my default gateway on ppp1.

# route
[...]
217.5.98.57     *           255.255.255.255 UH    0      0        0 ppp1
[...]

> ip rule add from fwmark 3 lookup fabian prio 1

I had to remove the string "from". Then I could apply it without any
error messages.

I did the other steps as you said. But tcpdump on ppp1 shows no traffic
and in syslog the following message appears:

May  8 17:55:20 eis kernel: MASQUERADE: Route sent us somewhere else.

Regards,
Fabian



