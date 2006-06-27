From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Packet Mirroring
Date: Tue, 27 Jun 2006 15:20:04 +0200
Message-ID: <44A13084.2020400@plouf.fr.eu.org>
References: <eb5e15780606270602h772cca66s59358a4e15c59951@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <eb5e15780606270602h772cca66s59358a4e15c59951@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hello,

conn itnel a =E9crit :
>=20
> I have three NIC on my pc, eth0,eth1 and eth2 respectively. The eth0
> is directly connected with the internet.
>=20
> I want the traffic that comes on eth0 will reach eth1 and also eth2
> respectively.
>=20
> For example, If Packet P1 comes to eth0, It duplicates itself and then
> should reach to eth1 and eth2.

What about the --tee option of the ROUTE target ?
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-=
ROUTE

