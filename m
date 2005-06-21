From: Damon Gray <dgray@internap.com>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 15:47:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0506211546590.2505@dgray-test.acs.internap.com>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
	<Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
	<Pine.LNX.4.60.0506211547280.18742@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-79754685-606399412-1119383261=:2505"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0506211547280.18742@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>, netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---79754685-606399412-1119383261=:2505
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


Then if you wanted better security (not in the clear telnet) then you can=
=20
use ssh tunneling to port 80.

-Damon-

On Tue, 21 Jun 2005, R. DuFresne wrote:

> On Tue, 21 Jun 2005, Damon Gray wrote:
>
>>=20
>> Bad security policies aside.... :)
>>=20
>> You could always run the telnet server on port 80. Or run netcat (aka nc=
)=20
>> on
>> the box on port 80 redirecting to port 23.
>>=20
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
>>=20
>> On Tue, 21 Jun 2005, [iso-8859-1] Bruno Negr=E3o wrote:
>>=20
>>> Hi guys,
>>>=20
>>> I need to create a VPN to my linux server from a remote
>>> workstation(windows) inside a private network of another company. The L=
AN
>>> where the workstation is located is protected by a firewall. This firew=
all
>>> only lets pass through outgoing traffic to port 80(http).
>>>=20
>>> I need this workstation to telnet a telnet server inside my private
>>> network. Is it possible to set up a tunnel over port 80 to create a VPN
>>> between the workstation and my gateway, so that the workstation can tel=
net
>>> my internal server?
>>>=20
>>> The network administrator where this workstation is located is
>>> inaccessible, so I have to create this workaround.
>>>=20
>>> Thank you,
>>> -------------------------------------------------
>>> Bruno Negrao - Support Analyst
>>> Engepel Teleinform=E1tica. 55-31-34812311
>>> Belo Horizonte, MG, Brazil
>>>=20
>>=20
>
> --
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        admin & senior security consultant:  sysinfo.com
>                        http://sysinfo.com
> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>
>                -Tom Robbins <Still Life With Woodpecker>
> ------------ Output from gpg ------------
> gpg: Signature made Tue Jun 21 15:49:44 2005 EDT using DSA key ID 94B0662=
9
> gpg: no valid OpenPGP data found.
> gpg: Total number processed: 0
> gpg: Can't check signature: public key not found
>
>
---79754685-606399412-1119383261=:2505--

