From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: RE: Chain Policy DROP versus ACCEPT and logging
Date: Mon, 13 Oct 2003 21:01:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066093284.21277.10.camel@tarkus>
References: <7A3B4AA360FDEF448F3390421FC8D731F419BF@coxhpexg.coxhp.com>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <7A3B4AA360FDEF448F3390421FC8D731F419BF@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com
Cc: blancher@cartel-securite.fr, netfilter@lists.netfilter.org

And that applies to when default input and forward policies are drop?
Having a hard time grasping that in my brain, but I do believe I may =
be
overheating a few neurons :-)

Ted

On Mon, 2003-10-13 at 11:54, bmcdowell@coxhealthplans.com wrote:
> I may be a little late chiming in on this, but personally my rules =
use a 'BAD' chain.  That chain ends with the LOG and DROP just like a=
 normal appended chain.  The difference is, I can explicitly deny thi=
ngs by sending them to -j BAD.
>=20
> I do the same with -j GOOD, and then run sanity checks against the =
packet  -sending some stuff to BAD before it actually hits the ACCEPT=
.
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Cedric Bla=
ncher
> Sent: Sunday, October 12, 2003 10:12 AM
> To: tedkaz@optonline.net
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Chain Policy DROP versus ACCEPT and logging
>=20
>=20
> Le dim 12/10/2003 =E0 16:00, Ted Kaczmarek a =E9crit :
> > Is their a way to log the default INPUT and FORWARD policies for =
dropped
> > packets with them set to DROP as opposed to having them set to AC=
CEPT
> > and putting in logs for any deny rules.
>=20
> Logging in Netfilter does not behave as it used to with ipchains. Y=
ou
> cannot log and drop within the same rule. Suppose you want to log a=
nd
> drop all UDP traffic :
>=20
> =09iptables -A INPUT -p udp -j LOG --log-prefix "UDP dropped : "
> =09iptables -A INPUT -p udp -j DROP
>=20
> LOG is a target (non terminating one).
>=20
> This said, if you want to log packets that hit chain policy, then y=
ou
> have to put a logging rule at the very end of the chain :
>=20
> =09iptables -A INPUT -j LOG "INPUT chain policy drop : "
>=20
> And you're done.



