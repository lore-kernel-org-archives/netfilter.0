From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to start external script when ipfilter rule matches
Date: Sat, 14 Aug 2004 12:20:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408141220.03743.Antony@Soft-Solutions.co.uk>
References: <20040806042631.5824.39404.Mailman@vishnu.netfilter.org> <1089.216.239.71.162.1091820833.squirrel@216.239.71.162> <411DF2E0.3020304@web.de>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <411DF2E0.3020304@web.de>
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

On Saturday 14 August 2004 12:09 pm, S=F6ren Lorenz wrote:

> Samuel Jean schrieb:
> >That's not netfilter/iptables job. inetd better suits to your needs.
> >I don't know much about Squid, but I guess it supports inetd.
>
> No, it doesn't. It needs to bind the port directly, no way to run it vi=
a
> inetd.

Indeed!   The idea of spawning Squid from inetd is horrible :(

> >>When the router disconnects from my ISP, Squid is shutdown again.
> >
> >Again, not iptables/netfilter. Inetd can.
>
> Come on, there must be a way to trigger userspace actions on netfilter
> matches. Some people do realtime blacklisting on portscanning IPs. I'm
> looking for a lightweight (router suitable) way to do this. Solutions
> depending on Perl are not an option.

Try investigating the ULOG target perhaps?

Antony.

--=20
"Reports that say that something hasn't happened are always interesting t=
o me,=20
because as we know, there are known knowns; there are things we know we k=
now.=20
We also know there are known unknowns; that is to say we know there are s=
ome=20
things we do not know. But there are also unknown unknowns - the ones we=20
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


