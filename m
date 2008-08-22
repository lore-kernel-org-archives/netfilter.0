From: Bram Metsch <metsch@ins.uni-bonn.de>
Subject: Packages which should be DNATed are dropped incidentally
Date: Fri, 22 Aug 2008 14:25:07 +0200
Message-ID: <20080822142507.db9f6ccf.metsch@ins.uni-bonn.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__22_Aug_2008_14_25_07_+0200_9LOq0_dE6Hivy9si"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Signature=_Fri__22_Aug_2008_14_25_07_+0200_9LOq0_dE6Hivy9si
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

At our site, we have a mailserver inside a DMZ. This DMZ
employs private IPs (range 192.168.193/24), so we configured additional off=
ical
IPs on the external interface of the firewall:

(excerpt of `iptables -L -n -v -t nat`)
Chain PREROUTING (policy ACCEPT 2468K packets, 218M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
 103K 5881K DNAT       all  --  external *       0.0.0.0/0            <exte=
rnal mailserver IP>      to:192.168.193.13

In addition, I let through the required services for this mailserver (also =
serves as DNS-server, btw):

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
 2089  110K ACCEPT     udp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      udp dpt:53
 1413 56520 ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:53
 2448  151K ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:993
 4279  261K ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:995
34899 1738K ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:25
  281 16448 ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:465
    3   128 ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:3128
  270 13568 ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:80
 2951  170K ACCEPT     tcp  --  external dmz     0.0.0.0/0            192.1=
68.193.13      tcp dpt:443

Now, we incidentally watch packets being dropped allthough they belong to v=
alid connections:

Aug 22 13:52:13 localhost kernel: DROP IN=3Dexternal OUT=3D MAC=3D<firewall=
 external mac>:<next router's mac>:08:00 SRC=3D<remoteip> DST=3D<external m=
ailserver ip> LEN=3D109 TOS=3D0x00 PREC=3D0x00 TTL=3D54 ID=3D60517 DF PROTO=
=3DTCP SPT=3D18995 DPT=3D993 WINDOW=3D2282 RES=3D0x00 ACK PSH URGP=3D0

but `iptstate` tells me this should be a valid connection.

Also, the user who is connected using <remoteip> tells me that he has diffi=
culties downloading large attachments=20
using IMAP as well as via HTTPS (mailserver web interface). However, this i=
s not always reproducable and sometimes=20
it works. He has tried different internet connections and different home ro=
uters on his side of the connection.
I have already checked the mailserver and the webserver's log but could not=
 find a problem there. So I suspect this is=20
a firewall issue.

Something that confuses me: If I understand the log line above correctly, t=
he packed is not dropped in the FORWARD chain=20
but in the INPUT chain. However, this would mean that the packet would not =
have been processed by the DNAT rule.

Thanks for any help,

Bram Metsch.
=20
--=20
Dipl. Math. Bram Metsch
Universitaet Bonn
Institut fuer Numerische Simulation
Wegelerstrasse 6
53115 Bonn
Germany
Phone: +49 228 733849
Fax:   +49 228 737527
http://wissrech.ins.uni-bonn.de/index.php4?nav=3Dpeople_staff_metsch

--Signature=_Fri__22_Aug_2008_14_25_07_+0200_9LOq0_dE6Hivy9si
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIrrAmUX8v1gQDM/4RAoRKAJ9+ZjEx0N/xshbwKH/cOAG/z7xYxQCfVwQg
rtfEonhw4e+XD/44OZj2Cb8=
=U/11
-----END PGP SIGNATURE-----

--Signature=_Fri__22_Aug_2008_14_25_07_+0200_9LOq0_dE6Hivy9si--
