From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newbie Question -forcing to pass in squid
Date: Mon, 14 Oct 2002 10:10:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021014091027.ROSG459.mta02-svc.ntlworld.com@there>
References: <1034560988.10075.15.camel@pegasus.gral.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034560988.10075.15.camel@pegasus.gral.com.br>
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

On Monday 14 October 2002 3:03 am, Fl=E1vio Brito wrote:

> Dear Friends
>
> I have two machines, and I trying to force all port 80 traffic to pass
> in SQUID 3128. But when people unset proxy in browser, they bypass SQUID
> to the Internet . I cannot put transparent proxy, because SQUID is
> authenticating.

I don't see why Squid Authentication stops you from setting netfilter to do=
=20
transparent proxying.

Anyway, to solve your problem, block access from all machines except your=20
Squid to external TCP port 80.

iptables -A FORWARD -s ! a.b.c.d -p tcp --dport 80 -o ethx -j DROP

where a.b.c.d is the address of the squid machine and ethx is your external=
=20
interface.

Antony.

--=20

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

