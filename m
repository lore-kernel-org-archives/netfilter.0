From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: firewall rules for subinterfaces
Date: Fri, 15 Oct 2004 16:44:56 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097851496.2705.16.camel@anduril.intranet.cartel-securite.net>
References: <20041015035535.GA19170@clifford.headnut.org>
	<416FCE80.9090801@pbl.ca>  <416FDDEA.20209@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <416FDDEA.20209@pobox.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Andre Correa <andre.correa@pobox.com>
Cc: netfilter@lists.netfilter.org

Le ven 15/10/2004 =E0 16:25, Andre Correa a =E9crit :
> Hi, there is really no meaning on setting rules for subinterfaces, If=20
> you need to segment your network and can't plug new NICs look for VLANs.=20
> You can apply rules indicating VLAN interfaces (-i and -o) like this:=20
> eth0.100, eth0.200, etc...

Definitly true.
Different IP addresses spaces on the same ethernet segment are a joke to
fool.

> Somebody correct me if I'm wrong but this was made possible under >=3D 2.=
6=20
> kernel versions, on 2.4.x you can't do it too.

VLAN support is available for kernel >=3D 2.4.14 and 2.6. Otherwise, you
can find patches for >=3D2.2.13 at :

	http://www.candelatech.com/~greear/vlan.html

You can also find a "Linux VLAN + Cisco" HOWTO at :

	http://www.candelatech.com/~greear/vlan/cisco_howto.html


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

