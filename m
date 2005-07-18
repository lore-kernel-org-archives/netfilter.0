From: Robert Vangel <vangelr@rfgt.net>
Subject: Re: DNATing Windows File Sharing
Date: Mon, 18 Jul 2005 17:50:21 +0800
Message-ID: <42DB7B5D.1090506@rfgt.net>
References: <1121674536.1554.16.camel@sadusbox.hostname>
	<Pine.LNX.4.61.0507181120001.14336@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF2EFDCD1710712FDC5C4F254"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507181120001.14336@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF2EFDCD1710712FDC5C4F254
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jan Engelhardt wrote:
>>Hello,
>>I would like to enable the right ports and DNAT the requests for File
>>Sharing on a internal windows box. The win2k3 has Active Directory
>>enabled and i want users to type \\domainname.com which will popup a
>>user/pass dialog and let them access the file server.
>>
>>I did the following, but it doesn't seem to work:
>>iptables -t nat -A PREROUTING -j DNAT -i eth0 -p tcp --dport 139 --to
>>192.168.1.2:139 
>>assuming "139" is NetBios
> 
> 
> Also try 445 instead of 139.
> 
> Then, if that still does not work, you maybe need to forward UDP 137.
> 
> 
> 
> Jan Engelhardt

All of the ports for windows file sharing you want to call it are..

135/tcp, 137/udp, 138/tcp, 139/udp, 139/tcp, 445/tcp

Some of them are for RPC things so you might not actually want them
open, but I don't know which specific one(s) they are.


--------------enigF2EFDCD1710712FDC5C4F254
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)

iD8DBQFC23tgW3d/aAsHRrcRAtLOAJ4vkHwSDvw7wTd2wDbjGjhdpqXiIACeJvKc
bkqONQ0KqVDkztpEl/Ns7u4=
=HfLn
-----END PGP SIGNATURE-----

--------------enigF2EFDCD1710712FDC5C4F254--

