From: "Michael R. Schwarzbach" <spg@fs.tum.de>
Subject: Re: Netfilter and Linux bridge
Date: Mon, 24 Jun 2002 14:14:30 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D170D26.70308@fs.tum.de>
References: <OF1937A5BF.D92E37F1-ONC1256BD7.003E8CC7@diamond.philips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4662A4D06490C1BD126CC243"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: fabrizio.gennari@philips.com
Cc: netfilter@lists.samba.org

The following is an OpenPGP/MIME signed message
created by Enigmail/Mozilla, following RFC 2440 and RFC 2015
--------------enig4662A4D06490C1BD126CC243
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Hi,

there is a sourceforge project called bridge, that might interrest you. 
It has a development branch called bridge-nf working on iptables-support 
for bridges. Have a look at: http://bridge.sourceforge.net/devel/bridge-nf/

Regards
Michael

fabrizio.gennari@philips.com wrote:
> I was wondering whether Netfilter can filter away packets handled by Linux 
> bridge. If the bridge forwards the packet to another port, the packet 
> never goes through IP routing, so Netfilter should handle it inside the 
> bridge.
> 
> Also, is it possible to apply rules to packets according to the protocol 
> type in Ethernet header (h_proto in struct ethhdr)? The man page says it 
> is possible to apply rules according to source MAC, but says nothing about 
> Ethernet protocol type.
> 
> Fabrizio Gennari
> Philips Research Monza
> via G.Casati 23, 20052 Monza (MI), Italy
> tel. +39 039 2037816, fax +39 039 2037800
> 



--------------enig4662A4D06490C1BD126CC243
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7a-cvs (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9Fw0qBSpWS08ZgdgRArV0AKDWv5ThgzOTiPwLaWTuS6OUXp2ZewCgjJVN
O4F/JqpdVp59VqUWaiHiNio=
=ewbS
-----END PGP SIGNATURE-----

--------------enig4662A4D06490C1BD126CC243--


