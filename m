From: Jordi Bruguera i Cortada <jordi@grn.es>
Subject: Re: log interpreter , for report ...
Date: Tue, 13 Jan 2004 15:08:55 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0401131504080.20665@chemical.grn.es>
References: <200401131457.38240.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401131457.38240.mrakotom@free.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Rakotomandimby Mihamina <mrakotom@free.fr>
Cc: netfilter@lists.netfilter.org


> Hi again ,
>=20
> 1=B0) This is a line of iptables log
> IN=3Dppp0 OUT=3D MAC=3D SRC=3D80.14.205.152 DST=3D80.15.220.67 LEN=3D48=
 TOS=3D0x00 PREC=3D0x00=20
> TTL=3D121 ID=3D64444 DF PROTO=3DTCP SPT=3D4717 DPT=3D135 WINDOW=3D16384=
 RES=3D0x00 SYN=20
> URGP=3D0
>=20
> How to see what port have been attempted ?

SRC=3D80.14.205.152 	(source IP address)

inetnum:      80.14.205.0 - 80.14.205.255
netname:      IP2000-ADSL-BAS
descr:        BSSTR206 Strasbourg Bloc2
country:      FR
admin-c:      WITR1-RIPE
tech-c:       WITR1-RIPE
status:       ASSIGNED PA
remarks:      for hacking, spamming or security problems send mail to
remarks:      postmaster@wanadoo.fr AND abuse@wanadoo.fr
mnt-by:       FT-BRX
changed:      gestionip.ft@francetelecom.com 20020423
changed:      gestionip.ft@francetelecom.com 20030318
source:       RIPE

DST=3D80.15.220.67 	(destination IP address)

inetnum:      80.15.220.0 - 80.15.220.127
netname:      IP2000-ADSL-BAS
descr:        BSORL204 Orleans Bloc2
country:      FR
admin-c:      WITR1-RIPE
tech-c:       WITR1-RIPE
status:       ASSIGNED PA
remarks:      for hacking, spamming or security problems send mail to
remarks:      postmaster@wanadoo.fr AND abuse@wanadoo.fr
mnt-by:       FT-BRX
changed:      gestionip.ft@francetelecom.com 20020709
changed:      gestionip.ft@francetelecom.com 20030318
changed:      gestionip.ft@francetelecom.com 20031007
source:       RIPE


PROTO=3DTCP	(protocol)
SPT=3D4717	(source port)
DPT=3D135		(destination port)

as seen in /etc/services:

pmap           135/tcp         # DCE endpoint resolution

cheers,

+------------------------------------------------+
! Jordi Bruguera i Cortada         jordi@grn.es  !
! Cap T=E8cnic                                     !
! GRN Serveis Telem=E0tics, SL Tel. +34 972 230000 !
+------------------------------------------------+


