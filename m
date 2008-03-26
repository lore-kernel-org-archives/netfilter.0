From: Sven Riedel <sr@securenet.de>
Subject: Transfer stalls with NAT under 2.6.24.3
Date: Wed, 26 Mar 2008 09:47:39 +0100
Message-ID: <47EA0DAB.7080205@securenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I've run into a strange problem where large file transfers start=20
stalling over a NATed connection. Packet traces reveal that ACK packets=
=20
are sometimes not being passed through to the inside (NATed) host, whic=
h=20
results in a transfer stall until a tcp timeout occurrs and the other=20
side retransmits the ACK.

This only seems to happen if the conntrack table on the firewall alread=
y=20
contains an entry for the same source and destination in TIME_WAIT=20
state. If no conntrack entries exist for the same source and=20
destination, the packets flow fine.

The problem seems to be alevated by setting ip_conntrac_tcp_be_liberal=20
to 1, but this seems to be only a workaround not a real solution.

Scatter gather and tcp segment offloading have been disabled in the=20
relevant NICs on the firewall during debugging, to make sure this isn't=
=20
a hardware issue.

Is this issue known/is there a patch available or would further=20
information be needed to help debug the problem?

Regards,
Sven

--=20
sven.riedel@securenet.de

SecureNet GmbH
Intranet & Internet Solutions
=46rankfurter Ring 193a
D-80807 M=FCnchen
Tel: +49 89 32133-632
=46ax: +49 89 32133-699
Zentrale: -600
www.securenet.de

Sitz der Gesellschaft: M=FCnchen
HRB M=FCnchen 118876
Gesch=E4ftsf=FChrer: Thomas Schreiber

