From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 15:49:40 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506211547280.18742@darkstar.sysinfo.com>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
	<Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-337964252-1119383380=:18742"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
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
To: Damon Gray <dgray@internap.com>
Cc: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>, netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-337964252-1119383380=:18742
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j5LJniIm018959

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 21 Jun 2005, Damon Gray wrote:

>
> Bad security policies aside.... :)
>
> You could always run the telnet server on port 80. Or run netcat (aka n=
c) on=20
> the box on port 80 redirecting to port 23.
>

He could, if he wanted to really violate the policies in place and tunnel=
=20
traffic in the clear.  he's actually asking about something that would be=
=20
deemed a tad more seucre/private in nature, though still likely a=20
violation os the security policies currently in place and thus subjecting=
=20
himself to likely termination once the tunnel was discovered, let alone=20
potential prosecution.


Thanks,

Ron DuFresne

>
> On Tue, 21 Jun 2005, [iso-8859-1] Bruno Negr=E3o wrote:
>
>> Hi guys,
>>=20
>> I need to create a VPN to my linux server from a remote=20
>> workstation(windows) inside a private network of another company. The =
LAN=20
>> where the workstation is located is protected by a firewall. This fire=
wall=20
>> only lets pass through outgoing traffic to port 80(http).
>>=20
>> I need this workstation to telnet a telnet server inside my private=20
>> network. Is it possible to set up a tunnel over port 80 to create a VP=
N=20
>> between the workstation and my gateway, so that the workstation can te=
lnet=20
>> my internal server?
>>=20
>> The network administrator where this workstation is located is=20
>> inaccessible, so I have to create this workaround.
>>=20
>> Thank you,
>> -------------------------------------------------
>> Bruno Negrao - Support Analyst
>> Engepel Teleinform=E1tica. 55-31-34812311
>> Belo Horizonte, MG, Brazil=20
>>=20
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
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCuG9Yst+vzJSwZikRAgeQAJkBQRMIkhqTvT9XAUU5Ri5e+ybzigCgzXEA
AvPSv6yw4Em98204pnSEhWk=3D
=3DiaYC
-----END PGP SIGNATURE-----
--1028002384-337964252-1119383380=:18742--

