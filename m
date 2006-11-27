From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: RE: Passive FTP sees remote's _internal_ IP!!??
Date: Mon, 27 Nov 2006 13:39:57 -0500
Message-ID: <28870.9371154711$1164653106@news.gmane.org>
References: <456B0529.BFBFE757@iswest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <456B0529.BFBFE757@iswest.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: 'gypsy' <gypsy@iswest.com>, netfilter@lists.netfilter.org

=20

This is "normal" FTP behavior

Problem is caused by the machine that handles NAT,
it doesnt translate passive FTP replies so it won't
handle passive FTP connections neither.

This happens when the remote server has a bad
NAT configuration for FTP. If the FTP server is
bound on another port than 21 this is common problem.

This is also why you see outbound access to 192.168.1.11
on dynamic ports. On the first line of your log we see that
192.168.223.4 try to get onto 192.168.1.11:1090, means
the FTP server isnt configured properly

Maybe SonicWALL is able to "fix" this itself, I dont
know this product very well.

Loading ip_nat_ftp on your side will only help
for active FTP connection, or if you run a FTP
server which IP is NATed (inside your 192.168.223.* net).

some suggestions :

1. Fix NAT for FTP on remote firewall

2. Configure remote server to explicitly send
external IP for passive connections (most of FTP
software allows to configure this)

3. Configure your FTP client to use active mode.
If server is running on another port than 21,
you must tell ip_nat_ftp to "listen" for FTP
traffic on this port. Someone on this list can
tell us how ? (I dont remember how)

4. Configure your FTP client to explicitly send
your external IP in active connections (PORT commands)
and configure iptables to forward any connections from
the FTP server to the internal IP which have the client
running. This is the worst solution.

Like David Sims I suggest
http://slacksite.com/other/ftp.html

HTH

Maxime Ducharme

=20

-----Message d'origine-----
De : netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] De la part de gypsy
Envoy=E9 : 27 novembre, 2006 10:33
=C0 : netfilter@lists.netfilter.org
Objet : Passive FTP sees remote's _internal_ IP!!??

William Lima wrote:
>=20
> Dear,
>=20
> Load modules:
>=20
> modprobe ip_nat_ftp
>=20
> Abs,

Nope:

#!/bin/bash
modprobe ip_nat_ftp
iptables -P FORWARD ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.223.0/24 -j SNAT --to
68.171.136.91
iptables -A FORWARD -j LOG

Module                  Size  Used by    Not tainted
ipt_LOG                 3448   1  (autoclean)
iptable_filter          1772   1  (autoclean)
ip_conntrack_ftp        3728   1  (autoclean)
ip_nat_ftp              2640   0  (unused)
iptable_nat            17542   2  [ip_nat_ftp]
iptable_mangle          2168   0  (autoclean) (unused)
ip_tables              11840   6  [ipt_LOG iptable_filter iptable_nat
iptable_mangle]

Nov 26 17:20:35 GWbox kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.223.4
DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D61924 =
DF PROTO=3DTCP
SPT=3D2105 DPT=3D2336 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0=20
Nov 26 17:20:36 GWbox kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.223.4
DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D61951 =
DF PROTO=3DTCP
SPT=3D2106 DPT=3D2337 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0=20
Nov 26 17:20:39 GWbox kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.223.4
DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D61957 =
DF PROTO=3DTCP
SPT=3D2106 DPT=3D2337 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0=20
Nov 26 17:20:45 GWbox kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.223.4
DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D61958 =
DF PROTO=3DTCP
SPT=3D2106 DPT=3D2337 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0=20

We don't think this is a netfilter problem.  The kernel should tell the
remote end that it can't use the "nonroutable" IP - shouldn't it?
--
gypsy

> 2006/11/26, gypsy <gypsy@iswest.com>:
> > In our network, we have 2 gateways.  The main GW is a Slackware 10.0 =
box
> > and the other is a SonicWALL firewall appliance.  Each connects to a
> > different external IP but both are in the same /29 network.
> >
> > Note: No machine in our LAN has an IP of 192.168.1.11.
> >
> > When the default GW is set to the linux box (192.168.223.254) and
> > passive FTP to a remote server is initiated, the FTP fails after
> > connection because the internal IP of the remote machine =
(192.168.1.11)
> > is seen rather than its external IP.  This problem occurs only when
> > passive FTP is used.
> >
> > We do not believe that the OS or FTP daemon of the remote host =
matters
> > because when the default GW is set to the SonicWALL (192.168.223.1), =
the
> > passive FTP succeeds.
> >
> > Therefore, we conclude that there is something wrong with our linux =
box.
> >
> > But WHAT?
> >
> > Note that the connection has already occurred when port negotation =
is
> > attempted - which is when the FTP fails.
> >
> > If anyone has advice, we will sincerely appreciate it.
> >
> > The kernel is 2.4.32.
> >
> > #!/bin/bash
> > iptables -P FORWARD ACCEPT
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -t nat -A POSTROUTING -o eth1 -s 192.168.223.0/24 -j SNAT =
--to
> > 68.171.136.91
> > iptables -A FORWARD -j LOG
> >
> > Nov 26 00:32:10 GWbox kernel: IN=3Deth0 OUT=3Deth1 =
SRC=3D192.168.223.4
> > DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 =
ID=3D56473 DF PROTO=3DTCP
> > SPT=3D1069 DPT=3D1090 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0
> > Nov 26 00:32:10 GWbox kernel: IN=3Deth0 OUT=3Deth1 =
SRC=3D192.168.223.4
> > DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 =
ID=3D56500 DF PROTO=3DTCP
> > SPT=3D1070 DPT=3D1091 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0
> > Nov 26 00:32:14 GWbox kernel: IN=3Deth0 OUT=3Deth1 =
SRC=3D192.168.223.4
> > DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 =
ID=3D56506 DF PROTO=3DTCP
> > SPT=3D1070 DPT=3D1091 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0
> > Nov 26 00:32:20 GWbox kernel: IN=3Deth0 OUT=3Deth1 =
SRC=3D192.168.223.4
> > DST=3D192.168.1.11 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 =
ID=3D56507 DF PROTO=3DTCP
> > SPT=3D1070 DPT=3D1091 WINDOW=3D60352 RES=3D0x00 SYN URGP=3D0
> > --
> > gypsy
> >
> >
>=20
> --
> William R. Lima
> wrochalima@linuxit.com.br



