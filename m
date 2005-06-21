From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 16:59:56 -0300
Message-ID: <005201c5769b$cbefdc70$5100a8c0@14bis>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
	<Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
	<Pine.LNX.4.60.0506211547280.18742@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi Ron,

Thanks for the warning. Actually, we already tried to create a PPTP vpn fro=
m=20
that client to my gateway server, but the remote network administrator coul=
dn't=20
manage his equipment to let the appropriate packages to pass. (he doesn't=20
understand GRE no way).

I will inform him we're setting up this new vpn tunnel. I just don't want t=
o ask=20
him to move, since he doesn't have the skills to make it.

Damon, thanks for the note on the ssh tunnel. Can you point me a document t=
o=20
look for this kind of configuration?

Regards,
Bruno.

----- Original Message -----=20
From: "R. DuFresne" <dufresne@sysinfo.com>
To: "Damon Gray" <dgray@internap.com>
Cc: "Bruno Negr=E3o" <vpopmail@engepel.com.br>; <netfilter@lists.netfilter.=
org>
Sent: Tuesday, June 21, 2005 4:49 PM
Subject: Re: Tunneling other protocols over TCP port 80


> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Tue, 21 Jun 2005, Damon Gray wrote:
>
>>
>> Bad security policies aside.... :)
>>
>> You could always run the telnet server on port 80. Or run netcat (aka nc=
) on
>> the box on port 80 redirecting to port 23.
>>
>
> He could, if he wanted to really violate the policies in place and tunnel
> traffic in the clear.  he's actually asking about something that would be
> deemed a tad more seucre/private in nature, though still likely a
> violation os the security policies currently in place and thus subjecting
> himself to likely termination once the tunnel was discovered, let alone
> potential prosecution.
>
>
> Thanks,
>
> Ron DuFresne
>
>>
>> On Tue, 21 Jun 2005, [iso-8859-1] Bruno Negr=E3o wrote:
>>
>>> Hi guys,
>>>
>>> I need to create a VPN to my linux server from a remote
>>> workstation(windows) inside a private network of another company. The L=
AN
>>> where the workstation is located is protected by a firewall. This firew=
all
>>> only lets pass through outgoing traffic to port 80(http).
>>>
>>> I need this workstation to telnet a telnet server inside my private
>>> network. Is it possible to set up a tunnel over port 80 to create a VPN
>>> between the workstation and my gateway, so that the workstation can tel=
net
>>> my internal server?
>>>
>>> The network administrator where this workstation is located is
>>> inaccessible, so I have to create this workaround.
>>>
>>> Thank you,
>>> -------------------------------------------------
>>> Bruno Negrao - Support Analyst
>>> Engepel Teleinform=E1tica. 55-31-34812311
>>> Belo Horizonte, MG, Brazil
>>>
>>
>
> - --=20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>
> iD8DBQFCuG9Yst+vzJSwZikRAgeQAJkBQRMIkhqTvT9XAUU5Ri5e+ybzigCgzXEA
> AvPSv6yw4Em98204pnSEhWk=3D
> =3DiaYC
> -----END PGP SIGNATURE-----=20


