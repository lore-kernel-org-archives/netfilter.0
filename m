From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: NAT addresses - RFC or tradition?
Date: Mon, 18 Jun 2007 13:27:30 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706181326240.25318@darkstar.sysinfo.com>
References: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>
	<200705221646.25925.ramoni@databras.com.br>
	<20070522195618.M46626@tkevans.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-2046396866-1182187650=:25318"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070522195618.M46626@tkevans.com>
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
To: Tim Evans <tkevans@tkevans.com>
Cc: netfilter@lists.netfilter.org, =?ISO-8859-1?Q?Andre_Guimar=E3es_?= <ramoni@databras.com.br>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-2046396866-1182187650=:25318
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	l5IHRZDg025718

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 22 May 2007, Tim Evans wrote:

> On Tue, 22 May 2007 16:46:25 -0300, Andre Guimar=E3es wrote
>> It's quite simple.
>> You're using public IPs in your internal networks.
>> Some of these IPs may exist and have an owner an maybe even a web site.
>> You'll be in trouble in the day you wish to acess one of these IPs
>> on the internet because you won't reach them because you have them
>> on your network and so won't route the packets to the internet.
>
> In other words, the RFC addresses are specifically for use in internal
> networks, since they are guaranteed not to be used on the public intern=
et, and
> not routed to by any public internet router.


"should not" be publically routed, there are itiots out there in the=20
world, one can't fix stupid.

Thanks,

Ron DuFresne
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

iD8DBQFGdsCGst+vzJSwZikRAvYIAJ0fFaAVU0xlLtkL6S4XJqEZcYrlMgCcDEf3
qsBjsVnL0PyYWgl5ingpEPw=3D
=3DIssI
-----END PGP SIGNATURE-----
--1028002384-2046396866-1182187650=:25318--

