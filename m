From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: load balancing?
Date: 14 Jun 2003 11:36:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055605015.1853.37.camel@alpha.newkirk.us>
References: <1055591653.2543.3.camel@little.lethalwp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1055591653.2543.3.camel@little.lethalwp>
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
To: Jean-Yves Simon <lethalwp@tiscali.be>
Cc: netfilter@lists.netfilter.org

On Sat, 2003-06-14 at 07:54, Jean-Yves Simon wrote:
> Hello,
> 
> I'm curious if load balancing can be done with iptables, like for
> example forwarding incoming web requests to one of the multiple web
> servers behind the firewall.
> 
> Or is a third party software needed?

If all you need is to distribute requests evenly across a range of IPs
you can use the rule:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
10.10.10.1-10.10.10.16

This example would attempt to distribute incoming HTTP requests evenly
across the specified range of 16 IPs.

j



