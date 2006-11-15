From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: iptables promisc mode
Date: Wed, 15 Nov 2006 20:13:28 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0611152006150.24515@darkstar.sysinfo.com>
References: <455B6DC7.4010904@0x63.nu>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1711052051-1163621608=:24515"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <455B6DC7.4010904@0x63.nu>
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
To: =?ISO-8859-1?Q?Magnus_M=E5nsson?= <ganja@0x63.nu>
Cc: magnusm@massive.se, netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1711052051-1163621608=:24515
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	kAFKDZt1024888

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 15 Nov 2006, Magnus M=E5nsson wrote:

> Hi, it seems like a couple of people have asked for this before but I h=
avent=20
> seen any answers.
>
> I want iptables to get packages that do not belong to the machine, pack=
ages=20
> that are directed to others but came to me due to promisc mode. I have =
found=20
> a patch from November 2001 that seems to do what I want but after manua=
lly=20
> trying to patch it in my userspace utils segfaults. I am not a programm=
er so=20
> no surprise I didnt manage. The old patch is here:=20
> http://idea.hosting.lv/a/iptables-promisc/
>
>
> So, why do I want this? (maybe you can tell me that I should do it in a=
nother=20
> way)
> I am having a routing switch that is mirroring the internet traffic int=
o 2=20
> interfaces in a linux machine, this machine is for example running ntop=
 to=20
> look at what people are doing (that they shouldnt do). One of the thing=
s I/we=20
> are interested to find out is if people uses peer to peer protocols lik=
e=20
> Direct Connect / Bittorrent. My idea was to solve this with iptables la=
yer7=20
> filter (l7-filter.sourceforge.net), ulogd and mysql. But since I cant b=
uild=20
> ULOG rules that catch the packages I am stuck.
>
> The reason to choose iptables is that I can store all the information a=
bout=20
> the protocols I am interested in. Ntop doesnt have the history that I w=
ant.
>
>
> I am very thankful for whatever help/directions I can get.
>


As long as the firewall machine that runs iptables is the gateway from th=
e=20
lan to the internet and vice versa, this is already happening, iptables=20
sees all the traffic in both directions, and can act on it was well, laye=
r=20
4 and above.  Nothing to add, no patch required.  But, to have details in=
=20
the logs of what is passing requires that you build and configure your=20
rules properly, with log statements in your case being well defined and=20
covering a number of common protocol ports.  One issue you will face is=20
that most of the traffic you are trying to monitor, is not well defined=20
nor restricted to any common ports, which is whyyou have faced issues in=20
preventing the traffic and even with a layer 7 module.

Plan on having at least one person devoted to nothing but monitoring=20
traffic and logs for sometime to get a handle on what your users are=20
abusing.

Of course common theory is that this kind of abuse is best handled at the=
=20
HR level, a frewall is not the best place to hadle this kind of policy=20
issue.

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

iD8DBQFFW3Ttst+vzJSwZikRAqJzAKDVILcPhWyOSbHKYGhpUHEO63noPwCfXWu9
sjOHDE6m31Vg2OX4EyIP5UE=3D
=3DnVCS
-----END PGP SIGNATURE-----
--1028002384-1711052051-1163621608=:24515--

