From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: [DNAT] Disappearing Packets
Date: 10 Oct 2003 12:20:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065781203.1650.106.camel@kermit>
References: <20031010085214.GA8722@jesus.fsmpi.rwth-aachen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031010085214.GA8722@jesus.fsmpi.rwth-aachen.de>
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
To: Thomas Wallrafen <mails@ranulf.de>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi Thomas,

Am Fre, 2003-10-10 um 10.52 schrieb Thomas Wallrafen:
> I'm currently setting up an IPtables firewall using DNAT to access our
> Webserver (192.168.0.42) and Masquerading to allow Internet access to
> the clients.
>=20
> Packets to the firewall (137.226.171.XXX) on port 80 can pass the FORWARD=
-chain:
> (already DNATed...)
> Oct 10 11:47:24 wormhole kernel: IN=3Deth0 OUT=3Deth1 SRC=3D170.252.80.XX=
X
> DST=3D192.168.0.42 LEN=3D64 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D39702 DF=
 PROTO=3DTCP
> SPT=3D48785 DPT=3D80 WINDOW=3D16384 RES=3D0x00 SYN URGP=3D0

Are you sure the packets get lost? What happens when you run tcpdump on
the internal interface of the firewall?
Can you run tcpdump on the webserver?
Does the webserver have a default gateway set pointing to the firewall?
Can you post your rules?
Does the internet access for the clients work?

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

