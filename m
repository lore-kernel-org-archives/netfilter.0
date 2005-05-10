From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: Problem adding connlimit rule
Date: Tue, 10 May 2005 16:56:32 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505101652220.25732@darkstar.sysinfo.com>
References: <200505101324.j4ADO4fr025185@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1429134960-1514908534-1115758592=:25732"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505101324.j4ADO4fr025185@darkstar.sysinfo.com>
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
To: Ruben Cardenal <rubenc@arrakis.es>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1429134960-1514908534-1115758592=:25732
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j4AKubXX027287

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 10 May 2005, Ruben Cardenal wrote:

> Hi,
>
> netfilter-bounces@lists.netfilter.org wrote:
>> El mar, 10-05-2005 a las 13:26 +0200, Ruben Cardenal escribi=F3:
>>> Hi,
>>>
>>>   I'm trying to add a quite simple rule but I get an error:
>>>
>>> # iptables -I INPUT -p tcp --syn --dport 25 -m connlimit
>>> --connlimit-above 10 -j REJECT iptables: No chain/target/match by
>>> that name
>>
>> Maybe you don't have the support for the connlimit match compiled
>> for iptables. Check if you have the file:
>> /lib/iptables/libipt_connlimit.so
>
>  For this system libs are located under /usr/local/lib/iptables and
> libipt_connlimit.so is there.


OK, you have the libs, but, is the module loded?  the modules live in a=20
seperate place.  Look under=20
/lib/modules/<kernel version>/kernel/net/ipv4/netfilter/

and then do an lsmod to see if it;s loaded correctly.

ipt_limit.o

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
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCgSAFst+vzJSwZikRAqqrAKDIayJF7m93ohK9zEnmZH4c6hAOcQCfTDUT
XaRaqhNvKvc/al3k8rDg4aI=3D
=3DQru6
-----END PGP SIGNATURE-----
---1429134960-1514908534-1115758592=:25732--

