From: Eric Leblond <regit@inl.fr>
Subject: Re: logging of successful tcp connections
Date: Fri, 22 Apr 2005 17:14:14 +0200
Message-ID: <1114182854.7835.1.camel@localhost.localdomain>
References: <F97948CF897D7B46802A18845A8B9BFD471A31@us-rich-m01.global.tektronix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F97948CF897D7B46802A18845A8B9BFD471A31@us-rich-m01.global.tektronix.net>
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
To: christopher.f.ulherr@exgate.tek.com
Cc: netfilter@lists.netfilter.org

Le jeudi 21 avril 2005 =E0 09:38 -0700,
christopher.f.ulherr@exgate.tek.com a =E9crit :
> I would like to know if there is a way I can log only successful tcp
> connections. I'm only interested in successful (established)
> connections, and not just syn "connection attempts". I guess what I need
> is a way to log a single packet if it caused a state transition from NEW
> to ESTABLISHED. It would also be helpful to log the packet that
> terminated the connection (state change from established).=20

Have a look at :
	http://regit.free.fr/nufw/content.php?article.11
We used this in the NuFW project(http://www.nufw.org) to track the state
of connections.

> In this
> manner, we could easily tell what connections were made, and their
> duration (and not rely on the userland application to log this info).
>=20
> I've looked into using the state matching, but couldn't achieve this
> specific functionality with that.
>=20
>=20
> Is there some trivial way to accomplish this I am overlooking?
>=20
>=20
> Thanks,
> Chris
>=20


