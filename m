From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 15:15:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051515.hA5FFBr13175@agate.rockstone.co.uk>
References: <60101.200.180.170.253.1068041679.squirrel@www.alcidesmaya.com.br> <200311051419.hA5EJtr13138@agate.rockstone.co.uk> <60242.200.180.170.253.1068043446.squirrel@www.alcidesmaya.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <60242.200.180.170.253.1068043446.squirrel@www.alcidesmaya.com.br>
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
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

On Wednesday 05 November 2003 2:44 pm, Leandro Takashi Hirano wrote:

> > 2. One packet per second will be ACCEPTed.   What happens to the othe=
r
> > packets (and whether anything gets returned to the scanner) depends o=
n
> > the  other rules following this one in the chain.
>
> OK, one packet per second will be ACCEPTed, but aren=B4t the other pack=
ets
> going to be DROPed?

As I said, that depends on what rules follow this one in the chain.   You=
 can=20
DROP the packets, you can REJECT the packets - you can even ACCEPT them i=
f=20
you want to!

> > 3. The rule only applies to packets with RST set, and SYN, ACK, FIN
> > clear.    Therefore it will incfluence the outcome of a RST port scan=
,
> > but have no  effect on a FIN scan, or a SYN scan.
>
> Do I have also to create a rule for FIN scan and SYN scan?

If you want to block those types of scan, then yes.

> Do you have some port scanners rules to show me? (and other protection
> rules too)

Tell me what you want to do and I may be able to show you a rule which do=
es=20
it.

Personally I simply DROP all packets which I don't want to allow.

> > I think in order to answer your question we first need to know:
> >
> >  - what response do you want someone to get when they attempt to port
> > scan your system?
>
> no answer....

Okay.

Antony.

--=20

I love deadlines.   I love the whooshing noise they make as they go by.

 - Douglas Noel Adams
                                                     Please reply to the =
list;
                                                           please don't C=
C me.

