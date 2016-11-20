From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Subject: basic understanding of iptables - some questions
Date: Sun, 20 Nov 2016 21:45:05 +0100 (CET)
Message-ID: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.9.2 mtaextp1.scidom.de 05C8C140D3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=helmholtz-muenchen.de; s=97B699D0-53CF-11E6-BAFD-F949FBED776F;
        t=1479674707; bh=oWYx9XvA3leAyur3mMCggHnjiTGPpX9/A/z5lSZTVpo=;
        h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
         Content-Transfer-Encoding;
        b=bZpf8rSFzvqBCNeoBR1fMB4Tx7yOjkDwC5vL31zdHNeVkljqZIBu5XvJyTQAFGrEt
         XHl0sUpG0PQnmSaG28crveAia/XzNhYANkhxm4G3zWkIBVY8528fzj04bbux7tKbsv
         42DLASER75R7XKECzLvRgVHB1niFmbZBgrlfp/qk=
DKIM-Filter: OpenDKIM Filter v2.9.2 mtaintp1.scidom.de DDC9F1012B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=helmholtz-muenchen.de; s=97B699D0-53CF-11E6-BAFD-F949FBED776F;
        t=1479674705; bh=EkYaf/ehAjpC3LUHZERe+FG3mMLML2JHkBCkfJQ2Ljk=;
        h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
         Content-Transfer-Encoding;
        b=TCmLqyYku6onw5DkZnOsZ1xrF0qlUep68a9ZPo11t8Llh5NFVcazZIwfkXgU9u4nS
         S/Cll/68gfJRLGGVfWLV2PbZh4gTd8W7o0BrpddB5JcFIYcbCNhwg8LC48PgzYuBGo
         DGUHxqL6Zg0flXztkJcNV9RIxepyki6uCMFONbxw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter <netfilter@vger.kernel.org>

Hi,



I'm trying to understand Ubuntu 16.04 (kernel 4.4.0-45-generic) firewall ru=
les. See the rules for the chain INPUT:

Chain INPUT (policy DROP 20 packets, 800 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
  880  134K ufw-before-logging-input  all  --  *      *       0.0.0.0/0    =
        0.0.0.0/0
  880  134K ufw-before-input  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0
  481 86297 ufw-after-input  all  --  *      *       0.0.0.0/0            0=
.0.0.0/0
   20   800 ufw-after-logging-input  all  --  *      *       0.0.0.0/0     =
       0.0.0.0/0
   20   800 ufw-reject-input  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0
   20   800 ufw-track-input  all  --  *      *       0.0.0.0/0            0=
.0.0.0/0

chain ufw-before-logging-input (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion


Chain ufw-before-logging-input does nothing, so evaluating the rules contin=
ues with ufw-before-input:

Chain ufw-before-input (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0=
/0
  317 22568 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0=
/0            ctstate RELATED,ESTABLISHED
    0     0 ufw-logging-deny  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0            ctstate INVALID
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0=
/0            ctstate INVALID
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0=
/0            icmptype 3
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0=
/0            icmptype 4
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0=
/0            icmptype 11
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0=
/0            icmptype 12
    4   112 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0=
/0            icmptype 8
   72 23616 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0=
/0            udp spt:67 dpt:68
  487 87216 ufw-not-local  all  --  *      *       0.0.0.0/0            0.0=
.0.0/0
    6   919 ACCEPT     udp  --  *      *       0.0.0.0/0            224.0.0=
.251          udp dpt:5353
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            239.255=
.255.250      udp dpt:1900
  481 86297 ufw-user-input  all  --  *      *       0.0.0.0/0            0.=
0.0.0/0

First question:=20
second rule: is that the rule for responses from outgoing packets ? E.g. i =
start a browser and open a web page. First my host does a TCP SYN to the we=
b server, and this one answers with a tcp SYN ACK.
Because man iptables-extensions says:

ESTABLISHED: The packet is associated with a connection which has seen pack=
ets in both directions.
RELATED: The packet is starting a new connection, but is associated with an=
 existing connection, such as an FTP data transfer or an ICMP error.

Because ESTABLISHED must have seen packets in BOTH directions. When i open =
a web page and the first packet comes back from the webserver (SYN ACK), th=
is connection does not have seen packets in both directions.
And RELATED, as i understand, is e.g. for ftp, which uses in one session di=
fferent destination ports (i think one for control and one for data ?).

But if this is not the rule for the first packet coming back, where is this=
 rule ?

This chain also accepts packets for icmp, dhcp, upnp and mDNS. Right ?

OK. Evaluating continues with ufw-user-input, which are e.g. the services o=
pened by the admin for some services, like ssh ...

Chain ufw-user-input (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
41587 1849K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0            tcp dpt:22
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0=
/0            udp dpt:22
    1    60 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0            tcp dpt:7937
    5   300 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0=
/0            tcp dpt:7938
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0=
/0            udp dpt:7938


Evaluating continues with ufw-after-input, which drops e.g. some packtes fo=
r windows services (file sharing ...) and dhcp.
  It does this by calling another chain which drops the packets.

Chain ufw-after-input (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
18978 1486K ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            udp dpt:137
 5358 1231K ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            udp dpt:138
    0     0 ufw-skip-to-policy-input  tcp  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            tcp dpt:139
    0     0 ufw-skip-to-policy-input  tcp  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            tcp dpt:445
67988   25M ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            udp dpt:67
    0     0 ufw-skip-to-policy-input  udp  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            udp dpt:68
 159K   20M ufw-skip-to-policy-input  all  --  *      *       0.0.0.0/0    =
        0.0.0.0/0            ADDRTYPE match dst-type BROADCAST

Chain ufw-skip-to-policy-input (7 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
 251K   48M DROP       all  --  *      *       0.0.0.0/0            0.0.0.0=
/0


And THEN comes ufw-after-logging-input, which logs all the packets which su=
rvived all the previous rules.

Chain ufw-after-logging-input (1 references)
 pkts bytes target     prot opt in     out     source               destina=
tion
42933 1717K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0=
/0            LOG flags 8 level 4 prefix "[UFW BLOCK INPUT] "


So ufw-after-logging-input comes into play when there is a packet which has=
 no previous packet in any direction, is not for the allowed services nor f=
or the denied services.
E.g. i do a port scan to 12345 on that host. Right ? It should be logged by=
 that rule. Because i don't have a service running on port 12345.

The reason i'm asking is that i have some logging from this rule with ip ad=
dresses not from our network, and i'd like to know when this rule comes int=
o play.

I'd appreciate any help, if you want to know more please ask me.

Thanks.

Bernd


--=20
Bernd Lentes=20

Systemadministration=20
institute of developmental genetics=20
Geb=C3=A4ude 35.34 - Raum 208=20
HelmholtzZentrum M=C3=BCnchen=20
bernd.lentes@helmholtz-muenchen.de=20
phone: +49 (0)89 3187 1241=20
fax: +49 (0)89 3187 2294=20

Erst wenn man sich auf etwas festlegt kann man Unrecht haben=20
Scott Adams
=20

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Alfons Enhsen
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671


--=20
ubuntu-users mailing list
ubuntu-users@lists.ubuntu.com
Modify settings or unsubscribe at: https://lists.ubuntu.com/mailman/listinf=
o/ubuntu-users
 

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Alfons Enhsen
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671

