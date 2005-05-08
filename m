From: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Subject: Re: How to masquerade when using ROUTE
Date: Sun, 8 May 2005 18:12:21 -0300
Message-ID: <f48e768e0505081412da12405@mail.gmail.com>
References: <427D52FA.8020805@fabian-wolter.de>
	<f48e768e05050807559b74d35@mail.gmail.com>
	<427E3CDE.1030008@fabian-wolter.de>
Reply-To: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427E3CDE.1030008@fabian-wolter.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Fabian Wolter <netfilter-ml@fabian-wolter.de>
Cc: netfilter@lists.netfilter.org

On 5/8/05, Fabian Wolter <netfilter-ml@fabian-wolter.de> wrote:
> Hi,
>=20
> Glaucius Djalma Pereira Junior wrote:
> > 1) create an entry in /etc/iproute2/rt_tables
> >
> > echo "200            fabian
>=20
> I named it mail.out.
>=20
> # echo "200     mail.out" >>/etc/iproute2/rt_tables
>=20
> > 2) create the route default to route fabian
> > ip route add default via x.x.x.x dev ethX table fabian
>=20
> I think you meant ppp1 instead of ethX?
>=20
> # ip route add default via 217.5.98.57 dev eth0 table mail.out
> RTNETLINK answers: Network is unreachable
> # ip route add default via 217.5.98.57 dev ppp1 table mail.out
> #
>=20
> 217.5.98.57 is my default gateway on ppp1.
>=20
> # route
> [...]
> 217.5.98.57     *           255.255.255.255 UH    0      0        0 ppp1
> [...]
>=20
> > ip rule add from fwmark 3 lookup fabian prio 1
>=20
> I had to remove the string "from". Then I could apply it without any
> error messages.
>=20
> I did the other steps as you said. But tcpdump on ppp1 shows no traffic
> and in syslog the following message appears:

hummm, but no errors has happened when you did it ?

try to test it using the CHAIN OUTPUT, just packets from your host

if you need help, I can help you, take my MSN -> glauciusjunior@hotmail.com

best regards !!!


>=20
> May  8 17:55:20 eis kernel: MASQUERADE: Route sent us somewhere else.
>=20
> Regards,
> Fabian
>=20
>=20


--=20
Glaucius Djalma Pereira Junior
glaucius@gmail.com

