From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: Iptables rules processing
Date: Fri, 3 Aug 2007 19:07:35 +0200
Message-ID: <20070803170735.GC7815@sid.toystory.lan>
References: <20070803161302.GB7815@sid.toystory.lan>
	<46B3566E.1010407@rchq.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46B3566E.1010407@rchq.co.za>
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


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2007 at 06:23:10PM +0200, Ray Leach wrote:
>
>
> Franck Joncourt wrote:
>> Hi,
>>
>> Assuming we have the next two rules in our ruleset :
>>
>> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 80 -j ACCEPT
>> iptables -A INPUT -s 192.168.10.14 -p tcp --dport 443 -j ACCEPT
>>
>> I was wondering whether rules are processed one by one.
>> In the two rules above, we have to check the source address
>> 192.168.10.14, so I think this is done for the first one, and then for
>> the second one. I am not quite sure ; Can anyone confirm that ?
>>
>>  =20
> Yes, rules are processed one by one until a rule matches the packet.
>
> So the first rule above would be matched for traffic coming from=20
> 192.168.10.14 going to port 80 (192.168.10.14 browses a website)
> The second rule would be matched when 192.168.10.14 tried to browse a=20
> secure website.
>
> Since bothe these rules are in the INPUT chain, they will only be matched=
=20
> when the source ip tried to access those ports on the machine running=20
> iptables.
>

I meant, there can't be no such processing  ?

1/
-> ...
-> match for the source address 192.168.10.14
    |-> match for destination port 80 -> ACCEPT
    |-> match for the destination port 443 -> ACCEPT
-> ...


According to me, it works this way :

2/
-> ...=20
-> match source address 192.168.10.14 AND destination port 80
    |-> ACCEPT
-> match source address 192.168.10.14 AND destination port 443
    |-> ACCEPT
->...

In the case 1, we check the source address once, and in the second one,
twice. So the first case would be quicker to process than the second
one where there is no optimalisation.

I know what these rules do, but this is just an example, and I know how
the user chains work as well :p!

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGs2DXxJBTTnXAif4RApddAKCsmWHsKM5jh87DposiyCRrskxKQACeIZeB
bix+UGpZzh0eHl5GCRbHZuI=
=ZXkT
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--


