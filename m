From: Eddahbi Karim <installation_fault_association@yahoo.fr>
Subject: Re: UDP connections and Conntrack...
Date: Wed, 07 Jan 2004 14:33:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073482399.9732.10.camel@gamux>
References: <Pine.LNX.4.33.0401071011330.18324-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0401071011330.18324-100000@blackhole.kfki.hu>
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

Le mer 07/01/2004 =E0 10:13, Jozsef Kadlecsik a =E9crit :
> On Tue, 6 Jan 2004, Eddahbi Karim wrote:
>=20
> > Ok, so the state of the connection change in the nat table of the OUTPUT
> > Chain ?
>=20
> Why should the state of the connection change in the nat table?
>                             ^^^^^^^^^^               ^^^
> State changes happen in connection tracking itself.
>=20

Conntrack and nat are bound.

The connection state change at the nat table of the PREROUTING chain and
at the nat table of the OUTPUT chain.

Btw Iptables for IPv6 doesn't have any conntrack for the moment ;-).

--=20
--
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France


