From: Eddahbi Karim <installation_fault_association@yahoo.fr>
Subject: Re: UDP connections and Conntrack...
Date: Wed, 07 Jan 2004 17:23:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073492589.9732.16.camel@gamux>
References: <Pine.LNX.4.33.0401071254170.18324-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0401071254170.18324-100000@blackhole.kfki.hu>
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

Le mer 07/01/2004 =E0 12:57, Jozsef Kadlecsik a =E9crit :
> On Wed, 7 Jan 2004, Eddahbi Karim wrote:
>=20
> > The connection state change at the nat table of the PREROUTING chain and
> > at the nat table of the OUTPUT chain.
>=20
> False. Check the source code.

After checking the source code, I can see that the two principals hooks
are on these chain.

/* Connection tracking may drop packets, but never alters them, so
   make it the first hook. */
static struct nf_hook_ops ip_conntrack_in_ops =3D {
	.hook		=3D ip_conntrack_in,
	.owner		=3D THIS_MODULE,
	.pf		=3D PF_INET,
	.hooknum	=3D NF_IP_PRE_ROUTING,
	.priority	=3D NF_IP_PRI_CONNTRACK,
};

static struct nf_hook_ops ip_conntrack_local_out_ops =3D {
	.hook		=3D ip_conntrack_local,
	.owner		=3D THIS_MODULE,
	.pf		=3D PF_INET,
	.hooknum	=3D NF_IP_LOCAL_OUT,
	.priority	=3D NF_IP_PRI_CONNTRACK,
};

Now, I can't really bet these hooks are on the nat table but conntrack
and nat are very related.

I get the information here :
http://iptables-tutorial.frozentux.net/chunkyhtml/statemachine.html
There's another explanation here :
http://www.sns.ias.edu/~jns/security/iptables/iptables_conntrack.html

If I'm wrong, I want to have a proof...

>=20
> > Btw Iptables for IPv6 doesn't have any conntrack for the moment ;-).
>=20
> There is an experimental code which you can find in the mailing list
> archives. It's not in p-o-m yet.
>=20

Ok thanks :),

--=20
--
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France


