From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Range of IP's with Exclusions
Date: Wed, 12 Nov 2003 22:46:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311122247.hACMl0j18863@agate.rockstone.co.uk>
References: <63340-2200311312223113559@coxhealthplans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <63340-2200311312223113559@coxhealthplans.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 12 November 2003 10:31 pm, bmcdowell@coxhealthplans.com wrote:

> iptables -t NAT -A PREROUTING -d 10.22.1.3 -j DNAT --to 10.22.2.2
> iptables -t NAT -A PREROUTING -d 10.22.1.4 -j DNAT --to 10.22.2.2
> iptables -t NAT -A PREROUTING -d 10.22.1.5 -j DNAT --to 10.22.2.2
> iptables -t NAT -A PREROUTING -d 10.22.1.6 -j DNAT --to 10.22.2.2
> (etc.)
>
> ...but that is a bit of a pain.
>
> I keep trying to type in something like:
>
> iptables -t NAT -A PREROUTING -d 10.22.1.0/24,! 10.22.1.1 -j DNAT
> --to 10.22.2.2
>
> ...but iptables complains.

Try these two rules, in this order:

iptables -t NAT -A PREROUTING -d 10.22.1.1 -j ACCEPT
iptables -t NAT -A PREROUTING -d 10.22.1.0/24 -j DNAT --to 10.22.2.2

The first will match the address you don't want to DNAT, and only other 
addresses will match the second rule.

Antony.

-- 

If builders built buildings the way programmers write programs,
then the first woodpecker that came along would destroy civilisation.
                                                     Please reply to the list;
                                                           please don't CC me.

