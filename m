From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: curious about address specification and port specification
Date: Wed, 9 Oct 2002 17:57:23 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210091755001.17555-100000@localhost.localdomain>
References: <20021009211337.KJPF459.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021009211337.KJPF459.mta02-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Wed, 9 Oct 2002, Antony Stone wrote:

> i wrote:

> > 2) in all of the docs i've read, the claim is that port matching is
> >    an implicit match within either UDP or TCP matching and that you
> >    *must* specify a protocol before you're allowed to specify ports.
> 
> This is correct.   The --dport or --sport options are invalid without also 
> specifying -p tcp or -p udp
> 
> >    however, i've certainly seen and used rules that refer to a port
> >    or ports without first specifying a protocol.  is the documentation
> >    just misleading here?
> 
> Can you give an example of a rule which works, and which specified a port but 
> not a protocol ?

just the other day, i was at a local LUG meeting and a guy was giving a
quick tutorial on iptables and displayed a sample rule file that contained
the rule:

  iptables -A FORWARD --destination 172.16.0.2 --destination-port 25  \
--jump ACCEPT

  doesn't this represent an example of what i was asking about?  a
reference to a port with no reference to protocol.

rday


