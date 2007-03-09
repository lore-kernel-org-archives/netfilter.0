From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: redirect (nfcan: addressed to exclusive sender for this address)
Date: Fri, 09 Mar 2007 17:07:01 +0200
Message-ID: <45F17815.6030703@gmail.com>
References: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>	<45EEE4DD.9090508@gmail.com>	<20070307115036.qfmk9u7lwkkkoskw@webmail.harrisonburg.k12.va.us>	<45EFB4C4.9040707@gmail.com>	<20070308063421.y4spggseocogsc48@mail.harrisonburg.k12.va.us>	<20070308145008.GA11462@salty>
	<20070308095809.0jo1ofvyo80ok88w@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig14E915BD38FFF28C12CBBFBE"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type;
	b=WKGSNTYtVXj/wRJ4QGqWY0CGHTnu6oVvthpE6BU8FxIMcAFP3z99MAK5E73iOzQZeTtBKZQ1qRxJ93MD0sKavlYc/EAGBhM0ozlGTuFjSC8jE2rk+99YBaG781s+cmNnYW5LTK+3xU1hCRbozCxJbPeFhe50P/2zvEQVojn3Lr8=
In-Reply-To: <20070308095809.0jo1ofvyo80ok88w@webmail.harrisonburg.k12.va.us>
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
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig14E915BD38FFF28C12CBBFBE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

dhottinger@harrisonburg.k12.va.us wrote:
> Quoting Jim Laurino <nfcan.x.jimlaur@dfgh.net>:
>=20
>> On 2007.03.08 06:34, dhottinger@harrisonburg.k12.va.us wrote:
>>> Quoting Georgi Alexandrov <georgi.alexandrov@gmail.com>:
>>>
>> .....
>>>>>>> I would like to have any traffic destined for apple.com excluded
>>>>>>> from
>>>>>>> this redirect.  I cant seem to get the syntax right.  Anyone got =
any
>>>>>>> ideas?
>>>>>> <snip*>
>>>>>>
>>>>>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d
>>>>>> $apples_net
>>>>>> -j RETURN
>>>>>>
>> ....
>>>
>>> $IPC -t nat -A PREROUTING -p tcp -i $IF --dport 80 -d 17.250.0.0
>>> -j RETURN
>>>
>>> Is not routing apple.com traffice away from my proxy.  Apple.com
>>> traffic is
>>> still getting routed to proxy server.  I have the rule placed above
>>> my dnat
>>> rule for the proxy.  Any other ideas?
>>
>> The example was non-specific, -d $apples_net.
>> Your implementation, -d 17.250.0.0, is for a specific ip address.
>> You probably meant to specify a range.
>> Iptables allows you to use netmask or cidr syntax.
>> You can cover all of Apple with 17.0.0.0/8 for instance.
>>
>> --=20
>> Jim Laurino
>> nfcan.x.jimlaur@dfgh.net
>> Please reply to the list.
>> Only mail from the listserver reaches this address.
>>
>=20
> Yes I know.
>  Sorry I forgot part of my script.  I did
> $IPC -t nat -A PREROUTING -p tcp -i $IF --dport 80 -d 17.250.0.0/16 -j
> RETURN
>=20
> Where $IF is the interface that connects to the internet.

No, it should be the interface that your clients are behind.
First try to imagine it in your head then "draw" it with iptables rules ;=
-)

"I have to redirect all requests coming from my clients to the proxy
server which is here. But I also want requests that are coming from my
clients destined to apple's networks not hit the proxy and go directly
to apple"

in rules it goes like this:
iptables -t nat -A PREROUTING -p tcp -i $clients_interface --dport 80 -d
17.0.0.0/8 -j RETURN
iptables -t nat -A PREROUTING -p tcp -i $clients_interface --dport 80 -j
DNAT --to $proxy_server:$proxy_port

--=20
regards,
Georgi Alexandrov

key server - pgp.mit.edu :: key id - 0x37B4B3EE
Key fingerprint =3D E429 BF93 FA67 44E9 B7D4  F89E F990 01C1 37B4 B3EE


--------------enig14E915BD38FFF28C12CBBFBE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFF8XgV+ZABwTe0s+4RAi5WAJ9VF08L0oLU46IYc9uHNfm5/IumXgCgnoD8
Zi6hJjR617Mw0tfZGroEjY8=
=C7P5
-----END PGP SIGNATURE-----

--------------enig14E915BD38FFF28C12CBBFBE--

