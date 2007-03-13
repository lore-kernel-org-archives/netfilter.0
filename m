From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Matching packets by HTTP header "Host"
Date: Tue, 13 Mar 2007 19:38:08 +0100
Message-ID: <45F6EF90.3040504@plouf.fr.eu.org>
References: <45F68159.5040606@aldu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F68159.5040606@aldu.net>
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

Giovanni Lovato a =E9crit :
>=20
> I'm trying to forward packets to different hosts depending on the "Host=
"
> header in HTTP packets, e.g. packets on port 80 requesting "Host:
> one.example.org" to 192.168.0.1 and all other on port 80 to 192.128.0.2=
.
> I did:
>=20
> iptables -t nat -A PREROUTING -p TCP -i eth0 -m string --algo bm
> - --string "Host: one.example.org" --destination-port 80 -j DNAT
> - --to-destination 192.168.0.1
>=20
> iptables -t nat -A PREROUTING -p TCP -i eth0 --destination-port 80 -j
> DNAT --to-destination 192.168.0.2
>=20
> But all packets are going to 192.168.0.2. Do I miss something?

Rules in the 'nat' table apply only to the first packet of a new=20
connection. NAT operations for the whole connection is determined by the=20
NAT rules applied to the first (SYN) packet of the connection, which=20
does not contain any HTTP payload data such as the "Host" header. So the=20
first rule never matches a packet. As suggested, use a HTTP proxy instead=
.

