From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ip_conntrack_ftp problem
Date: 28 Mar 2003 13:46:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048855454.17534.53.camel@elendil.intranet.cartel-securite.net>
References: <Pine.LNX.4.33.0303281315590.6557-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0303281315590.6557-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Vincent Lim <vincent.lim@nestac.com>, Budai Laszlo <lbudai@ms.sapientia.ro>, netfilter <netfilter@lists.netfilter.org>

Le ven 28/03/2003 =E0 13:17, Jozsef Kadlecsik a =E9crit :
> On 28 Mar 2003, Cedric Blancher wrote:
> > A RELATED packet is similar to a NEW one, except that conntrack was
> > waiting for him.
> No, that's not true. Every packet handled by the helpers are RELATED.

I may be wrong, but that's not what my experience says :

root@elendil:~# iptables --version
iptables v1.2.7a
root@elendil:~# iptables -F INPUT
root@elendil:~# iptables -A INPUT -m helper --helper ftp -m state --state=
 RELATED -j LOG --log-prefix 'RELATED_FTP '
root@elendil:~# iptables -A INPUT -m helper --helper ftp -m state --state=
 ESTABLISHED -j LOG --log-prefix 'ESTABLISHED_FTP '
root@elendil:~# iptables -L INPUT
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           helper match =
"ftp" state RELATED LOG level warning prefix `RELATED_FTP '
LOG        all  --  anywhere             anywhere           helper match =
"ftp" state ESTABLISHED LOG level warning prefix `ESTABLISHED_FTP '

Then I open a FTP connection, grabbing a file list via ls using active
FTP so I can see RELATED ftp-data opening :

root@elendil:~# tail -f /var/log/messages
[...]
Mar 28 13:38:50 elendil kernel: RELATED_FTP IN=3Deth0 OUT=3D MAC=3Dxx SRC=
=3D192.168.1.4 DST=3D192.168.1.3 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64=
 ID=3D2955 DF PROTO=3DTCP SPT=3D20 DPT=3D34777 WINDOW=3D5840 RES=3D0x00 S=
YN URGP=3D0
Mar 28 13:38:50 elendil kernel: ESTABLISHED_FTP IN=3Deth0 OUT=3D MAC=3Dxx=
 SRC=3D192.168.1.4 DST=3D192.168.1.3 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D=
64 ID=3D2956 DF PROTO=3DTCP SPT=3D20 DPT=3D34777 WINDOW=3D5840 RES=3D0x00=
 ACK URGP=3D0
Mar 28 13:38:50 elendil kernel: ESTABLISHED_FTP IN=3Deth0 OUT=3D MAC=3Dxx=
 SRC=3D192.168.1.4 DST=3D192.168.1.3 LEN=3D116 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D2957 DF PROTO=3DTCP SPT=3D20 DPT=3D34777 WINDOW=3D5840 RES=3D0=
x00 ACK PSH URGP=3D0
Mar 28 13:38:50 elendil kernel: ESTABLISHED_FTP IN=3Deth0 OUT=3D MAC=3Dxx=
 SRC=3D192.168.1.4 DST=3D192.168.1.3 LEN=3D1500 TOS=3D0x00 PREC=3D0x00 TT=
L=3D64 ID=3D2958 DF PROTO=3DTCP SPT=3D20 DPT=3D34777 WINDOW=3D5840 RES=3D=
0x00 ACK URGP=3D0
Mar 28 13:38:50 elendil kernel: ESTABLISHED_FTP IN=3Deth0 OUT=3D MAC=3Dxx=
 SRC=3D192.168.1.4 DST=3D192.168.1.3 LEN=3D569 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D2959 DF PROTO=3DTCP SPT=3D20 DPT=3D34777 WINDOW=3D5840 RES=3D0=
x00 ACK PSH FIN URGP=3D0
Mar 28 13:38:50 elendil kernel: ESTABLISHED_FTP IN=3Deth0 OUT=3D MAC=3Dxx=
 SRC=3D192.168.1.4 DST=3D192.168.1.3 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D=
64 ID=3D2960 DF PROTO=3DTCP SPT=3D20 DPT=3D34777 WINDOW=3D5840 RES=3D0x00=
 ACK URGP=3D0
[...]

(stripped MAC stuff for convenience)

I can see RELATED packet from server:20 to my station:34770 (first
line). Following packets (line 2, 4, 5 and 6) for this connection are
ESTABLISHED. So, the way I understand this behaviour, is that a RELATED
packet is like a NEW one, but has an expectation on which it will be
matched.


I built iptables with POM from CVS.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


