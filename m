From: David Cannings <lists@edeca.net>
Subject: Re: INCOMPLETE [ 8bytes] with two src addresses!
Date: Fri, 27 Feb 2004 19:33:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402271933.01977.lists@edeca.net>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com> <1077907260.1647.18.camel@pepelui.baicom> <1077909472.2526.54.camel@anduril.intranet.cartel-securite.net>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077909472.2526.54.camel@anduril.intranet.cartel-securite.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday 27 February 2004 19:17, Cedric Blancher wrote:
> Le ven 27/02/2004 =E0 19:41, Alexis a =E9crit :
> > in traceroute ttl=3D1 is only for the first packet (thats what i said
> > about the first step)
>
> Yep, but...
> The router which has raised the TTL exceeded error always receive the
> packet with TTL=3D1. So, when you get an ICMP TTL exceeded, the TTL in
> the citation is always 1 (well, should be).

Unless the router is decrementing the TTL field by more than 1 for each=20
packet.  For example, if it decrements by 5 and it receives any packet=20
with a TTL <=3D 4, it will raise TTL exceeded.

I believe this is possible, but most likely not common.

David

