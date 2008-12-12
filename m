From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: Using MARK and TOS to route traffic through different interfaces to the same destination
Date: Fri, 12 Dec 2008 12:57:46 +0100
Message-ID: <145d4e1a0812120357i12694aa6o11c64fba2ab8fefb@mail.gmail.com>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>
	 <49410A7C.6010501@plouf.fr.eu.org>
	 <145d4e1a0812110515j30341cc0s438505a5e3785f74@mail.gmail.com>
	 <49423E07.6050806@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=t8vN60+RILaDNarVudunFuEizXhBAjk5m854lmiPeVc=;
        b=jnsuom7LxuKMzKIA4iNkQHZTHNvnrW+UuujaAfA8GSG6lBBomvVES4Q1yAy4gbHPLF
         BvtUTQZwy7BTrmN52BbIbGpPupwtuSwfZ/NK/c5UXXH5rx55Xklymiz2vc8oiZZCxpyj
         /gVzPzI3D2044w+2ahxkR+CMYmEk4mpEkmEAM=
In-Reply-To: <49423E07.6050806@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi,

It seems that it matches and manages more or less properly, but the IP
address not change while the output interface seems to be selected
accordingly the rules. As said before, each interface is binded to a
different IP address.

This is the configuration I set:

sudo ifconfig ath0 192.168.0.150 netmask 255.255.255.128
sudo ifconfig eth0 192.168.0.3 netmask 255.255.255.128

sudo ip route flush table 1
sudo ip route flush table 2
sudo iptables -F OUTPUT -t mangle

# Mark traffic from port 60301 with 1 and from port 60302 with 2
sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j TOS --set-tos=
 0x10
sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j TOS --set-tos=
 0x08

sudo ip rule add tos 0x10 table 1 prio 1
sudo ip rule add tos 0x08 table 2 prio 2

sudo ip route add table 1 192.168.0.2 dev ath0
sudo ip route add table 2 192.168.0.2 dev eth0


This is how the configuration is set:

dulceangustia@spike:~$ sudo iptables --list -t mangle
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
TOS        tcp  --  anywhere             anywhere            tcp
dpt:60301 TOS set Minimize-Delay
TOS        tcp  --  anywhere             anywhere            tcp
dpt:60302 TOS set Maximize-Throughput

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
dulceangustia@spike:~$ ip route
192.168.0.0/25 dev eth0  proto kernel  scope link  src 192.168.0.3
192.168.0.128/25 dev ath0  proto kernel  scope link  src 192.168.0.150
default via 192.168.0.1 dev eth0
dulceangustia@spike:~$ sudo ip route show table 1
192.168.0.2 dev ath0  scope link
dulceangustia@spike:~$ sudo ip route show table 2
192.168.0.2 dev eth0  scope link
dulceangustia@spike:~$ sudo ip rule show
0:      from all lookup local
1:      from all tos lowdelay lookup 1
2:      from all tos throughput lookup 2
32766:  from all lookup main
32767:  from all lookup default


And this is what I get:

dulceangustia@spike:~$ sudo iptables -vL
Chain INPUT (policy ACCEPT 80932 packets, 60M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 100K packets, 116M bytes)
 pkts bytes target     prot opt in     out     source
destination
dulceangustia@spike:~$ sudo iperf -c 192.168.0.2 -t 1 -p 60301 -r
------------------------------------------------------------
Server listening on TCP port 60301
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
------------------------------------------------------------
Client connecting to 192.168.0.2, TCP port 60301
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  5] local 192.168.0.3 port 40316 connected with 192.168.0.2 port 6030=
1
[  5]  0.0- 1.0 sec  3.52 MBytes  29.4 Mbits/sec
[  4] local 192.168.0.3 port 60301 connected with 192.168.0.2 port 6007=
7
[  4]  0.0- 1.1 sec  12.1 MBytes  93.8 Mbits/sec
dulceangustia@spike:~$ sudo iptables -vL
Chain INPUT (policy ACCEPT 91086 packets, 73M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 107K packets, 120M bytes)
 pkts bytes target     prot opt in     out     source
destination
dulceangustia@spike:~$ sudo iperf -c 192.168.0.2 -t 1 -p 60302 -r
------------------------------------------------------------
Server listening on TCP port 60302
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
------------------------------------------------------------
Client connecting to 192.168.0.2, TCP port 60302
TCP window size: 16.0 KByte (default)
------------------------------------------------------------
[  5] local 192.168.0.3 port 54737 connected with 192.168.0.2 port 6030=
2
[  5]  0.0- 1.0 sec  11.6 MBytes  97.5 Mbits/sec
[  4] local 192.168.0.3 port 60302 connected with 192.168.0.2 port 4285=
4
[  4]  0.0- 1.1 sec  12.6 MBytes  93.8 Mbits/sec
dulceangustia@spike:~$ sudo iptables -vL
Chain INPUT (policy ACCEPT 105K packets, 87M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 121K packets, 133M bytes)
 pkts bytes target     prot opt in     out     source               des=
tination


As you can note, the IP address remains unchanged even the packets
being sent through the correct interface. So the server, according to
its ARP table sends back the packet stream to the interface binded to
the source IP address, this not being the same interface where the
packets came from.

I don't know why the source IP address is not changed. May be a
problem of ip route and not iptables? Any idea about how to solve it?
I tried also to add a POSTROUTING SNAT rule to change the origin
source but it doesn't take any effect.

It's a weird behavior (or I'm missing an important issue in this
packet management).


Regards,
Javi


2008/12/12 Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
>
> Javier G=E1lvez Guerrero a =E9crit :
>>>
>>>>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j MARK --=
set-mark 1
>>>>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j MARK --=
set-mark 2
>>>
>>> These rules match the destination port. Replace --dport with --spor=
t to
>>> match the source port.
>>
>> Sorry, 60301 and 60302 are both destination port. I made a mistake
>> when explaining it. I need to route packets depending on the
>> DESTINATION port.
>
> Did you check that the iptables rules actually match packets ? Are th=
e associated counters shown by iptables -vL or iptables-save -c increme=
nting ?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
