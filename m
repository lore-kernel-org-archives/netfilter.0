From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: transparent bridge troubles?
Date: Fri, 7 Jan 2005 13:38:06 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E3AC@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: mdpeters <michael.peters@lazarusalliance.com>, Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

mdpeters wrote:
> Du'oh!
>=20
> I changed it and this is what I see so far. I'm running a Nessus scan
> on one side of the bridge and the target system is at the other side
> of the bridge.=20
>=20
> PRE QUEUEIN=3Dsafetynet0 OUT=3Dsafetynet0 PHYSIN=3Deth2 PHYSOUT=3Deth1
> SRC=3D68.16.185.132 DST=3D68.16.185.130 LEN=3D41 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64
> ID=3D3072 PROTO=3DTCP SPT=3D3133 DPT=3D45495 WINDOW=3D2048 RES=3D0x00 =
ACK URGP=3D0
>=20
> POST QUEUEIN=3Dsafetynet0 OUT=3Dsafetynet0 PHYSIN=3Deth2 =
PHYSOUT=3Deth1
> SRC=3D68.16.185.132 DST=3D68.16.185.130 LEN=3D41 TOS=3D0x00 =
PREC=3D0x00 TTL=3D64
> ID=3D3072 PROTO=3DTCP SPT=3D3133 DPT=3D45495 WINDOW=3D2048 RES=3D0x00 =
ACK URGP=3D0

Ok, since there was no return traffic, I'm assuming that the destination
host doesn't know the firewall's in between the two PC's. In
68.16.185.130's arp table, does it have 68.16.185.132 mapped to your
firewall's eth1 interface? Is proxyARPing setup on both firewall
interfaces? This is leaving my knowledge realm, so if someone else can
help..


