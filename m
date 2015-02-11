From: Tim Coote <tim@coote.org>
Subject: conntrack apparently losing connections in kernel 3.18
Date: Wed, 11 Feb 2015 13:35:51 +0000
Message-ID: <F61DA2E3-57F1-47E5-9A6B-15F82E3E919B@coote.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I=E2=80=99m running iptables on a fedora 20 vm, kernel 3.18.5-101.fc20.=
i686+PAE. I=E2=80=99ve also had the same issue with a 3.17 kernel, but =
don=E2=80=99t have the logged data.

The setup is quite vanilla, but I seem to be losing conntrack connectio=
ns on a regular basis (maybe a few per hour). If I do a regular dump of=
 the conntrack data (conntrack -L -o ktimestamp), every 100s, I can occ=
asionally catch this sort of output, which I think is occurring immedia=
tely before the lost connection:

tcp      6 431996 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D20 [start=3DWed Feb =
11 09:07:14 2015] use=3D1
tcp      6 431987 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D120 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431997 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D220 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431936 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D320 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431991 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D420 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431996 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D520 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431980 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D620 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431880 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D720 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431780 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D820 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431680 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D920 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1
tcp      6 431580 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D1020 [start=3DWed Fe=
b 11 09:07:14 2015] use=3D1
tcp      6 431480 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D1120 [start=3DWed Fe=
b 11 09:07:14 2015] use=3D1
tcp      6 431380 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D1221 [start=3DWed Fe=
b 11 09:07:14 2015] use=3D1
tcp      6 431280 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D1321 [start=3DWed Fe=
b 11 09:07:14 2015] use=3D1
tcp      6 431179 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sp=
ort=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D=
5222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D1421 [start=3DWed Fe=
b 11 09:07:14 2015] use=3D1
tcp      6 295 ESTABLISHED src=3D172.17.1.111 dst=3D50.22.240.167 sport=
=3D50119 dport=3D5222 src=3D50.22.240.167 dst=3D192.168.31.60 sport=3D5=
222 dport=3D50119 [ASSURED] mark=3D0 delta-time=3D1521 [start=3DWed Feb=
 11 09:07:14 2015] use=3D1


The vm has an IP address of 192.168.31.60, and an address on the 172.17=
=2E0.0/16 subnet.

The lines are separated by 100s. If I understand that output correctly,=
 the tcp connection between 172.17.1.111 and 50.22.240.167 is initially=
 being used, and then the timeout starts to tick down from ~431980 seco=
nds to 431179 as one would expect. And then 100s later, it drops to 295=
=2E The connection is missing 100s after that line.

I=E2=80=99ve not fully nailed it down, but I suspect that the connectio=
n then gets timed out and is therfore no longer present when one end tr=
ies to use it.

I cannot find a known bug for this behaviour, and I could be misinterpr=
eting how conntrack should behave (eg I may have missed a timeout), but=
 I don=E2=80=99t think so.

Can anyone confirm that there is an issue here, or where else I should =
look/what I can look at?

iptables reports these rules, which show the dropped packets. The uptim=
e at this point was just under two days:

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination        =20
2027K 2061M ACCEPT     all  --  any    any     anywhere             any=
where             state RELATED,ESTABLISHED
   19  1400 ACCEPT     icmp --  any    any     anywhere             any=
where           =20
    0     0 ACCEPT     all  --  lo     any     anywhere             any=
where           =20
   10   704 ACCEPT     tcp  --  any    any     anywhere             any=
where             state NEW tcp dpt:ssh
    0     0 ACCEPT     udp  --  any    any     anywhere             any=
where             udp dpt:bootpc
  151 53741 ACCEPT     udp  --  any    any     anywhere             any=
where             udp dpt:bootps
20611 2020K ACCEPT     all  --  any    any     172.17.0.0/16        any=
where           =20
  113 21844 LOG        all  --  any    any     anywhere             any=
where             limit: avg 2/min burst 5 LOG level warning prefix "dr=
opping: "
  133 27243 REJECT     all  --  any    any     anywhere             any=
where             reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT 39689 packets, 3595K bytes)
 pkts bytes target     prot opt in     out     source               des=
tination        =20
 632K  398M ACCEPT     all  --  any    any     anywhere             any=
where             state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  any    any     anywhere             any=
where           =20
    0     0 ACCEPT     all  --  lo     any     anywhere             any=
where           =20

Chain OUTPUT (policy ACCEPT 2041K packets, 1307M bytes)
 pkts bytes target     prot opt in     out     source               des=
tination        =20


tia
Tim