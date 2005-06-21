From: Damon Gray <dgray@internap.com>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 16:20:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0506211603570.2505@dgray-test.acs.internap.com>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
	<Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
	<Pine.LNX.4.60.0506211547280.18742@darkstar.sysinfo.com>
	<005201c5769b$cbefdc70$5100a8c0@14bis>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; boundary="-79754685-1639849078-1119384246=:2505"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005201c5769b$cbefdc70$5100a8c0@14bis>
Content-ID: <Pine.LNX.4.62.0506211610070.2505@dgray-test.acs.internap.com>
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

---79754685-1639849078-1119384246=:2505
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.62.0506211610071.2505@dgray-test.acs.internap.com>


The easiest way would probably be to do the following:

On the remote linux host, run SSH on port 80 (or possibly use netcat to=20
forward port 80 to port 22 or look into iptables REDIRECT target).

Then if you want to be able to use telnet (which isn't necessary if you=20
are running ssh to the box but maybe there is some other need for telnet=20
like automation of something, "I don't want to know" ;)

Then run ssh on the internal box:

ssh -p 80 -L 2023:localhost:23 <outsideboxip>

Then on the local box you can "telnet localhost 2023" and you will be=20
magically connected to port 23 on the outside box but over an encrypted=20
tunnel.

If you don't have OpenSSH on the windows box you can use putty for port=20
forwarding, I think.

Disclaimer: I hold no responsability for what this technique is being used=
=20
for. I like giving solutions, I don't want to know why. :)

For more info "man ssh" or=20
http://www.oreillynet.com/pub/a/wireless/2001/02/23/wep.html

-Damon-

On Tue, 21 Jun 2005, [iso-8859-1] Bruno Negr=E3o wrote:

> Hi Ron,
>
> Thanks for the warning. Actually, we already tried to create a PPTP vpn f=
rom=20
> that client to my gateway server, but the remote network administrator=20
> couldn't manage his equipment to let the appropriate packages to pass. (h=
e=20
> doesn't understand GRE no way).
>
> I will inform him we're setting up this new vpn tunnel. I just don't want=
 to=20
> ask him to move, since he doesn't have the skills to make it.
>
> Damon, thanks for the note on the ssh tunnel. Can you point me a document=
 to=20
> look for this kind of configuration?
>
> Regards,
> Bruno.
>
> ----- Original Message ----- From: "R. DuFresne" <dufresne@sysinfo.com>
> To: "Damon Gray" <dgray@internap.com>
> Cc: "Bruno Negr=E3o" <vpopmail@engepel.com.br>; <netfilter@lists.netfilte=
r.org>
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
>>> You could always run the telnet server on port 80. Or run netcat (aka n=
c)=20
>>> on
>>> the box on port 80 redirecting to port 23.
>>>=20
>>=20
>> He could, if he wanted to really violate the policies in place and tunne=
l
>> traffic in the clear.  he's actually asking about something that would b=
e
>> deemed a tad more seucre/private in nature, though still likely a
>> violation os the security policies currently in place and thus subjectin=
g
>> himself to likely termination once the tunnel was discovered, let alone
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
>>>> workstation(windows) inside a private network of another company. The =
LAN
>>>> where the workstation is located is protected by a firewall. This=20
>>>> firewall
>>>> only lets pass through outgoing traffic to port 80(http).
>>>>=20
>>>> I need this workstation to telnet a telnet server inside my private
>>>> network. Is it possible to set up a tunnel over port 80 to create a VP=
N
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
>
>
---79754685-1639849078-1119384246=:2505--

