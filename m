From: nadim <nadim@khemir.net>
Subject: Re: How to start external script when ipfilter rule matches
Date: Sat, 7 Aug 2004 00:17:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408070017.29454.nadim@khemir.net>
References: <20040806042631.5824.39404.Mailman@vishnu.netfilter.org> <1089.216.239.71.162.1091820833.squirrel@216.239.71.162>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089.216.239.71.162.1091820833.squirrel@216.239.71.162>
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

I'm a complete noob so I am certainly wrong. I posted a question a few da=
ys=20
ago about IPQ (that no one bothered to answer :-( ).

Isn't ipq what S=F6ren is trying to come to?

here is a link to what can be done friom perl:
http://michael.toren.net/slides/ipqueue/

Am I getting all wrong?

Cheersn, Nadim.

On Friday 06 August 2004 21:33, Samuel Jean wrote:
> > Date: Thu, 05 Aug 2004 22:39:51 +0200
> > From: S=F6ren Lorenz <soeren.lorenz@web.de>
> >
> > I'd like to start Squid when packets arrive on port 3128 on my router=
=2E
>
> That's not netfilter/iptables job. inetd better suits to your needs.
> I don't know much about Squid, but I guess it supports inetd.
>
> > When the router disconnects from my ISP, Squid is shutdown again.
>
> If that isn't a question, goto CONTINUE
>
> As you seem to be using PPP connection, I'd consider using
> /etc/ppp/ip-down bash script which is launched after successfull
> disconnection process.
>
> :CONTINUE
> :
> > Ideally the packets would be kept on hold until Squid is running and
> > then delivered to the daemon. Another question is to shutdown squid
> > after a certain time of inactivity on port 3128. Is there a way to
> > achive this with ipfilter?
>
> Again, not iptables/netfilter. Inetd can.
>
> > Thanks in advance.
> >
> > Regards,
> >
> > S=F6ren Lorenz
>
> Hope this helps.

