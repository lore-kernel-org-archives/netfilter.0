From: Philip Craig <philipc@snapgear.com>
Subject: Re: icmp and ip_conntrack
Date: Mon, 06 Mar 2006 11:45:45 +1000
Message-ID: <440B9449.70407@snapgear.com>
References: <200603032158.22452.sov.rbsec@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200603032158.22452.sov.rbsec@gmail.com>
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
To: Oleg <sov.rbsec@gmail.com>
Cc: netfilter@lists.netfilter.org

On 03/04/2006 04:58 AM, Oleg wrote:
> Is it possible that when successfully pinging server, which has conntrack 
> enabled, cat /proc/net/ip_conntrack not show icmp entries?
> 
> All ping requests/replyes goes both sides (seen in tcpdump)

There should only be 1 reply packet, so the conntrack is destroyed immediately.
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#ICMPCONNECTIONS

