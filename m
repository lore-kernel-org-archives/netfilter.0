From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Blocking SMTP Worm
Date: Tue, 31 Oct 2006 19:54:11 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0610311952090.12621@darkstar.sysinfo.com>
References: <19fb1ac90610240653x69cc1951g9766d7c809ddecef@mail.gmail.com>
	<19fb1ac90610240654x44bdd20em7e04b21469739a10@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1264329823-1162324451=:12621"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <19fb1ac90610240654x44bdd20em7e04b21469739a10@mail.gmail.com>
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
To: =?ISO-8859-1?Q?Juan_Carlos_Pel=E1ez_Mendoza?= <jcpelaez@gmail.com>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1264329823-1162324451=:12621
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	k9VJsGB5014215

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 24 Oct 2006, Juan Carlos Pel=E1ez Mendoza wrote:

> Hi list,
>
> My IP Address have been listed in the RBL's too many times, I
> installed into my linux box MailScanner + Spamassassin + Clamavmodule
> + FProt, I set up the iptables rules allowing only smtp, pop and ssh
> traffic, but when I see the traffic with tcpdump I see this strange
> behavior:
>
 		[SNIP]
>
> What can I do to stop and block this worm???
>

Wipe out the OS on 192.168.0.92, reinstall from scratch and apply all=20
patches and updates prior to exposing to the internet.  that should clear=
=20
up the sapm worm.

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

iD8DBQFFR6nnst+vzJSwZikRAnNPAJ9F4HQkzAQjkKSaNVr6+uNg4FE44ACfSsDf
CrGJLJ9MZPZbV1wJu76Faos=3D
=3D4IZ+
-----END PGP SIGNATURE-----
--1028002384-1264329823-1162324451=:12621--

