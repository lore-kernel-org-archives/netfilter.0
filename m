From: Jason Opperisano <opie@817west.com>
Subject: Re: How to set netfilter variables on Kernel???
Date: Wed, 29 Dec 2004 14:18:34 -0500
Message-ID: <1104347914.7318.36.camel@hubcap.ljm.dom>
References: <41D1934C.6694.24923ECC@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41D1934C.6694.24923ECC@localhost>
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

On Tue, 2004-12-28 at 17:09, Jorge Agrelo wrote:
> Does anybody can help me to set or leave by default the following netfilter 
> variables at a Border/Firewall running kernel 2.6.9 and iptables 1.2.11 ???
> 
> ip_conntrack_buckets
> ip_conntrack_generic_timeout
> ip_conntrack_icmp_timeout
> ip_conntrack_max
> ip_conntrack_tcp_timeout_close
> ip_conntrack_tcp_timeout_close_wait
> ip_conntrack_tcp_timeout_established
> ip_conntrack_tcp_timeout_fin_wait
> ip_conntrack_tcp_timeout_last_ack
> ip_conntrack_tcp_timeout_syn_recv
> ip_conntrack_tcp_timeout_syn_sent
> ip_conntrack_tcp_timeout_time_wait
> ip_conntrack_udp_timeout
> ip_conntrack_udp_timeout_stream
> 
> Thanks in advance

if you have to ask--leave them at their default values.

-j

--
"Oh, people can come up with statistics to prove anything, Kent. 14%
 of people know that."
	--The Simpsons


