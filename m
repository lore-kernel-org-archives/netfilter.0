From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Multi Addressing... is it possible ?
Date: Fri, 30 Apr 2004 16:12:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083355935.10249.51.camel@localhost>
References: <0776B9DA384FFB4C94A6B73F7DC87A6003F35C83@newman.p21.com>
	 <1083355131.4092affc02756@sistemica.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083355131.4092affc02756@sistemica.info>
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
To: Rhaoni Chiu Pereira <rhaoni@sistemica.info>
Cc: Aldo Lagana <ALagana@p21.com>, netfilter@lists.netfilter.org

It is the ESP form of IPSec and, you are correct, it does not use a
port.  You would simply specify the protocol, e.g.,=20
iptables -t nat -I PREROUTING -d 129.37.0.111 -p 50 -j ACCEPT
You may find it helpful to run through an iptables tutorial.  I found
Oskar Andreasson's (listed on the netfilter.org site) to be very
helpful.  There is also a slide show on using iptables in the training
section on http://iscs.sourceforge.net
Good luck - John

On Fri, 2004-04-30 at 15:58, Rhaoni Chiu Pereira wrote:
> Hi List,
>=20
>      Aldo, thanks for the tip... I didn't know about the -I parameter... =
I still
> have a doubt about a protocol type, I received a documentation of some ru=
les
> that I have to create in my firewall and it has a ESP(50) Protocol and no=
 port
> listed so I don't know how to make it using iptables! Does anyone know  w=
hat is
> this ESP(50) Protocol ?
>=20
> Atenciosamente,
>=20
> Rhaoni Chiu Pereira
> Sist=C3=AAmica Computadores
>=20
> Visite-nos na Web: http://sistemica.info
> Fone/Fax : +55 51 3328 1122
>=20
>=20
>=20
> Citando Aldo Lagana <ALagana@p21.com>:
>=20
<snip>
--=20
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


