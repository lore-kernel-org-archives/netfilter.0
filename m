From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: curious about address specification and port specification
Date: Wed, 9 Oct 2002 22:13:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021009211337.KJPF459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210090709200.13728-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210090709200.13728-100000@localhost.localdomain>
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

On Wednesday 09 October 2002 12:14 pm, Robert P. J. Day wrote:

>   more annoying questions, before i head out for the day:
>
> 1) is there anything meaningful about some sample address filter
>    clauses i've seen that read "-s 0/0" or "-d 0/0"?

No, this is not meaningful, and in my opinion should be removed from rules 
because it only clutters them up and serves to confuse peope about what it 
might mean.

>    doesn't
>    this just mean no filtering on either source or destination?
>    is there any value to these matches other than making it
>    explicitly clear that no address filtering is being done?

No.   -s 0/0 means "any source", and -d 0/0 means "any destination".

> 2) in all of the docs i've read, the claim is that port matching is
>    an implicit match within either UDP or TCP matching and that you
>    *must* specify a protocol before you're allowed to specify ports.

This is correct.   The --dport or --sport options are invalid without also 
specifying -p tcp or -p udp

>    however, i've certainly seen and used rules that refer to a port
>    or ports without first specifying a protocol.  is the documentation
>    just misleading here?

Can you give an example of a rule which works, and which specified a port but 
not a protocol ?

Antony.

-- 

Which part of 'apt-get dist-upgrade' do you not understand ???

