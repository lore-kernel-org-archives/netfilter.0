From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: What ICMP packets does state RELATED allow?
Date: Thu, 6 Jun 2002 09:55:09 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJAEFPDOAA.jpatterson@asgardgroup.com>
References: <Pine.LNX.4.33.0206061348270.2335-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0206061348270.2335-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

That's interesting...  I guess it could make sense... sort of...

but, to be really obnoxious about it, I would think it would make sense to
have rules such as:

for IF in `ifconfig | cut -d " " -f 1 | grep -v ^$`; do
	$IPT -A INPUT -p icmp --icmp-type 5 -m state --state RELATED -i $IF -s `ip
addr ls dev $IF | grep inet | cut -d " " -f 6` -j ACCEPT
done

and

$IPT -A FORWARD -p icmp --icmp-type 5 -j DROP

on the basis of my belief that you should never ever have a redirect
crossing a router, but you *may* want to accept redirects from local
gateways...

Any thoughts?

-Joe

> -----Original Message-----
> From: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]
> Sent: Thursday, June 06, 2002 7:51 AM
> To: Joe Patterson
> Cc: Nick Drage; netfilter@lists.samba.org
> Subject: RE: What ICMP packets does state RELATED allow?
>
>
> On Wed, 5 Jun 2002, Joe Patterson wrote:
>
> > although, in the case of the question that Nathan asked, my
> answer didn't
> > address those particular packet types.  My suspicion is that
> source quench
> > is treated as related, because it should be.  Redirects are
> somewhat more
> > tricky.  They *should* never be routed, because routing them
> makes no sense.
> > I think that they often are anyway, since pure routers don't
> want to spend
> > the effort to care.  I would posit that in general, a firewall,
> which by its
> > nature *can* spend the effort to care, should never forward
> them.  If I'm
> > reading the rfc's correctly, a gateway should not send an icmp
> redirect to a
> > source address that is not on a directly attached network.
> Furthermore, a
> > host that recieves a redirect from *either* 1) a gateway that is not the
> > gateway that it would route the packet that caused the redirect
> to in the
> > first place or 2) a gateway that is not on a directly connected network,
> > then that host should ignore the redirect entirely.
>
> According to the source code, the following ICMP messages are treated as
> RELATED (if the payload matches one of the already existing connection):
>
> destination-ureachable
> source-quench
> time-exceeded
> paremeterproblem
> redirect
>
> Regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> WWW-Home: http://www.kfki.hu/~kadlec
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>
>
>


