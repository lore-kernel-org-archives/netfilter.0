From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Let me understand *RETURN*
Date: Fri, 18 Feb 2005 18:59:23 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502181857270.12098-100000@darkstar.sysinfo.com>
References: <42163444.70206@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42163444.70206@lopsch.com>
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
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Daniel Lopes <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org


	[SNIP]

>=20
> iptables -N rule1
> iptables -A rule1 -j RETURN
> iptables -N rule2
> iptables -A rule2 -j RETURN
> iptables -N rule3
> iptables -A rule3 -j RETURN
>=20
> So now every packet destined for the local machine always wents through=
=20
> the INPUT chain. The default policy is set to drop.
> Now let=C2=B4s say there=C2=B4s a packet for the local machine. It went=
=C2=B4s to the=20
> INPUT chain. The INPUT chain sends it to rule1. In rule one the RETURN=20
> traget sends it back to the INPUT chain. The INPUT chain sends it to=20
> rule2. Rule2 sends it back to the INPUT chain and so on till it is=20
> droppped by the default policy.
>=20
> iptables -P INPUT DROP
>=20
> iptables -A INPUT -j rule1
>=20
> iptables -N rule1
> iptables -A rule1 -j rule2
> iptables -N rule2
> iptables -A rule2 -j RETURN
> iptables -N rule1
> iptables -A rule1 -j RETURN
>=20
> Again the INPUT chain sends it to rule1. Rule1 sends it to rule2. Rule2=
=20
> sends it via RETURN back to rule1 and rule1 back to INPUT chain where i=
t=20
> is dropped via default policy.
>=20
> I hope this will help you. You can see RETURN always sends a packet bac=
k=20
> to the outer chain from where it was send to the actual chain.
>=20
>=20


It was my understanding that a user chain could not jump to another user
chain, that this was only allowed in the default chains <input, output an=
d
forward>?

Thanks,


Ron DuFresne
--=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


