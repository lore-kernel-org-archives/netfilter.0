From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: what is blocking packets before netfilter?
Date: Sat, 5 Mar 2005 22:56:42 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0503052252340.16418@darkstar.sysinfo.com>
References: <20050306031742.GB952@tinuviel.compendium.com.ar>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1429134960-1875698504-1110081402=:16418"
In-Reply-To: <20050306031742.GB952@tinuviel.compendium.com.ar>
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
To: Horacio =?iso-8859-1?Q?J=2E_Pe=F1a?= <horape@tinuviel.compendium.com.ar>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1429134960-1875698504-1110081402=:16418
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j263ujU1023175

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Is tcpd enabled, does your system have a /etc/hosts.deny file, or  a=20
hosts.allow that is populated?  Is there a DSL router, or other=20
router/intelligent hub with an integrated firewall in it infront of or=20
behind the iptables firewall?  Could your ISP be blocking ICMP traffic?


Thanks,

Ron DuFresne

On Sun, 6 Mar 2005, Horacio [iso-8859-1] J. Pe=F1a wrote:

> I have:
>
> # iptables -L -n -t mangle -v
> Chain INPUT (policy ACCEPT 19862 packets, 1603K bytes)
> pkts bytes target     prot opt in     out     source               dest=
ination
>    0     0 LOG        all  --  eth0   *       192.168.2.0/24       0.0.=
0.0/0           LOG flags 0 level 4
>
> # iptables -L -n -t filter -v
> Chain INPUT (policy ACCEPT 17061 packets, 1410K bytes)
> pkts bytes target     prot opt in     out     source               dest=
ination
>    0     0 LOG        all  --  eth0   *       192.168.2.0/24       0.0.=
0.0/0           LOG flags 0 level 4
>
> # tcpdump -nvvvpe icmp
> tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 9=
6 bytes
> 15:44:34.189337 00:08:a1:6c:39:00 > 00:0a:e6:2d:90:77, ethertype IPv4 (=
0x0800), length 98: IP (tos 0x0, ttl64, id 1016, offset 0, flags [DF], le=
ngth: 84) 192.168.2.1 > 10.5.0.1: icmp 64: echo request seq 63491
>
> 00:0a:e6:2d:90:77 is my MAC.
>
> /proc/sys/net/ipv4/conf/*/rp_filter are 0.
> /proc/sys/net/ipv4/conf/*/forwarding are 1.
>
> What could be eating the packets? Shouldn't iptables see anything that =
comes to the interface?
>
> Thanks,
> 					HoraPe
> ---
> Horacio J. Pe=F1a
> horape@compendium.com.ar
> horape@uninet.edu
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

iD8DBQFCKn99st+vzJSwZikRAohTAKC1rYIlSjBXqJwywaJIovA/+ahYpACfYtlv
JA1L3qlbYZ6WmmEMwFIAxYw=3D
=3DPK99
-----END PGP SIGNATURE-----
---1429134960-1875698504-1110081402=:16418--

