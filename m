From: Emmanuel Lacour <elacour@easter-eggs.com>
Subject: Ftp hangs after some transferts
Date: Thu, 6 Jun 2002 14:39:47 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020606123947.GE948@easter-eggs.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,=20

Maybe it's not a netfilter problem, but I know that people on this list
is ftp/firewall/network aware.

Here is my pbm.

Active connections from workstation/FW to ftpserver2 hangs after some
files have been transfered.

                    =20
		     ------------------ ftpserver1
                     |=20
                     |
		     |
ftpserver2-------Internet
                     |
		     |
		     |
		FW netfilter
		     |
		     |
		     -----------workstation
		   =20


If somone know a similar problem or has any idea...


Some test:

In ftp passive mode: all is ok

In ftp active mode:

workstation->ftpserver2: Hang after some files are transfered

workstation->ftpserver1: OK

ftpserver1->ftpserver2: OK

FW->ftpserver2: Hang after some files are transfered
(iptables unloaded for this test)



Configs:

ftpserver2: debian potato with proftpd
ftpserver1: debian woody with proftpd (pre-nated with a
potato+netfilter+kernel-2.4.18 box)
FW: debian potato with netfilter (kernel 2.4.18)



Here is the end of tcpdump on FW external iface just before it hangs:


workstation.3006 > ftpserver2.ftp: P 790:811(21) ack 1522 win 16060 <nop,no=
p,timestamp 451190278 1158115672> (DF)
ftpserver2.ftp > workstation.3006: P 1522:1542(20) ack 811 win 16060 <nop,n=
op,timestamp 1158115673 451190278> (DF)
workstation.3006 > ftpserver2.ftp: P 811:837(26) ack 1542 win 16060 <nop,no=
p,timestamp 451190280 1158115673> (DF)
ftpserver2.ftp > workstation.3006: P 1542:1572(30) ack 837 win 16060 <nop,n=
op,timestamp 1158115675 451190280> (DF)
workstation.3006 > ftpserver2.ftp: P 837:858(21) ack 1572 win 16060 <nop,no=
p,timestamp 451190281 1158115675> (DF)
ftpserver2.ftp-data > workstation.3015: S 1214809980:1214809980(0) win 1606=
0 <mss 1460,sackOK,timestamp 1158115676 0,nop,wscale 0> (DF)
workstation.3015 > ftpserver2.ftp-data: S 1558404700:1558404700(0) ack 1214=
809981 win 16060 <mss 1460,sackOK,timestamp 451190283 1158115676,nop,wscale=
 0> (DF)
ftpserver2.ftp > workstation.3006: . ack 858 win 16060 <nop,nop,timestamp 1=
158115678 451190281> (DF)
ftpserver2.ftp > workstation.3006: P 1572:1633(61) ack 858 win 16060 <nop,n=
op,timestamp 1158115678 451190281> (DF)
workstation.3006 > ftpserver2.ftp: . ack 1633 win 16060 <nop,nop,timestamp =
451190286 1158115678> (DF)
ftpserver2.ftp-data > workstation.3009: F 1:1(0) ack 30805 win 15928 <nop,n=
op,timestamp 1158115758 451190061> (DF)
workstation.3009 > ftpserver2.ftp-data: . ack 2 win 16060 <nop,nop,timestam=
p 451190364 1158115758> (DF)
ftpserver2.ftp-data > workstation.3011: F 1:1(0) ack 24799 win 15928 <nop,n=
op,timestamp 1158115879 451190179> (DF)
workstation.3011 > ftpserver2.ftp-data: . ack 2 win 16060 <nop,nop,timestam=
p 451190485 1158115879> (DF)
ftpserver2.ftp-data > workstation.3012: F 1:1(0) ack 60672 win 15928 <nop,n=
op,timestamp 1158115922 451190220> (DF)
workstation.3012 > ftpserver2.ftp-data: . ack 2 win 16060 <nop,nop,timestam=
p 451190528 1158115922> (DF)
ftpserver2.ftp-data > workstation.3013: F 1:1(0) ack 17269 win 15928 <nop,n=
op,timestamp 1158115941 451190243> (DF)
workstation.3013 > ftpserver2.ftp-data: . ack 2 win 16060 <nop,nop,timestam=
p 451190547 1158115941> (DF)
ftpserver2.ftp-data > workstation.3014: F 1:1(0) ack 33877 win 15928 <nop,n=
op,timestamp 1158115969 451190269> (DF)
workstation.3014 > ftpserver2.ftp-data: . ack 2 win 16060 <nop,nop,timestam=
p 451190577 1158115969> (DF)
workstation.3015 > ftpserver2.ftp-data: S 1558404700:1558404700(0) ack 1214=
809981 win 16060 <mss 1460,sackOK,timestamp 451190611 1158115676,nop,wscale=
 0> (DF)
workstation.3015 > ftpserver2.ftp-data: S 1558404700:1558404700(0) ack 1214=
809981 win 16060 <mss 1460,sackOK,timestamp 451191261 1158115676,nop,wscale=
 0> (DF)
workstation.3015 > ftpserver2.ftp-data: S 1558404700:1558404700(0) ack 1214=
809981 win 16060 <mss 1460,sackOK,timestamp 451192511 1158115676,nop,wscale=
 0> (DF)
workstation.3006 > ftpserver2.ftp: P 858:879(21) ack 1633 win 16060 <nop,no=
p,timestamp 451193284 1158115678> (DF)
ftpserver2.ftp > workstation.3006: . ack 879 win 16060 <nop,nop,timestamp 1=
158118680 451193284> (DF)





--=20
Easter-eggs                                Sp=E9cialiste GNU/Linux
44-46 rue de l'Ouest  -  75014 Paris   -   France -  M=E9tro Gait=E9
Phone: +33 (0) 1 43 35 00 37    -     Fax: +33 (0) 1 41 35 00 76
mailto:elacour@easter-eggs.com   -    http://www.easter-eggs.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8/1gT9xcB2SfmR18RAp1KAJ9IibCQiwFrzrcr1ThaXnW7Yu9HVQCaAz1b
wbmSt8RLbx646UKEvlicZAs=
=aOad
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

