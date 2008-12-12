From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: Using MARK and TOS to route traffic through different interfaces to the same destination
Date: Fri, 12 Dec 2008 15:07:18 +0100
Message-ID: <145d4e1a0812120607o3594436bi3f7aee6f3df1c552@mail.gmail.com>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>
	 <49410A7C.6010501@plouf.fr.eu.org>
	 <145d4e1a0812110515j30341cc0s438505a5e3785f74@mail.gmail.com>
	 <49423E07.6050806@plouf.fr.eu.org>
	 <145d4e1a0812120357i12694aa6o11c64fba2ab8fefb@mail.gmail.com>
	 <49425C34.3050108@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=lyPhmJylmtcTLGvY4bfBCY9l5hLg+FHoPJ6sDIALj5c=;
        b=eJnsoVDry7BXAMerVhDysg8VXOfTZ4XzF4seIEn3FhpO8WcR5bDGCFRZ0FJldWdpwT
         vaEXvCk5EH2vwUxUITVxJVKvDSAOg0b9688Dh+ClGK8S7RHOraFOKP0sndYXt552iOg9
         gknYoczqEFrpSPhRXmYKFQKeaBC4UQTguqWzM=
In-Reply-To: <49425C34.3050108@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi,

Thanks for your answer.

2008/12/12 Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> Javier G=E1lvez Guerrero a =E9crit :
>>
>> It seems that it matches and manages more or less properly, but the =
IP
>> address not change while the output interface seems to be selected
>> accordingly the rules. As said before, each interface is binded to a
>> different IP address.
>
> The source address is selected either by the sender process or by the
> initial routing decision, before the OUTPUT chains. Rerouting after t=
he
> OUTPUT chains does not alter it even though the output interface has
> changed. Thus the source address selection is unaware of iptables-bas=
ed
> advanced routing.

Ok. So, as you said, I must use SNAT or tell the application the
source IP to be used.

>
>> This is the configuration I set:
>
> [...]
>>
>> sudo ip route add table 1 192.168.0.2 dev ath0
>> sudo ip route add table 2 192.168.0.2 dev eth0
>
> Isn't there a typo ? These commands create host routes to 192.168.0.2=
, not
> default routes via gateway 192.168.0.2 as in your previous message.

