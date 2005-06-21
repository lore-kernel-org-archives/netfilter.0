From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 16:20:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506211616010.18742@darkstar.sysinfo.com>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
	<Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
	<Pine.LNX.4.60.0506211547280.18742@darkstar.sysinfo.com>
	<005201c5769b$cbefdc70$5100a8c0@14bis>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-590960181-1119385258=:18742"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005201c5769b$cbefdc70$5100a8c0@14bis>
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
To: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-590960181-1119385258=:18742
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j5LKL617019069

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Bruno,

Hope you mind not really my asking about site policy before stepping into=
=20
the fire.  the man page for sshd is a good place to start, you'll find yo=
u=20
can add a -p port setting to the startup of sshd and I'm sure there is a=20
setting in the sshd_conf files for a binding port,. in your case 80.  The=
n=20
a quick look over the man page for ssh will show that you'll also need to=
=20
tell the client <ssh> via the -p option which port to look for the sshd o=
n=20
the far end you are trying to reach.  Make sure the sec admin is aware of=
=20
this bypass tunnel and put into sshd/tcpd options to limit connections to=
=20
only those that would use this tunnel, it will be found by those scanning=
=20
nets for entry points so do not relay upon the obscurity through security=
=20
methods that some feel warm and fuzzy with.

Thanks,

Ron DuFresne

On Tue, 21 Jun 2005, Bruno Negr=E3o wrote:

> Hi Ron,
>
> Thanks for the warning. Actually, we already tried to create a PPTP vpn=
 from=20
> that client to my gateway server, but the remote network administrator=20
> couldn't manage his equipment to let the appropriate packages to pass. =
(he=20
> doesn't understand GRE no way).
>
> I will inform him we're setting up this new vpn tunnel. I just don't wa=
nt to=20
> ask him to move, since he doesn't have the skills to make it.
>
> Damon, thanks for the note on the ssh tunnel. Can you point me a docume=
nt to=20
> look for this kind of configuration?
>
> Regards,
> Bruno.
>
> ----- Original Message ----- From: "R. DuFresne" <dufresne@sysinfo.com>
> To: "Damon Gray" <dgray@internap.com>
> Cc: "Bruno Negr=E3o" <vpopmail@engepel.com.br>; <netfilter@lists.netfil=
ter.org>
> Sent: Tuesday, June 21, 2005 4:49 PM
> Subject: Re: Tunneling other protocols over TCP port 80
>
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>=20
>> On Tue, 21 Jun 2005, Damon Gray wrote:
>>=20
>>>=20
>>> Bad security policies aside.... :)
>>>=20
>>> You could always run the telnet server on port 80. Or run netcat (aka=
=20
>>> nc) on
>>> the box on port 80 redirecting to port 23.
>>>=20
>>=20
>> He could, if he wanted to really violate the policies in place and tun=
nel
>> traffic in the clear.  he's actually asking about something that would=
 be
>> deemed a tad more seucre/private in nature, though still likely a
>> violation os the security policies currently in place and thus subject=
ing
>> himself to likely termination once the tunnel was discovered, let alon=
e
>> potential prosecution.
>>=20
>>=20
>> Thanks,
>>=20
>> Ron DuFresne
>>=20
>>>=20
>>> On Tue, 21 Jun 2005, [iso-8859-1] Bruno Negr=E3o wrote:
>>>=20
>>>> Hi guys,
>>>>=20
>>>> I need to create a VPN to my linux server from a remote
>>>> workstation(windows) inside a private network of another company. Th=
e=20
>>>> LAN
>>>> where the workstation is located is protected by a firewall. This=20
>>>> firewall
>>>> only lets pass through outgoing traffic to port 80(http).
>>>>=20
>>>> I need this workstation to telnet a telnet server inside my private
>>>> network. Is it possible to set up a tunnel over port 80 to create a=20
>>>> VPN
>>>> between the workstation and my gateway, so that the workstation can=20
>>>> telnet
>>>> my internal server?
>>>>=20
>>>> The network administrator where this workstation is located is
>>>> inaccessible, so I have to create this workaround.
>>>>=20
>>>> Thank you,
>>>> -------------------------------------------------
>>>> Bruno Negrao - Support Analyst
>>>> Engepel Teleinform=E1tica. 55-31-34812311
>>>> Belo Horizonte, MG, Brazil
>>>>=20
>>>=20
>>=20
>> - -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>         admin & senior security consultant:  sysinfo.com
>>                         http://sysinfo.com
>> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>>=20
>> ...We waste time looking for the perfect lover
>> instead of creating the perfect love.
>>=20
>>                 -Tom Robbins <Still Life With Woodpecker>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.2.4 (GNU/Linux)
>>=20
>> iD8DBQFCuG9Yst+vzJSwZikRAgeQAJkBQRMIkhqTvT9XAUU5Ri5e+ybzigCgzXEA
>> AvPSv6yw4Em98204pnSEhWk=3D
>> =3DiaYC
>> -----END PGP SIGNATURE-----=20
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
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCuHaust+vzJSwZikRAhHJAKC4E3417lftYHwisbY7KbhVfVFeEQCfdnGs
yvVGLpRTOVFmv6xtdJPCJhY=3D
=3DD4XD
-----END PGP SIGNATURE-----
--1028002384-590960181-1119385258=:18742--

