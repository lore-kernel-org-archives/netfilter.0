From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: iptables and pop3 lockup
Date: Tue, 16 May 2006 14:10:16 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901676D8@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Bowie Bailey <Bowie_Bailey@BUC.com>, "Netfilter List (E-mail)" <netfilter@lists.netfilter.org>

I'm now sure what the problem is.  There is nothing pointing out right
now.  But these are the canned RH rules.  I would recommend making the
following change just to rule out any connection tracking.  Here is the
reason.  If connection tracking is broken then any requests for a second
packet will not be considered new which will fail to be matched on the
connection tracking site. =20

Do this as a test (in place for the corresponding rules).

-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 25 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 110 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 53 -j ACCEPT
-A RH-Firewall-1-INPUT -m udp -p udp --dport 53 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 587 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 80 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 22 -s 172.16.0.0/16 -j
ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 443 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 995 -j ACCEPT
-A RH-Firewall-1-INPUT -m tcp -p tcp --dport 21 -j ACCEPT

Connection tracking can save you some time in the chain processing for
allowing for faster matches but we are trying to find out if it's even
working or not.


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Bowie Bailey
> Sent: Tuesday, May 16, 2006 12:34 PM
> To: Netfilter List (E-mail)
> Subject: RE: iptables and pop3 lockup
>=20
> Gary W. Smith wrote:
> > From what I am seeing below something is still batching DPT 110.  I
> > have seen this happen on some machines that do not have kernel
> > modules loaded or available.  Case in point, I have a virtual server
> > we lease for a project that is based on Fedora Core 2 and it has all
> > of the modules statically loaded.  But connection tracking does not
> > work so adding reject always causes a failure.
> >
> > May 16 14:50:29 bnofmail kernel: FIREWALL: IN=3Deth0 OUT=3D
> > SRC=3D70.156.232.189 DST=3D172.16.17.169 LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> > TTL=3D110 ID=3D23735 DF PROTO=3DTCP SPT=3D1867 DPT=3D110 =
WINDOW=3D8280 RES=3D0x00
> > ACK URGP=3D0
> >
> > Can you do two things; send us the output of lsmod and also the
> > original rules /etc/sysconfig/iptables instead of the iptables -L
> > command.
>=20
> # lsmod
> Module                  Size  Used by
> ip_conntrack_ftp       76273  0
> ipt_REJECT             10561  1
> ipt_LOG                10049  1
> ipt_state               5825  11
> ip_conntrack           45573  2 ip_conntrack_ftp,ipt_state
> iptable_filter          6721  1
> ip_tables              21441  4
> ipt_REJECT,ipt_LOG,ipt_state,iptable_filter
> md5                     8001  1
> ipv6                  240225  36
> autofs4                22597  0
> w83627hf               29161  0
> eeprom                 12385  0
> i2c_sensor              7489  2 w83627hf,eeprom
> i2c_isa                 6081  0
> i2c_i801               11725  0
> i2c_dev                14273  0
> i2c_core               25921  6
> w83627hf,eeprom,i2c_sensor,i2c_isa,i2c_i801,i2c_dev
> sunrpc                142757  1
> dm_mirror              28449  0
> dm_mod                 59973  1 dm_mirror
> button                 10449  0
> battery                12869  0
> ac                      8773  0
> uhci_hcd               32729  0
> ehci_hcd               31813  0
> b44                    25037  0
> mii                     9153  1 b44
> floppy                 58065  0
> ext3                  118729  1
> jbd                    59481  1 ext3
> raid1                  19649  2
> ata_piix               13381  4
> libata                 57885  1 ata_piix
> sd_mod                 20545  6
> scsi_mod              116941  2 libata,sd_mod
>=20
> # cat /etc/sysconfig/iptables
> # Firewall configuration written by system-config-securitylevel
> # Manual customization of this file is not recommended.
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :RH-Firewall-1-INPUT - [0:0]
> -A INPUT -j RH-Firewall-1-INPUT
> -A FORWARD -j RH-Firewall-1-INPUT
> -A RH-Firewall-1-INPUT -i lo -j ACCEPT
> -A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 110
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 53
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 53
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 587
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22
-s
> 172.16.0.0/16 -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 443
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 995
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21
-j
> ACCEPT
> -A RH-Firewall-1-INPUT -j LOG --log-prefix "FIREWALL: " --log-level 1
> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
> COMMIT
>=20
> --
> Bowie