In the previous message I used another script with different entries;
it told the host where was the gateway (192.168.0.1. In the later,
what I say is which interface must be used when the packets are to be
sent to host 192.168.0.2 (the server).

> Another problem is that according to the interface subnets and the ma=
in
> routing table, 192.168.0.2 is reachable only on eth0, not ath0.

May the problems be related to this issue? By the way, I have set
/proc/sys/net/ipv4/route/min_delay and max_delay values to 0, so
routing changes (should) take effect inmediately, then flushing the
routing cache.

>
>> dulceangustia@spike:~$ ip route
>> 192.168.0.0/25 dev eth0  proto kernel  scope link  src 192.168.0.3
>> 192.168.0.128/25 dev ath0  proto kernel  scope link  src 192.168.0.1=
50
>> default via 192.168.0.1 dev eth0
>
> Are both interfaces on the same link ? If yes, what is the subnet on =
that
> link ?

What do you mean? How can I know this? Actually, these entries are
automatically added when configuring the interfaces with ifconfig. As
you may have noted, I'm not an expert either on iptables nor on
routing U_U.
>
>> And this is what I get:
>>
>> dulceangustia@spike:~$ sudo iptables -vL
>
> This command only shows the default (filter) table. You want to displ=
ay the
> mangle table with -t mangle.

Ok. Here it goes another test results. It seems that iptables mangling
works properly:


dulceangustia@spike:~$ sudo iptables -vL -t mangle
Chain PREROUTING (policy ACCEPT 114K packets, 93M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain INPUT (policy ACCEPT 113K packets, 92M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 130K packets, 135M bytes)
 pkts bytes target     prot opt in     out     source
destination
14946   22M TOS        tcp  --  any    any     anywhere
anywhere            tcp dpt:60301 TOS set Minimize-Delay
42073   63M TOS        tcp  --  any    any     anywhere
anywhere            tcp dpt:60302 TOS set Maximize-Throughput

Chain POSTROUTING (policy ACCEPT 130K packets, 135M bytes)
 pkts bytes target     prot opt in     out     source
destination
dulceangustia@spike:~$ sudo iperf -c 192.168.0.2 -t 1 -p 60301 -r
------------------------------------------------------------
Server listening on TCP port 60301
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
------------------------------------------------------------
Client connecting to 192.168.0.2, TCP port 60301
TCP window size: 22.6 KByte (default)
------------------------------------------------------------
[  5] local 192.168.0.3 port 44517 connected with 192.168.0.2 port 6030=
1
[  5]  0.0- 1.0 sec  3.20 MBytes  26.4 Mbits/sec
[  4] local 192.168.0.3 port 60301 connected with 192.168.0.2 port 3885=
8
[  4]  0.0- 1.1 sec  12.8 MBytes  94.1 Mbits/sec
dulceangustia@spike:~$ sudo iptables -vL -t mangle
Chain PREROUTING (policy ACCEPT 125K packets, 107M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain INPUT (policy ACCEPT 124K packets, 106M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 137K packets, 139M bytes)
 pkts bytes target     prot opt in     out     source
destination
17404   26M TOS        tcp  --  any    any     anywhere
anywhere            tcp dpt:60301 TOS set Minimize-Delay
42073   63M TOS        tcp  --  any    any     anywhere
anywhere            tcp dpt:60302 TOS set Maximize-Throughput

Chain POSTROUTING (policy ACCEPT 137K packets, 139M bytes)
 pkts bytes target     prot opt in     out     source
destination
dulceangustia@spike:~$ sudo iperf -c 192.168.0.2 -t 1 -p 60302 -r
------------------------------------------------------------
Server listening on TCP port 60302
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
------------------------------------------------------------
Client connecting to 192.168.0.2, TCP port 60302
TCP window size: 26.4 KByte (default)
------------------------------------------------------------
[  5] local 192.168.0.3 port 44293 connected with 192.168.0.2 port 6030=
2
[  5]  0.0- 1.0 sec  11.6 MBytes  96.2 Mbits/sec
[  4] local 192.168.0.3 port 60302 connected with 192.168.0.2 port 3937=
0
[  4]  0.0- 1.1 sec  12.1 MBytes  93.8 Mbits/sec
dulceangustia@spike:~$ sudo iptables -vL -t mangle
Chain PREROUTING (policy ACCEPT 138K packets, 120M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain INPUT (policy ACCEPT 137K packets, 120M bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 150K packets, 152M bytes)
 pkts bytes target     prot opt in     out     source
destination
17404   26M TOS        tcp  --  any    any     anywhere
anywhere            tcp dpt:60301 TOS set Minimize-Delay
50518   76M TOS        tcp  --  any    any     anywhere
anywhere            tcp dpt:60302 TOS set Maximize-Throughput

Chain POSTROUTING (policy ACCEPT 151K packets, 152M bytes)
 pkts bytes target     prot opt in     out     source
destination


>
>> I don't know why the source IP address is not changed. May be a
>> problem of ip route and not iptables?
>
> I explained why the source address is unchanged, see above.

Ok.

>
>> Any idea about how to solve it?
>
> Either select the source address in the sender process (if you can se=
lect
> the destination port, you may be able to select the source address to=
o) or
> use iptables SNAT.
>
>> I tried also to add a POSTROUTING SNAT rule to change the origin
>> source but it doesn't take any effect.
>
> It should work. What rules did you try ? Note that iperf shows only t=
he
> initial source address before SNAT, not the actual address on the wir=
e.

These are the SNAT rules I use:

# Change the source IP of outgoing iperf traffic to 60302 port
sudo iptables -t nat -A POSTROUTING -p tcp --dport 60302 -j SNAT
--to-source 192.168.0.3

# Change the source IP of outgoing iperf traffic to 60301 port
sudo iptables -t nat -A POSTROUTING -p tcp --dport 60301 -j SNAT
--to-source 192.168.0.150


Thank you so much,
Javi


> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
