From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Unzustellbar: [SPAM] - Re: Why does this connection stop being tr
 acked? - Sending mail server found on relays.ordb.org (fwd)
Date: Wed, 15 Jun 2005 13:23:52 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506151315040.25078@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Type: MULTIPART/Mixed; BOUNDARY="----_=_NextPart_000_01C571C4.27B8E997"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-ID: <Pine.LNX.4.60.0506151315041.25078@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

------_=_NextPart_000_01C571C4.27B8E997
Content-Type: TEXT/PLAIN; CHARSET=iso-8859-1; format=flowed
Content-ID: <Pine.LNX.4.60.0506151315042.25078@darkstar.sysinfo.com>
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j5FHNvir025296

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



will the folks responsible for maintaining the list please remove these=20
clueless ones from the list;


http://ordb.org/lookup/?host=3Dsysinfo.com

Lookup
This host is not listed in ORDB as an open mail relay

Main database status for sysinfo.com (70.61.80.19)
Look up this host in non-ORDB RBL's (May take a while to load)
The host sysinfo.com is not in the main database


- ---------- Forwarded message ----------
From: Systemadministrator <postmaster@echtzeit.com>
Subject: Unzustellbar: [SPAM] - Re: Why does this connection stop being t=
r
     acked? - Sending mail server found on relays.ordb.org
Date: Wed, 15 Jun 2005 18:06:14 +0200
To: dufresne@sysinfo.com

Your message

   To:      Andy Smith
   Cc:      netfilter@lists.netfilter.org; Jozsef Kadlecsik
   Subject: [SPAM] - Re: Why does this connection stop being tracked? -
Sending mail server found on relays.ordb.org
   Sent:    Wed, 15 Jun 2005 18:07:52 +0200

did not reach the following recipient(s):

phergenhahn@echtzeit.de on Wed, 15 Jun 2005 18:06:13 +0200
     Der Name des Empf=E4ngers wurde nicht erkannt.
 	Die MTS-ID der urspr=FCnglichen Nachricht ist: c=3Dde;a=3D ;p=3Dechtzei=
t
gmbh ? ;l=3DEZMXS0506151606M1PANQGT
     MSEXCH:IMS:Echtzeit GmbH & Co. KG:ECHTZEIT:EZMXS 0 (000C05A6)
Unbekannter Empf=E4nger


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCsGQsst+vzJSwZikRAt1LAJ9xL9l5z9fKn8BZzQimgpQvYqJPrgCfbRVe
qncoDiq+Lfi4bv2DkQkG2pA=3D
=3DL99R
-----END PGP SIGNATURE-----
------_=_NextPart_000_01C571C4.27B8E997
Content-Type: MESSAGE/RFC822; CHARSET=US-ASCII
Content-ID: <Pine.LNX.4.60.0506151315043.25078@darkstar.sysinfo.com>
Content-Description: 

Message-ID: <Pine.LNX.4.60.0506151154340.25078@darkstar.sysinfo.com>
From: "R. DuFresne" <dufresne@sysinfo.com>
To: Andy Smith <andy@strugglers.net>
Cc: netfilter@lists.netfilter.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: [SPAM] - Re: Why does this connection stop being tracked? - Sendi
	ng mail server found on relays.ordb.org
Date: Wed, 15 Jun 2005 18:07:52 +0200
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2653.19)
X-MS-Embedded-Report: 
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
Content-Type: text/plain;
	charset="iso-8859-1"

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


 	[SNIP]

>>
>> You have two choices: either disable TCP SACK support on all your
>> real/virtual machines behind your firewall, or upgrade the kernel on the
>> firewall.
>
> Do you have any instructions or a pointer to documentation onhow to
> temporarily disable SACK?  If it was a /proc setting that would be
> ideal; I don't really want to have to recompile kernels though.
>

why?  you are certainly missing out on how to fix and patch a systems when 
bugs in the kernel affect it, to the ability to add features that your 
dist maintainer has not enabled by default, or to change params in the 
kernel such as moving away or to kernel modules as opposed to stack 
functionality mapping.  Not to mention the abilities to streamline the 
kernel to fit your requirements and remove all the xtra trash that gets 
loaded in to make a kernel fit all purposes/needs/enduser-requirements.

basically, you are defeating one of the finer points in the linux realm <as 
well as the BSD's net, open, free>  you are avoiding taking actually 
control of what you are playing with <smile>.  Granted one does not do 
this sort of thing in a prod env on the fly, one tests such things on a 
dev server or desktop emulating what might be in prod. but, it's not all 
that tough to master, and certainly will likely be required at one time or 
another to get things working that were not originally provided, move to a 
newer cleaner kernel, or even to fix problems encountered over the 
stresses of time and all that.  The recipe for doing such is not all that 
complex, and if one backsup the old kernel and properly runs lilo to 
include it in the potential boot process, not all that damaging should on 
finger-fart and make a bed new kernel on first draft. but all admins in 
the free *nix-like realm should learn the particulars of rebuilding 
kernels, it will  at one time or another save their asses.

No salt for the avoiders.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCsFJdst+vzJSwZikRAiaQAKCWHlgggJUxBXu9/CeR//pLYbzHGACfRVev
kG/17gNRcUin+Dk63ai8gCA=
=2VQV
-----END PGP SIGNATURE-----

------_=_NextPart_000_01C571C4.27B8E997--

