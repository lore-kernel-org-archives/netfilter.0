From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Maxium concurrent connections with IPTables
Date: Mon, 2 Aug 2004 20:01:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408022001.49637.Antony@Soft-Solutions.co.uk>
References: <564DE4477544D411AD2C00508BDF0B6A22073275@usahm018.exmi01.exch.eds.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <564DE4477544D411AD2C00508BDF0B6A22073275@usahm018.exmi01.exch.eds.com>
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

On Monday 02 August 2004 7:15 pm, Small, Jim wrote:

> I'm curious, what is the maximum number of concurrent connections possible
> with IPTables using connection tracking for udp and for tcp?  (using latest
> 2.4 kernel and 2.6 kernel)

Depends on the amount of memory in your machine, and the setting of 
/proc/sys/net/ipv4/ip_conntrack/max

Each connection uses about 300 bytes (see output of dmesg for the exact size 
for your particular system), therefore a system with 1Gbyte RAM could support 
about 3.5 million connections.

> I'm currently taking a Cisco firewall class and they're claiming that PIX
> which supports 500,000 concurrent connections with the appliance version
> and 1,000,000 with the blade version vastly exceeds the capabilities of all
> general purpose O/S'.

I've never tested a fierwall with >256Mbytes RAM, and I'd be hard pushed to 
think of a way to effectively test >1 million connections too (sure, you 
could use a Windows machine infected with a worm, but that would test 
half-open connections with nothing on the other end, not real connections 
passing data).

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


