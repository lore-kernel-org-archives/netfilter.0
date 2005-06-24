From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: static 1:1 nat did not work
Date: Fri, 24 Jun 2005 11:30:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506241128530.27611@darkstar.sysinfo.com>
References: <OFBCF8CF54.D20A4809-ONC125700E.003D446D-C125702A.00236718@team4.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1028002384-1380324406-1119627046=:27611"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFBCF8CF54.D20A4809-ONC125700E.003D446D-C125702A.00236718@team4.de>
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
To: Guenter.Sprakties@team4.de
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1028002384-1380324406-1119627046=:27611
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by darkstar.sysinfo.com id
	j5OFUoxX027664

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



All those incantations are strange to us here, try just mapping yer publi=
c=20
addresses to the external public interface;

ip addr add pub-IP  ext-if

do that for each address you are 1:1 natting to privates in the inside,=20
see if that works.

with all the pre/post routing rules in the FW script as well...

thanks,

Ron DuFresne

On Fri, 24 Jun 2005 Guenter.Sprakties@team4.de wrote:

> Hello,
>
> 'cause I didn't get iptables nat to work, I switch back to an old 2.4
> kernel and iproute2.
>
> Three network segments, one intranet 172... , one dmz 192. .... one
> extranet 212.a.b....
>
> iproute2 setting is simple:
>
>        # Fast-NAT f=FCr DMZ-Intranet
>        ip rule add from 192.168.2.20 nat 172.31.27.20 to 172.31.24.0/24
> table dmz prio 100
>        ip route add nat 172.31.27.20 via 192.168.2.20 table local
>         # Fast-NAT f=FCr DMZ-Internet (hier Extranet :-))
>        ip rule add from 192.168.2.20 nat 212.a.7b.c table dmz prio 200
>        ip route add nat 212.a.b.c via 192.168.2.20 table local
>        # Defaultroute einrichten
>        ip route add default via 212.117.70.33
>        ip route flush cache
>
> ping from 172... to 172.31.27.20 is ok, in iptables we see
>
>       ping  src 172. ... 10   -> 192.168.2.20
>       pong src 192.168.2.20 -> 172. ... 10
>
> Now we activated a apache on our test-dmz system and tried to GET the s=
ite
> from intern.
> Surprisire, it didn't work. From the one side, we saw all tcp-packet in
> the iptables log, but in the webserver log nothing happens and we got t=
he
> message in our browser 'server not found'. With the not natted ip of
> 192.168.2.20, everything is fine. For testing, we didn't start iptables=
 at
> all an dused ip_forward alone, again, we did not get the server while
> there was definitive no  rule against routing. And, like i said at the
> strart, ICMP work fine.
>
> Any idea? Or wrong group b'cause an apache problem?
>
> Greetings,
>
> Dr. G=FCnter Sprakties
> ---
>

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

iD8DBQFCvCcpst+vzJSwZikRApJUAJ4p9Ay6mKJH6oLFsNS1iGEfmkbqZACeOb/N
Kivmh9nEKtCcpseLsulcllQ=3D
=3D4Zr1
-----END PGP SIGNATURE-----
--1028002384-1380324406-1119627046=:27611--

