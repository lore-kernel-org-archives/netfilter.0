From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: NAT only - No connection tracking
Date: 12 Nov 2002 12:14:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037099676.12587.8.camel@hope>
References: <20021111192103.14755.qmail@web40910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021111192103.14755.qmail@web40910.mail.yahoo.com>
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
To: Brad Chapman <kakadu_croc@yahoo.com>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Mon, 2002-11-11 at 20:21, Brad Chapman wrote:
> 
> Basically, if this person wants to do NAT, he has to do connection tracking as well.
> LYSB, he doesn't have to run ctrack without NAT, but without ctrack the current
> implementation of NAT in netfilter won't work. If there are other stateless NAT
> kernel implementations available that attach to netfilter, then I am currently
> unaware of them.
> 
Hi Brad & Antony,

There is one other way to do NAT without connection tracking - this is
even possible on 2.2 kernels. There is some NAT functionality in the
routing code (policy routing, advanced routing).

This is a form of NAT where only the IP addresses in the IP header
are changed, no data inside the packet payload is inspected or changed.
Also, there is no automatic retranslation of return packets, like with
iptables.

The syntax is a little different and takes some time to get used to;
basically you get something like this:

ip rule add from 192.168.1.32/27 nat 10.1.1.32 prio 14000
ip route add nat 10.1.1.32/27 via 192.168.1.32

to set up NAT rules.

For more info, see the iproute documentations. I can also recommend
the book "Policy Routing with Linux" by Matthew G. Marsh, who is also
a contributor on this list.

The book is being released online at http://www.policyrouting.org/,
but is definately worth the buy.

Regards,
Filip





