From: Michael Schwartzkopff <misch@multinet.de>
Subject: Problem with conntrackd: TCP RST sent on NAT connections
Date: Fri, 20 Feb 2009 13:34:34 +0100
Message-ID: <200902201334.34830.misch@multinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I have a strange problem here. I set up a testbed like in the on on the=
=20
website, except that I have NAT im my scenario.

When I test a SSH connection everything goes fine.

When I download a file via HTTP the first failover works, but the failb=
ack=20
breaks the connection and the download stops. Tracing the connection sh=
ow that=20
during the failback the HTTP Server sends a package to the virtual NAT =
address=20
of my firewall and the firewall send a TCP RST back and thus stops the=20
connection.

Of course I tried first to sync the connection table and after that set=
 up my=20
virtual addresses, but it seems that it does not help.

A similar problem was described from Abhijit Menon-Sen on Oct, 30th 200=
7 on=20
the nf-failover mailing list. But I did not find any solution there.

My system:
debian lenny.
Kernel 2.6.26-1-686
conntrackd version 0.9.6-4

Mode: FTFW, heartbeat as HA solution.

My firewall does allow everything. The only rule is the NAT rule that t=
ranslats=20
all packets comming from internal to the virtual external address.

Any idea what could be wrong? How could I trace the problem further? Th=
anks=20
for any help.

--=20
Dr. Michael Schwartzkopff
MultiNET Services GmbH
Addresse: Bretonischer Ring 7; 85630 Grasbrunn; Germany
Tel: +49 - 89 - 45 69 11 0
=46ax: +49 - 89 - 45 69 11 21
mob: +49 - 174 - 343 28 75

mail: misch@multinet.de
web: www.multinet.de

Sitz der Gesellschaft: 85630 Grasbrunn
Registergericht: Amtsgericht M=FCnchen HRB 114375
Gesch=E4ftsf=FChrer: G=FCnter Jurgeneit, Hubert Martens

---

PGP Fingerprint: F919 3919 FF12 ED5A 2801 DEA6 AA77 57A4 EDD8 979B
Skype: misch42
