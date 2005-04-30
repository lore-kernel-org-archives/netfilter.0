From: Alexander Samad <alex@samad.com.au>
Subject: Re: ICMP types
Date: Sun, 1 May 2005 08:35:38 +1000
Message-ID: <20050430223538.GC12091@samad.com.au>
References: <000101c54cf4$955d5460$6363a8c0@compaq>
	<427378BC.6070804@danbbs.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <427378BC.6070804@danbbs.dk>
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


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 30, 2005 at 02:23:24PM +0200, Mogens Valentin wrote:
> Ken Hilliard wrote:
> > In reading different firewall scripts/tutorials many of them recommend
> > filtering ICMP packets. I added ICMP filter in my firewall but was
> > unsure of the value as well. What is the consensus view out there?
>=20
> Not wanting to comment what the consensus are, but some types are=20
> generally considered nessesary to filter/allow.
>=20
> But its really not just a matter of filtering this-or-that, also what's=
=20
> set in /proc . There's a lot to read...
> A few ideas:
>=20
> Filtering ICMP:
>=20
> ### Define icmp_packets chain:
>     $IPT -F icmp_packets
>     $IPT -X icmp_packets
>     $IPT -N icmp_packets
>     $IPT -A icmp_packets -p icmp --icmp-type echo-request -j ACCEPT
>     $IPT -A icmp_packets -p icmp --icmp-type echo-reply -j ACCEPT
>     $IPT -A icmp_packets -p icmp --icmp-type destination-unreachable -j=
=20
> ACCEPTlog
>     $IPT -A icmp_packets -p icmp --icmp-type network-unreachable -j=20
> ACCEPTlog
>     $IPT -A icmp_packets -p icmp --icmp-type network-prohibited -j=20
> ACCEPTlog
>     $IPT -A icmp_packets -p icmp --icmp-type source-quench -j ACCEPTlog
>     $IPT -A icmp_packets -p icmp --icmp-type parameter-problem -j ACCEPTl=
og
>     $IPT -A icmp_packets -p icmp --icmp-type time-exceeded -j ACCEPTlog
>     $IPT -A icmp_packets -p icmp --icmp-type fragmentation-needed -j=20
> ACCEPTlog
>     #$IPT -A icmp_packets -p icmp -j ACCEPTlog
>     $IPT -A icmp_packets -p icmp -j LOG


why not use
-m limit --limit 1/s --limit-burst 5=20
as well to limit them and then drop the rest!

>=20
>=20
>=20
> A few /proc settings:
>=20
> ### /proc settings:
>     setup_procfs() {
>=20
>       # Disable forwarding while setting up rules (needed for=20
> masquerading):
>       # Note: this is now done in forwarding.def
>           #echo "0" >/proc/sys/net/ipv4/ip_forward
>=20
>       # Initially, disable ICMP echo-requests altogether (normally only=
=20
> used if DoSed):
>       # Note: this is now done in forwarding.def
>           #echo "1" >/proc/sys/net/ipv4/icmp_echo_ignore_all
>=20
>       # Disable ICMP echo-request to broadcast addresses (Smurf amplifier=
):
>           echo "1" >/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
>=20
>       # Enable syn-cookies (prevent syn-flood attacks):
>           echo "1" >/proc/sys/net/ipv4/tcp_syncookies
>=20
>       # Reduce number of possible SYN Floods:
>           echo "1024" >/proc/sys/net/ipv4/tcp_max_syn_backlog
>=20
>       # Enable defrag error protection:
>           echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
>=20
>       # Enable time-wait assassination hazards in tcp (RFC 1337):
>           echo "1" >/proc/sys/net/ipv4/tcp_rfc1337
>=20
>       # Prevent remote digging of OS-type and uptime (RFC1323):
>           #echo "1" >/proc/sys/net/ipv4/tcp_timestamps    # enable=20
> timestamps
>           echo "0" >/proc/sys/net/ipv4/tcp_timestamps    # disable=20
> timestamps
>=20
>       # Disable RFC2018 TCP Selective Acknowledgements:
>           echo 0 > /proc/sys/net/ipv4/tcp_sack
>=20
>=20
>       # Sourcerouting and spoofing:
>           for i in /proc/sys/net/ipv4/conf/*; do
>               # Drop all source-routed packets:
>               echo "0" >$i/accept_source_route
>=20
>               # Deactivate normal ICMP redirect accept/send:
>               echo "0" >$i/accept_redirects
>               echo "0" >$i/send_redirects
>=20
>               # Activate secure ICMP redirects (send only?) (on by=20
> default):
>               echo "1" >$i/secure_redirects
>=20
>               # Enable ingress + egress source-address verification=20
> (prevent spoofing):
>               #echo "0" >$i/rp_filter   # disable
>               echo "1" >$i/rp_filter   # enable
>           done
>=20
>       # Log spoofed, source routed and redirect packets:
>           #echo 1 >/proc/sys/net/ipv4/conf/all/log_martians
>           echo 0 >/proc/sys/net/ipv4/conf/all/log_martians
>=20
>     }
>=20
> --=20
> Kind regards,
> Mogens Valentin
>=20
>=20
> Q: How does a hacker fix a function which doesn't
>    work for all of the elements in its domain?
> A: He changes the domain.
>   -- unknown
>=20
>=20
>=20

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCdAg6kZz88chpJ2MRAj60AKDVOEe3WTCsHJoTPPZYW2uvFf94WACeNZmz
uWhnGuT0kJ8BKRCK5c/TU2Q=
=rl2y
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--

