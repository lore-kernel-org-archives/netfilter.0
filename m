From: Primero <primero@fastwebnet.it>
Subject: Re: DNAT
Date: Tue, 26 Oct 2004 12:30:33 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417E2749.2020900@fastwebnet.it>
References: <20041026102023.GA7941@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB4EF95143E001B600896E55E"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041026102023.GA7941@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Payal Rathod <payal-netfilter@scriptkitchen.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB4EF95143E001B600896E55E
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Payal Rathod wrote:

>Hi,
>I want to access my internal machine from outside. But I am unable to do 
>so. I tried,
># iptables -t nat -I PREROUTING -d <my_ext_ip> -p tcp --dport
>8081 -j DNAT --to-destination 192.168.0.16:80
># iptables -I INPUT -p tcp --dport 8081 -j ACCEPT
>  
>
the one above is useless because the INPUT chain in this case is not 
traversed.

># iptables -I FORWARD -s 192.168.0.16 -j ACCEPT
>  
>
This one is the one u need ... but u have to make the check on 
destination and not on source so
#iptables -I FORWARD -d 192.168.0.16 -j ACCEPT

>With warm regards,
>-Payal
>
>  
>
bye :)


-- 
---------------------------------------
#######################################

"Linux, the choice of a GNU generation"
     ==Micro$oft - just say NO== 

#######################################
---------------------------------------


--------------enigB4EF95143E001B600896E55E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBfidMOGoQ6Fir3nYRAkKbAJ0VKFv18wTCpr+wCB+sok8fOtSqdgCfSb1w
1LSzCsJrjnueoUZgzsK03GU=
=uG3F
-----END PGP SIGNATURE-----

--------------enigB4EF95143E001B600896E55E--

