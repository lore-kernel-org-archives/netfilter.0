From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: Reading /proc/net/ip_conntrack still slow / causing packet loss?
Date: Tue, 14 Feb 2006 20:51:04 +0100
Message-ID: <200602142051.05801@krak>
References: <20060214173923.GN16512@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060214173923.GN16512@edu.joroinen.fi>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: Pasi =?iso-8859-1?q?K=E4rkk=E4inen?= <pasik@iki.fi>


  Hi,

On Tuesday 14 February 2006 18:39, Pasi K=E4rkk=E4inen wrote:
> "<Gandalf> cap_: the most extreme experience I have is reading
> /proc/net/ip_conntrack on a fairly busy router... that really slows
> wthings down and packets get dropped because of the slowdown"
>
> "<Gandalf> and I had an identd daemon wich forwarding support that read
> /p/n/ip_conntrack for each incoming ident request... 200ms forwarding
> delays and lots of drops each time an ident request came in :)"
>
> Is that information still valid for the current 2.6 kernels? How about
> for 2.4 ?

  Yes, it's still valid (on both versions). However, on recent 2.6 kernels=
=20
you can do all kinds of funny things through netlink. An example of what=20
can be done through that interface is the 'conntrack' tool:

  http://netfilter.org/projects/conntrack/index.html

  For the API:

  http://netfilter.org/projects/libnetfilter_conntrack/index.html

  Please note that both of these is still work in progress, but they're=20
definitely worth a try.

=2D-=20
 KOVACS Krisztian

