From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: NAT addresses - RFC or tradition?
Date: Mon, 18 Jun 2007 13:25:48 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706181321250.25318@darkstar.sysinfo.com>
References: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
	<200705221646.25925.ramoni@databras.com.br>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1655522293-1182187548=:25318"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200705221646.25925.ramoni@databras.com.br>
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
To: Andre =?iso-8859-1?q?Guimar=E3es?= <ramoni@databras.com.br>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1655522293-1182187548=:25318
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	l5IHPrT9025705

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Stealing another companies or organizations IP addresses can well break=20
thing for you like SMTP, and web sites you host.  In a small network,=20
these things can be fixed quite  easily, yet requires a trip to each and=20
every wrongly numbers system.  In a large network this can be quite an=20
extensive issue when trying to come into compliance with the real world.=20
BTDT.  The proper thing to do, is to get a IP space block from your=20
provider for at the least external addressing and use proper RFC assigned=
=20
private addresses for NAT functioning internally, it saves many headaches=
=20
down the road.

Thanks,

Ron DuFresne

On Tue, 22 May 2007, Andre Guimar=E3es wrote:

> It's quite simple.
> You're using public IPs in your internal networks.
> Some of these IPs may exist and have an owner an maybe even a web site.
> You'll be in trouble in the day you wish to acess one of these IPs on t=
he
> internet because you won't reach them because you have them on your net=
work
> and so won't route the packets to the internet.
>
> The IP's in fact, don't have any thing different, so you can use them a=
nd
> iptables will not have any problems. It's just a route problem, that as=
 you
> chose to use these IP's, you won't be able to reach these real public I=
P's in
> the internet.
>
> Sorry for the bad english.
>
> On Tuesday 22 May 2007 16:26, Paul Blond=E9 wrote:
>> I've noticed that a lot of people use the 192.168.X.X subnet for inter=
nal
>> networks, is this (and the less-used 10-series) a requirement of some =
RFC,
>> or a recommendation that has become tradition?
>>
>> We are using a completely different subnet, something similar to (for
>> example) 42.127.129.X to further obfuscate the internal network from
>> outside. This, and many other examples, produces a class-A subnet mask
>> (some produce a class-B) when entered in WinXP's TCP/IP dialog, althou=
gh
>> the actual mask we use with it is class-C.
>>
>> Is this a no-no? Will it break our server's IPTables when communicatin=
g
>> with it? Am I in for a lot of trouble? The addresses don't seem to cau=
se
>> any problems, but I don't want this to jump up and bite us in the bott=
om
>> sometime down the road.
>>
>>
>>
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> Paul Blond=E9
>
>

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGdsAgst+vzJSwZikRAvKcAJ9gc5ZLSh++4Yu553m8dETiPZicqgCfYER9
MADqb7HjfwQWHxAOyJfu/us=3D
=3DDJrm
-----END PGP SIGNATURE-----
--1028002384-1655522293-1182187548=:25318--

