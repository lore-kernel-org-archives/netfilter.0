From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Stateful packet inspection
Date: Fri, 4 Mar 2005 17:27:38 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503041722440.16051@darkstar.sysinfo.com>
References: <008d01c520eb$4f2ab710$b000a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1429134960-535250801-1109975258=:16051"
In-Reply-To: <008d01c520eb$4f2ab710$b000a8c0@cybergeneration.com>
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
To: Maxime Ducharme <mducharme@cybergeneration.com>, Seferovic Edvin <edvin.seferovic@kolp.at>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1429134960-535250801-1109975258=:16051
Content-Type: TEXT/PLAIN; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j24MRh0Q016085

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Is that what he;s looking for?  really?  the more I read this the more I=20
get the impression he might be talking about an application proxy.  A=20
better definition on the information being sought might be in order,=20
though, I get the impression that clarification might not be easy here=20
<smile>.

And by application proxy, I mean something that does more then merely=20
identify the application, but also enforces a 'policy' on the traffic <i.=
e.=20
it understand what is allowed in the transaction and limits traffic to=20
that context>.

Thanks,

Ron DuFresne

>
>
> Yes,
>
> what you are actually looking for is a filter for applications that sen=
d
> packets through your firewall =3D> so called LAYER 7 FILTER! Why layer =
7 - see
> OSI Layer model.
>
> Regards,
>
> Edvin Seferovic
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Maxime Duch=
arme
> Sent: Freitag, 04. M=E4rz 2005 19:45
> To: netfilter@lists.netfilter.org
> Subject: Re: Stateful packet inspection
>
>
> Yes I am not sure of the exact word for
> "Layer 7 filter"
>
> Someone can confirm this ?
>
> TIA
>
> Maxime Ducharme
> Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau
>
> ----- Original Message -----
> From: "Daniel Lopes" <lopsch@lopsch.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Friday, March 04, 2005 11:03 AM
> Subject: Re: Stateful packet inspection
>
>
>> I thought SPI means inspecting packets for their state i.e. NEW or
>> ESTABLISHED. What you mean is a Layer 7 filter, the link to it was
>> posted above ;).
>>
>
>

- --=20
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                         -Tom Robins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCKODest+vzJSwZikRAtj+AJsGbvFDX/dInImayYAPgpRMP5us4gCffJL/
yV3dgeJO46t9ecOTSqaOq/E=3D
=3DxCIt
-----END PGP SIGNATURE-----
---1429134960-535250801-1109975258=:16051--

