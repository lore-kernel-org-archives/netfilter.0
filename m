From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: configuration again :)
Date: Wed, 23 Jun 2004 12:49:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231249.12949.Antony@Soft-Solutions.co.uk>
References: <20040622115422.45768.qmail@web20027.mail.yahoo.com> <200406231005.35837.Antony@Soft-Solutions.co.uk> <40D972C6.9020403@o2.pl>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D972C6.9020403@o2.pl>
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

On Wednesday 23 June 2004 1:08 pm, Krystian wrote:

> >Which of the tutorials or HOWTOs at http://www.netfilter.org/documentation
> >have you read and had problems in following the advice from?
>
> Almost all, but I had doubts the configuration i came up with would work.

No harm in trying it to see whether it does, and then asking us a specific 
question if you have problems...  :)

> so teoreticly :)
> for every IP i will need 2 rules for my linux box: one for DNAT'ing
> incomming traffic and one for SNAT'ing outgoing one.

You need a DNAT rule (only) if you want to allow connections *to* the machine 
on your network (reply packets will work automatically).

You do not need an SNAT rule unless you want connections *from* the machine in 
your network to appear from a specific address (otherwise they would get 
handled just the same as any other packets from internal machines to the 
Internet - I presume you have a general-purpose MASQUERADE rule for these).

> but i'm not sure my linux box will receive the traffic destined for
> other ip's in the network without subinterfaces configured to those ip's.

Correct - you have to add the extra public IP addresses which you want the 
firewall to accept packets for (and pass them on to something inside your 
network) to your external interface:

ip addr add 11.22.33.44 dev eth0

etc.

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


