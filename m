From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 02 Feb 2005 10:48:35 +0100
Message-ID: <4200A1F3.8030609@imag.fr>
References: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Herv=E9?= <herve@lucidia.net>, netfilter@lists.netfilter.org

Herv=E9 wrote:
> Hello,
>=20
> I have a weird setup I would like to make work: I have two identical
> subnets connected to one machine via two different NICs, like this:
>=20
> Server             |         | Client 1
> eth0:192.168.100.1 |---------| 192.168.100.2
>                    |                              | Client 2
> eth1:192.168.100.1 |------------------------------| 192.168.100.2

having 2 interfaces on the same box with the same IP address

repeat after me :

WILL NOT WORK

>=20
> These two machines only access an NFS share on the server, but I assume
> this is irrelevant: the problem is to route the packets back through th=
e
> interface the request came from (I am not trying to access the boxes
> _from_ the server).
>=20
> My first idea was to modify the source address as the request come in, =
and
> then route and put the original address back in the outgoing packet, bu=
t I
> haven't found a way to do that.
>=20
> Anybody got any idea?
>=20
> Thanks in advance,
> Herv=E9.
>=20


