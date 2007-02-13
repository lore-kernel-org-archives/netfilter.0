From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Iptables proxy to a different network
Date: Tue, 13 Feb 2007 15:44:57 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0702131541560.9124@darkstar.sysinfo.com>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
	<45CC5A91.4090200@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
	<45CC919C.7030104@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091848340.31955@yvahk01.tjqt.qr>
	<45CCE9D0.6080808@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1144599925-1171399497=:9124"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CCE9D0.6080808@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1144599925-1171399497=:9124
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	l1DKj1Qu009192

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 9 Feb 2007, Pascal Hambourg wrote:

> Jan Engelhardt a =E9crit :
>>>=20
>>> I may be wrong, but doing IP NAT on a bridge seems to me quite unnatu=
ral=20
>>> and
>>> troublesome.
>>=20
>> A bridge is like a 'direct connection' so you cannot use NAT.
>
> My idea of a bridge is a kind of software switch.
> Then why did you mention "setting up your proxy box as bridge" ?
>
>


My understanding of a bridge, is that it is a transparent connector of tw=
o=20
distinct broadcast domains.  At least in their earlier and older first=20
implementations.


Perhaps I'm showing my age?!...


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

iD8DBQFF0iNMst+vzJSwZikRArxJAKCMgPfeSo2PM2P0USICMHA4w+I8kQCeOJ9V
iYBgKm6pJHhmI6fOxT7QpKQ=3D
=3Dpj67
-----END PGP SIGNATURE-----
--1028002384-1144599925-1171399497=:9124--

