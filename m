From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: curious about address specification and port specification
Date: Thu, 10 Oct 2002 07:30:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021010063004.WOUQ7631.mta03-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210091755001.17555-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210091755001.17555-100000@localhost.localdomain>
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

On Wednesday 09 October 2002 10:57 pm, Robert P. J. Day wrote:

> On Wed, 9 Oct 2002, Antony Stone wrote:

> > The --dport or --sport options are invalid without
> > also specifying -p tcp or -p udp
> >
> > Can you give an example of a rule which works, and which specified a port
> > but not a protocol ?
>
> just the other day, i was at a local LUG meeting and a guy was giving a
> quick tutorial on iptables and displayed a sample rule file that contained
> the rule:
>
>   iptables -A FORWARD --destination 172.16.0.2 --destination-port 25  \
> --jump ACCEPT
>
>   doesn't this represent an example of what i was asking about?  a
> reference to a port with no reference to protocol.

Yes, it does.   However, I do not believe it is an example of a rule which 
works.   Try it on a netfilter machine and see.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

