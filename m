From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Wired routing problem
Date: Fri, 14 Nov 2003 22:04:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311142204.hAEM4Cj20307@agate.rockstone.co.uk>
References: <20031114211846.84359.qmail@web42003.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031114211846.84359.qmail@web42003.mail.yahoo.com>
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
To: iptables iptables <netfilter@lists.netfilter.org>

On Friday 14 November 2003 9:18 pm, star fire wrote:

> Firewall/Router
>
> eth0
> IP       10.2.248.1
>
> eth1
> IP       172.16.1.1
>
> Client A
> IP       10.2.255.254
>
> Client B
> IP       172.16.1.3
>
> The firewall/router is a Redhat Linux 2.4.18
> The situation where there are no iptables
> running(stopped the service) and packet forwarding is
> enables via sysctl.conf. As long as there are two(2)
> machines as client A and B they connect to each other.

Okay, I understand what you mean by the above configuration, and it works.

> But then again when there is a CISCO route taken in as
> a client, client A/B it does not ping to the router
> from the other side.

Please explain where the Cisco router fits into the above network setup, what 
IP addresses it has, and what the routing table is on all machines involved.

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.
                                                     Please reply to the list;
                                                           please don't CC me.

