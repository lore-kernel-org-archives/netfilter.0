From: "Christian Luiz Oliveira Souza" <christian@newtrend.com.br>
Subject: RES: Nat problem
Date: Mon, 20 Mar 2006 10:55:18 -0300
Message-ID: <5E7A1988547025438F54ECC195A3C23DC22E87@serverscs08.new.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Mesut Bayrak <mbayrak@datagrup.com.tr>, netfilter@lists.netfilter.org


>Hi people=20
>    I have a little nat problem
>=20
>I write that=20
>    iptables -t nat -I POSTROUTING -p tcp -d X.X.X.X --dport 88 -j DNAT
>--to-destination X.X.X.X --dport 80
=20
>and i just get that=20
=20
>iptables v1.2.7a: Only one `--destination-port' allowed
>Try `iptables -h' or 'iptables --help' for more information.
=20
=20
>What i was trying to do was =20
=20
>                                  _______
>________________
>internet------>----port 88  firewall  --->--- port 80  : machine on the
lan=20


>How can i do it :) ?                          =20



Hello Mesut.

Try to put the port after the IP address, for example:
-t nat -I POSTROUTING -p tcp -d X.X.X.X --dport 88 -j DNAT
>--to-destination X.X.X.X:80
^^^^^^^^^^


Regards.
Christian Souza.



