From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Multiple Port Forwarding
Date: Thu, 19 Aug 2004 19:40:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408191940.59077.Alistair@nerdnet.ca>
References: <001401c48633$600ec010$0400a8c0@icbmwxph>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c48633$600ec010$0400a8c0@icbmwxph>
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

On August 19, 2004 05:27 pm, Scorched wrote:
> I found this group on google looking for how to do multiple port forwardi=
ng
> (I'm trying to setup so me and a friend can play Starcraft together on the
> same connection [with different CD keys though, got two copies of the

	<snippage>

> sorry for this possibly "bad title"
>
> but i=B4ve got a question regarding port forwarding and iptables
> (i hope this question hasn=B4t been asked so much *gg)
>
> is it possible to forward one port on the firewall to different clients?
>
	Certainly it is *possible* -- and would be rather complex,
	but you likely do not want to forward each packet to every client inside
	the firewall.

	What you want is a proxy server for the game protocol,
	if what you are attempting to do is have outside game clients connect
	to your inside game.

	Not something that iptables can do.  However, ... outbound connections
	from a lot of games to servers outside the firewall will work just fine, w=
ith
	ESTABLISHED, RELATED rules.

	If you have *one* client inside that will be hosting the game, it is doabl=
e,
	and in that case the second, and successive clients inside the firewall=20
	would connect directly to the INSIDE address of the (server) copy of the=20
	game.  In THIS case you need to know details of the connection between=20
	clients and server versions -- i.e. port numbers, protocols, and whatnot,
	and set up appropriate ACCEPT and REDIRECT rules.
=09

	If what you are trying to do is have two games behind your firewall connect
	to each other in different network segments, ... we'd need more detail, bu=
t=20
	it should be doable in FORWARDING and -t nat PREROUTING etc....


	Now ... Battlenet ... anyone care to write a conntrack/nat module for=20
that ???  { yes ...  I KNOW the module rules!!!!}

	*grin*

	Alistair Tonner
=09

