From: nadim <nadim@khemir.net>
Subject: Re: Primordial tool missing
Date: Fri, 13 Aug 2004 10:13:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408131013.10490.nadim@khemir.net>
References: <200408120947.40823.nadim@khemir.net> <00bf01c480a4$31863f50$a900a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00bf01c480a4$31863f50$a900a8c0@cybergeneration.com>
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

Thanks for your answer (you too Jason) but I still think the tool _is_=20
primordial. Fideling with the rules and tailing the log is about as close a=
=20
"last resort" as can be. One might also want to try different setups of=20
rules, etc...

Now I have no ideas of how iptables works and I don't have time to dig into=
=20
all the details but if someone gives me a hand, I'll write a perl script.

Cheers, Nadim.

On Thursday 12 August 2004 21:40, Maxime Ducharme wrote:
> Hey Nadim
>
> I suggest that you use logging mechaninsm of iptables,
> put -j LOG lines in many tables, it will allow you to "see"
> the packets going trough tables and chains.
>
> By default packets are logged in /var/log/messages
>
> a good schema on how it works :
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGO=
=46T
>ABLES
>
> a good example script of -j LOG :
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#INCLUDE.TES=
TT
>ABLES
>
> (option "--log-prefix" is important here to know where you are)
>
> I also suggest that you dont drop a packet before logging it,
> you may add a logging rule to every DROP or REJECT
> rules you may have in your configuration. It also helps
> to know where the packet have been dropped.
>
> Hope this helps
>
> Have a nice day
>
> Maxime Ducharme
> Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau
>
> ----- Original Message -----
> From: "nadim" <nadim@khemir.net>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, August 12, 2004 3:47 AM
> Subject: Primordial tool missing
>
> > Hi,
> >
> > For you gurus this might be superfluous but for the lambda user a tool
>
> which
>
> > given an input packet (xxx.xxx.xxx.xxx:tcp:25) and a set of rules, show
>
> how
>
> > the packet goes from one rule to the other and finally make it to it's
> > destination , gets tansformed or dropped.
> >
> > This would help enormously in understanding how this stuff works (no it=
's
>
> not
>
> > that obvious) and I also think it would be a great help when adding
> > rules.
> >
> > Does such a utility exist?
> >
> > Cheers, Nadim.

