From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: [LARTC] Keeping state for multiple default routes
Date: Thu, 8 Dec 2005 11:42:47 -0400
Message-ID: <65aa6af90512080742j553bfaaar786aa626fc85b1e4@mail.gmail.com>
References: <Pine.LNX.4.63.0512080925120.11061@charmed.internetsolver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0512080925120.11061@charmed.internetsolver.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

The problem is "probably" that the host is changing the route to go to a ho=
st x.

The host keeps a cache (the routing cache) where it stores through
what interface, ip blah blah the host reached another host. This is
kept alive for a while, and then flushed to make another routing
decision to the same destination host.

Probably that's why ssh could get "hung" anytime.

On 12/8/05, Dave Weis <djweis@internetsolver.com> wrote:
>
> I have a machine with two routes to the internet doing load balancing on
> the connections and NAT for internal machines. For inbound ssh connection=
s
> and outbound connections to anything, it will occasionally "lose" packets=
.
> If I Control-C out of ssh and try again, it usually works, but not always=
.
> After a few tries it does connect, but frequently stalls and hangs
> permanently. I did add rules to try and keep connections stuck where they
> started:
>
> ip rule add from 200.200.200.1 table eth1
> ip rule add from 192.168.0.2 table eth2
>
> In /etc/iproute2/rt_tables:
> 201 eth1
> 202 eth2
>
> ip rule list does show the rules:
> 0:      from all lookup local
> 32764:  from 192.168.0.2 lookup eth2
> 32765:  from 200.200.200.1 lookup eth1
> 32766:  from all lookup main
> 32767:  from all lookup default
>
> Is there some other command I can use to see if they really are sticking
> where they should?
>
> Thanks
> dave
>
>
> --
> Dave Weis
> djweis@internetsolver.com
> http://www.internetsolver.com/
>
> _______________________________________________
> LARTC mailing list
> LARTC@mailman.ds9a.nl
> http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
>

