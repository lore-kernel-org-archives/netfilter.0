From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Strange MAC address
Date: 20 May 2003 08:10:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053411035.2024.14.camel@kermit.spenneberg.de>
References: <Pine.OSF.3.91.1030518215213.1714B-100000@delta.ntu.ac.sg> 
	<Pine.LNX.4.51.0305192026090.897@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0305192026090.897@dns.toxicfilms.tv>
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
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: LI GUOJIE <p1436630@delta.ntu.ac.sg>, Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-05-19 um 20.27 schrieb Maciej Soltysiak:
> Hi,
>=20
> > MAC=3D00:a0:cc:28:56:c4:00:09:b6:13:9a:7c:08:00
> There are 12 octets here, so it is:
> Source MAC: 00:a0:cc:28:56:c4:00
> Dest   MAC: 09:b6:13:9a:7c:08:00
Unfortunately this is not fully correct. The first 12 octetts are the
MAC addresses. The last two specify the protocol. All in all it is the
*whole* ethernet header:
Source MAC 00:a0:cc:28:56:c4
Dest MAC   00:09:b6:13:9a:7c
Protocol   08:00  (see RFC894)

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

