From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT, SNAT, port ranges and protocols
Date: Mon, 28 Oct 2002 13:07:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281307.g9SD7Oe08396@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210280629240.7396-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210280629240.7396-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Monday 28 October 2002 11:33 am, Robert P. J. Day wrote:

>   from the iptables man page, for both SNAT and DNAT targets,
> we have the (similar) excerpts:
>
>   --to-{source|destination}  ipaddr[-ipaddr][:port-port]
>
> 	which can specify a single new {source|destination} address,
> 	an inclusive range of IP addresses, and optionally, a
> 	port range (which is only valid if the rule also specified
> 	-p tcp or -p udp)
>
> so, what part of that requires the protocol specifier?  having
> a range of IP addresses?  or just having a port range?  or both?
> it's somewhat ambiguously worded.

Only if you specify a port range.

The "is" inside the brackets refers to the "range" immediately before :-)

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

