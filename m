From: Abhishek Singh <aks.abhishek@gmail.com>
Subject: Re: confusion with  dport and sport
Date: Thu, 03 Sep 2009 12:52:23 +0545
Message-ID: <4A9F6B2B.2020805@gmail.com>
References: <4A9F60EE.60908@infoservices.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigDB4903CA685229EA4DCDA37A"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:cc:subject:references:in-reply-to
         :x-enigmail-version:content-type;
        bh=QLjr8bQK7CO2fUHfPBM90F5O3lLmB/Qxx/J/4InoEsE=;
        b=vcYfCQtLbCO6hE7+AYbw5kiUNw1ExdmHgkRWaxK5eSmJPkroBujIxPcJ67JeAahtWR
         MziJKC2aCxOlB5eyefgjQ2Hpb1HaNqawOqb9DZtxmN34ynVYOqG80srlLuHTHpWROqmr
         EL5/THFubJf7ieUuFx74OKtn54oJXgq8G7SmI=
In-Reply-To: <4A9F60EE.60908@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDB4903CA685229EA4DCDA37A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 09/03/2009 12:08 PM, J. Bakshi wrote:
> Hello,
>
> I have found that TOS is helpful for traffic shaping. But some guide us=
e
> --sport where other use --dport the handle the same thing hence I am
> very confusd !!
> To get a good response from the ssh running on a remote server the rule=

> can be placed in the remote server can be
>
> ``````````````````
> iptables -t mangle -A PREROUTING -p tcp --dport  $SSH_PORT -j TOS
> --set-tos Minimize-Delay
> `````````````````````
>
> BUT some site do the same by replacing --dport to --sport
>
> Which one should be the right value ? Please enlighten me.
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in=

> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

--dport is used for destination port for which it refers to packets
coming up to your gateway/pc destined for a specific port, and --sport
is used for source port for which it refers to packets going out from
your pc destined for that port.

--=20
Abhishek Singh
FOSS Nepal Community
http://wiki.fossnepal.org



--------------enigDB4903CA685229EA4DCDA37A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAkqfazAACgkQkIiJi94JMZb1OwCfSqVUMKnnCymqx78ee0DhMNJI
0MAAn0+GlNUwhMbH6E5CRpEvIwTH8AQN
=Oh3d
-----END PGP SIGNATURE-----

--------------enigDB4903CA685229EA4DCDA37A--
