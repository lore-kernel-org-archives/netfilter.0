From: Scott Shambarger <scott-netfilter@shambarger.net>
Subject: Returning nat packets vanishing after mangle:PREROUTING and conntrack
 processing
Date: Fri, 18 Dec 2009 10:23:45 -0800
Message-ID: <7ad63010a18944d3264b5ba158c236df@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


I have a multi-homed server, and have been routing packets selectively

between the public interfaces using iptables marking and iproute2 tables.



The setup worked well until I upgraded to 2.6.31 (Fedora 11->12 upgrade),

and then connection tracking apparently broke.  I've struggled with it for

some time, but think I may be encountering new/changed kernel behavior

since 2.6.30 (which worked).



With the setup below, bringing down either public interface results in

normal conntrack behavior (packets are correctly nat'd back to their

source).



Sadly, I've been hacking with the settings so much to track the source of

the breakage that I no longer have the iptables/iproute2 setup that worked

in 2.6.30, but I can't see why the setup below shouldn't work as intended.



My (simplified) setup is as follows:



Definitions:

PRIV - internal IP on eth0 (PRIV-NET is subnet)

DSL - static public IP on eth1 (DSL-NET is subnet, DSL-GW is gateway)

CABLE - dynamic public IP on eth2 (CABLE-NET is subnet, CABLE-GW is

gateway)

INT - host IP on internal eth0 network

EXT - external host IP (reachable via eth1 or eth2)



router# tail -2 /etc/iproute2/rt_tables

200	cable

201	dsl



router# ip rule list

0:	from all lookup local 

32756:	from all fwmark 0x2 lookup cable 

32757:	from all to <cable-dhcp-server> lookup cable 

32758:	from <CABLE> lookup cable 

32759:	from all fwmark 0x1 lookup dsl 

32760:	from <DSL> lookup dsl 

32766:	from all lookup main 

32767:	from all lookup default 



router# ip route list

<DSL-NET> dev eth1  proto kernel  scope link  src <DSL> 

<PRIV-NET> dev eth0  proto kernel  scope link  src <PRIV> 

<CABLE-NET> dev eth2  proto kernel  scope link  src <CABLE> 

169.254.0.0/16 dev eth0  scope link  metric 1002 

default via <DSL-GW> dev eth1



router# ip route list table default

default via <CABLE-GW> dev eth2



router# ip route list table dsl

<PRIV-NET> dev eth0  scope link  src <PRIV> 

<CABLE-NET> dev eth2  scope link  src <CABLE>

default via <DSL-GW> dev eth1



router# ip route list table cable

<DSL-NET> dev eth1  scope link  src <DSL> 

<PRIV-NET> dev eth0  scope link  src <PRIV> 

default via <CABLE-GW> dev eth2 



(simplified iptables config)

*raw

-A PREROUTING -p tcp -d <EXT> -j TRACE

-A PREROUTING -p tcp -s <EXT> -j TRACE

*nat

-A POSTROUTING -o eth1 -j SNAT --to-source <DSL>

-A POSTROUTING -o eth2 -j MASQUERADE

*mangle

-A PREROUTING -m state --state ESTABLISHED,RELATED -j CONNMARK

--restore-mark

-A PREROUTING -i eth0 -m state --state NEW -j CONNMARK --set-mark 2

-A PREROUTING -i eth1 -m state --state NEW -j CONNMARK --set-mark 1

-A PREROUTING -i eth2 -m state --state NEW -j CONNMARK --set-mark 2

-A PREROUTING -m connmark --mark 1 -j MARK --set-mark 1

-A PREROUTING -m connmark --mark 2 -j MARK --set-mark 2

-A PREROUTING -m state --state NEW -m connmark ! --mark 0 -j CONNMARK

--save-mark

-A OUTPUT -m state --state ESTABLISHED,RELATED -j CONNMARK --restore-mark



Here's the trace output and conntrack details from the following command

issued on the internal host <INT> (on the <PRIV> network):



<INT># curl -I http://<EXT>



router# tcpdump -i eth2 -nn 'host <EXT>'

09:08:04.524942 IP <CABLE>.52800 > <EXT>.80: Flags [S], seq 304914632, win

65535, options [mss 1460,nop,wscale 3,nop,nop,TS val 521390037 ecr

0,sackOK,eol], length 0

09:08:04.540042 IP <EXT>.80 > <CABLE>.52800: Flags [S.], seq 2326757745,

