From: Primero <primero@fastwebnet.it>
Subject: Re: Redirection using DNAT on transparent bridge.
Date: Tue, 09 Nov 2004 10:11:07 +0100
Message-ID: <419089AB.3060509@fastwebnet.it>
References: <4f3930a704110819232a7f8a76@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig6D6B021F64E7859E2F8A7BFA"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4f3930a704110819232a7f8a76@mail.gmail.com>
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
To: Josh Nerius <jnerius@gmail.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig6D6B021F64E7859E2F8A7BFA
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Josh Nerius wrote:

>Hello,
>...
>
>iptables -t nat -A PREROUTING -m physdev --physdev-in eth0 -s
>192.168.150.222 -p tcp --dport 80 -j DNAT --to
>destination.ip.address.here
>
>  
>
where this "destination ip address" is? i mean, is it another network on 
the same firewall/router, is it an host somewhere out there on the net?

I use some rules like this one on my Bridged Firewall to DNAT some 
connection on a 3rd network i have on this firewall and, with the add of 
some rules in FORWARD chain, it works fine.

Do u ACCEPT traffic for "destination.ip.address.here" ?

maybe a little bit more rules would help :)

-- 
---------------------------------------
#######################################

"Linux, the choice of a GNU generation"
     ==Micro$oft - just say NO== 

#######################################
---------------------------------------


--------------enig6D6B021F64E7859E2F8A7BFA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBkImvOGoQ6Fir3nYRAo/mAJ445LcK7zeaKYarvMfMDLoYoD0JBQCfSYlA
PVLOpMn819Ozz/dsifeFBOc=
=SKXV
-----END PGP SIGNATURE-----

--------------enig6D6B021F64E7859E2F8A7BFA--

