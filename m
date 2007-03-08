From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: redirect
Date: Thu, 08 Mar 2007 09:01:24 +0200
Message-ID: <45EFB4C4.9040707@gmail.com>
References: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>	<45EEE4DD.9090508@gmail.com>
	<20070307115036.qfmk9u7lwkkkoskw@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigCE0672D7337DD8CBBF5228F9"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type;
	b=Gzp9HBG2ZSY/JFPNGb6JiHL/ccnsFeHx7S4d7YxeMgxHcXNulByXs4rZ/Xf5CnMKN3RCZ/RRkhxB5scPjFITuQQYPYTaSXdOJE7AJwUTnBvFfe079JQ5IQq4mjVYsB/OAT3M/LTnVhuK0WSYnnon24gkVmCUavbHfb7jYWj2WPs=
In-Reply-To: <20070307115036.qfmk9u7lwkkkoskw@webmail.harrisonburg.k12.va.us>
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
To: dhottinger@harrisonburg.k12.va.us
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCE0672D7337DD8CBBF5228F9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

dhottinger@harrisonburg.k12.va.us wrote:
> Quoting Georgi Alexandrov <georgi.alexandrov@gmail.com>:
>=20
>> dhottinger@harrisonburg.k12.va.us wrote:
>>> I currently redirect all traffic on port 80 to my proxy server with
>>> $IPC -t nat -A PREROUTING -p tcp -i ! $IF --dport 80    -s !
>>> 204.111.40.0/24 -d ! 204.111.40.0/24 -j DNAT --to-destination
>>> $PROXY_IP:8080
>>>
>>> I would like to have any traffic destined for apple.com excluded from=

>>> this redirect.  I cant seem to get the syntax right.  Anyone got any
>>> ideas?
>> <snip*>
>>
>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d $apples_n=
et
>> -j RETURN
>>
>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d
>> $another_not_to_proxy_network -j RETURN
>>
>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -j DNAT --to=

>> $proxy:$port
<snip*>
>=20
> Never mind.  Doesnt seem to be working.  Any other ideas?

What's not working?

--=20
regards,
Georgi Alexandrov

key server - pgp.mit.edu :: key id - 0x37B4B3EE
Key fingerprint =3D E429 BF93 FA67 44E9 B7D4  F89E F990 01C1 37B4 B3EE


--------------enigCE0672D7337DD8CBBF5228F9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFF77TN+ZABwTe0s+4RAvJLAJ45y64ULhrkYPgiInKqhfqu/cofyACfW+5z
5/LyMV6hVog+VaGzYCe7OUk=
=bAYI
-----END PGP SIGNATURE-----

--------------enigCE0672D7337DD8CBBF5228F9--