ack 304914633, win 5792, options [mss 1460,sackOK,TS val 3283546987 ecr

521390037,nop,wscale 7], length 0





router# conntrack -E -p tcp -d <EXT>

    [NEW] tcp      6 120 SYN_SENT src=<INT> dst=<EXT> sport=52800 dport=80

[UNREPLIED] src=<EXT> dst=<CABLE> sport=80 dport=52800 mark=2

 [UPDATE] tcp      6 59 SYN_RECV src=<INT> dst=<EXT> sport=52800 dport=80

src=<EXT> dst=<CABLE> sport=80 dport=52800 mark=2





router# conntrack -L -p tcp -d <EXT> --sport 52800

tcp      6 55 SYN_RECV src=<INT> dst=<EXT> sport=52800 dport=80 packets=1

bytes=64 src=<EXT> dst=<CABLE> sport=80 dport=52800 packets=6 bytes=360

mark=2 secmark=0 use=2





router# cat syslog

Dec 18 09:08:04 home kernel: TRACE: raw:PREROUTING:policy:3 IN=eth0 OUT=

SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=45328 DF PROTO=TCP

SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:rule:2 IN=eth0 OUT=

SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=45328 DF PROTO=TCP

SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:rule:6 IN=eth0 OUT=

SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=45328 DF PROTO=TCP

SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:rule:7 IN=eth0 OUT=

SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=45328 DF PROTO=TCP

SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT

MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:policy:8 IN=eth0

OUT= SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=45328 DF

PROTO=TCP SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN

URGP=0 OPT MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: nat:PREROUTING:policy:1 IN=eth0 OUT=

SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=45328 DF PROTO=TCP

SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT

MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: mangle:FORWARD:policy:1 IN=eth0

OUT=eth2 SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=63 ID=45328 DF

PROTO=TCP SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN

URGP=0 OPT MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: filter:FORWARD:policy:1 IN=eth0

OUT=eth2 SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=63 ID=45328 DF

PROTO=TCP SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN

URGP=0 OPT MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: mangle:POSTROUTING:policy:1 IN=

OUT=eth2 SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=63 ID=45328 DF

PROTO=TCP SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN

URGP=0 OPT MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: nat:POSTROUTING:rule:2 IN= OUT=eth2

SRC=<INT> DST=<EXT> LEN=64 TOS=0x00 PREC=0x00 TTL=63 ID=45328 DF PROTO=TCP

SPT=52800 DPT=80 SEQ=304914632 ACK=0 WINDOW=65535 RES=0x00 SYN URGP=0 OPT

MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: raw:PREROUTING:policy:3 IN=eth2 OUT=

SRC=<EXT> DST=<CABLE> LEN=60 TOS=0x00 PREC=0x20 TTL=55 ID=0 DF PROTO=TCP

SPT=80 DPT=52800 SEQ=2326757745 ACK=304914633 WINDOW=5792 RES=0x00 ACK SYN

URGP=0 OPT

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:rule:1 IN=eth2 OUT=

SRC=<EXT> DST=<CABLE> LEN=60 TOS=0x00 PREC=0x20 TTL=55 ID=0 DF PROTO=TCP

SPT=80 DPT=52800 SEQ=2326757745 ACK=304914633 WINDOW=5792 RES=0x00 ACK SYN

URGP=0 OPT

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:rule:6 IN=eth2 OUT=

SRC=<EXT> DST=<CABLE> LEN=60 TOS=0x00 PREC=0x20 TTL=55 ID=0 DF PROTO=TCP

SPT=80 DPT=52800 SEQ=2326757745 ACK=304914633 WINDOW=5792 RES=0x00 ACK SYN

URGP=0 OPT MARK=0x2 

Dec 18 09:08:04 home kernel: TRACE: mangle:PREROUTING:policy:8 IN=eth2

OUT= SRC=<EXT> DST=<CABLE> LEN=60 TOS=0x00 PREC=0x20 TTL=55 ID=0 DF

PROTO=TCP SPT=80 DPT=52800 SEQ=2326757745 ACK=304914633 WINDOW=5792

RES=0x00 ACK SYN URGP=0 OPT MARK=0x2 





And that's where the packet dissappears... it apparently has been seen by

conntrack, but fails to appear in the nat:PREROUTING chain.



Any suggestion on how I can discover what is happening to the packet at

this point?



Please excuse any mistakes I made sanitizing the output, and let me know

if I can provide any further details that might help.



Thanks,

Scott




