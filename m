From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: http acces
Date: Fri, 21 Nov 2003 11:37:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211137.hALBbt724587@onyx.rockstone.co.uk>
References: <1069364822.3fbd3656723b4@roma-hme1> <200311202254.hAKMss723777@onyx.rockstone.co.uk> <1069411624.3fbded284f7f1@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069411624.3fbded284f7f1@paris-hme1>
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

On Friday 21 November 2003 10:47 am, skydive wrote:

> C=F3pia Antony Stone <Antony@Soft-Solutions.co.uk>:

> > See if
> > http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html
> > answers your question.
> >
> > Antony.

> ok.. i got it to work just fine. although i need 3
> rules: 1 prerouting,1 forward, 1 postrouting!

Indeed.   NAT rules between machines on a single network are always a bit=
=20
messy, and have the possibly undesirable side-effect that the server thin=
ks=20
all the connections are coming from the Firewall - although if this doesn=
't=20
matter, then things work fine once you've worked out that packets have to=
 be=20
NATted in both directions between client and server.

> danke !

Bitte :)

Antony.

--=20

Wanted: telepath.   You know where to apply.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.

