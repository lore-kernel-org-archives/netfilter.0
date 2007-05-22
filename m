From: Andre =?iso-8859-1?q?Guimar=E3es?= <ramoni@databras.com.br>
Subject: Re: NAT addresses - RFC or tradition?
Date: Tue, 22 May 2007 16:46:25 -0300
Message-ID: <200705221646.25925.ramoni@databras.com.br>
References: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
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

It's quite simple.
You're using public IPs in your internal networks.
Some of these IPs may exist and have an owner an maybe even a web site.
You'll be in trouble in the day you wish to acess one of these IPs on the=20
internet because you won't reach them because you have them on your network=
=20
and so won't route the packets to the internet.

The IP's in fact, don't have any thing different, so you can use them and=20
iptables will not have any problems. It's just a route problem, that as you=
=20
chose to use these IP's, you won't be able to reach these real public IP's =
in=20
the internet.

Sorry for the bad english.

On Tuesday 22 May 2007 16:26, Paul Blond=E9 wrote:
> I've noticed that a lot of people use the 192.168.X.X subnet for internal
> networks, is this (and the less-used 10-series) a requirement of some RFC,
> or a recommendation that has become tradition?
>
> We are using a completely different subnet, something similar to (for
> example) 42.127.129.X to further obfuscate the internal network from
> outside. This, and many other examples, produces a class-A subnet mask
> (some produce a class-B) when entered in WinXP's TCP/IP dialog, although
> the actual mask we use with it is class-C.
>
> Is this a no-no? Will it break our server's IPTables when communicating
> with it? Am I in for a lot of trouble? The addresses don't seem to cause
> any problems, but I don't want this to jump up and bite us in the bottom
> sometime down the road.
>
>
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> Paul Blond=E9

=2D-=20
Andr=E9 Guimar=E3es
Databras Inform=E1tica
Matriz RJ - 55 (21) 2518-2363
=46ilial ES - 55 (27) 3233-0098
http://www.databras.com.br

