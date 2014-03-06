From: Francisco Javier Sanchez-Roselly <fnavarro@ujaen.es>
Subject: arp for SNATed addresses
Date: Thu, 6 Mar 2014 10:21:49 +0100
Message-ID: <8FD4D791-550A-4AD2-AD8B-8A6F8BBD01D6@ujaen.es>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org
Cc: Francisco Javier Sanchez-Roselly <fnavarro@ujaen.es>

dear All,

i am running IPTables in a two interfaced Ubuntu box 12.04. i have conf=
igured a SNAT for the addresses in the =91inside=92 network to VALID ad=
dresses in the =91outside=92 one.

the box translates nicely, but its =91outside=92 interface does not res=
pond to ARP request asking for the MAC address associated to the VALID =
addresses used for translation. this implies =91inside=92 hosts can not=
 communicate with =91outside=92 ones. nevertheless, MASQUERADing or SNA=
Ting to the IP address configured in the box =91outside=92 interface wo=
rks nicely. this implies it is surely an ARP issue.

i guess this is an odd behaviour, as previously i have used the same ne=
twork scheme without any problem.

any advice?

thanks, regards.

francisco javier




