From: Brett Simpson <simpsonb@hillsboroughcounty.org>
Subject: Re: Send local traffic to a different server.
Date: Thu, 24 Jun 2004 14:27:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088101654.12633.20.camel@simpsonb.hillsboroughcounty.org>
References: <s0d956ae.099@GroupWise>
	 <200406231500.05742.Antony@Soft-Solutions.co.uk>
	 <1088003535.4009.78.camel@simpsonb.hillsboroughcounty.org>
	 <200406231524.14579.Antony@Soft-Solutions.co.uk>
Reply-To: simpsonb@hillsboroughcounty.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231524.14579.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-06-23 at 10:24, Antony Stone wrote:

> How are packets from the machine we are talking about routed to and from the 
> Internet?   Where is NAT taking place?

I got it working! Actually I was testing on Redhat Enterprise Linux ES 3
(RHEL) with no success so I went to Gentoo and was able to get it to
work with the following...

iptables -t nat -A OUTPUT -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to
207.156.7.115:80
iptables -t nat -A POSTROUTING -p tcp -d 207.156.7.115 -o eth0 --dport
80 -j SNAT --to-source 172.27.228.220

I suspect that RHEL doesn't have 'NAT of local connections' compiled
into the kernel.

Thanks for everyone help, 
Brett


