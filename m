From: Ralf Spenneberg <lists@spenneberg.org>
Subject: RE: Help on IPTABLES
Date: 13 Oct 2003 15:23:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066051384.4193.61.camel@kermit>
References: <83055D4B014C9E478D2F04624B9E82CFD475@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFD475@noveldc.novelgmt.mu>
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
To: Gilles Yue <gyue@novelgmt.intnet.mu>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-10-13 um 14.09 schrieb Gilles Yue:
> Chain INPUT (policy DROP)
>=20
> target     prot opt source               destination
>=20
> RH-Lokkit-0-50-INPUT  all  --  0.0.0.0/0            0.0.0.0/0
>=20
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80
When establishing a connection with a webserver the packets in the INPUT
chain are coming from the webserver port 80, therefore spt:80 not dpt:80
Same to the rest with the exception of DNS. Here you did it correct:
> ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp spt:53

By the way, you get more info on the rules using=20
iptables -vnL

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

