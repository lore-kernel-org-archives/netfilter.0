From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Subject: RE: Iptables rule on span traffic
Date: Wed, 25 Apr 2007 19:21:10 -0700
Message-ID: <E8AFFEFDBE97C94E9297963F0527A07B01E821F4@pmi00exf00.us.packetmotion.com>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>	<1177172639.25008.1.camel@anduril.intranet.cartel-securite.net><E8AFFEFDBE97C94E9297963F0527A07B01DFB0EC@pmi00exf00.us.packetmotion.com>	<462A8014.6000105@plouf.fr.eu.org><E8AFFEFDBE97C94E9297963F0527A07B01DFB16F@pmi00exf00.us.packetmotion.com><462C4337.1060508@rtij.nl>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFB187@pmi00exf00.us.packetmotion.com>
	<016c01c78593$061fc2e0$0302a8c0@southern>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFBA0D@pmi00exf00.us.packetmotion.com>
	<007301c787a6$13fdceb0$6501a8c0@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <007301c787a6$13fdceb0$6501a8c0@southern>
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
Content-Type: text/plain; charset="iso-8859-1"
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

The objective is to block of "bad traffic" with the Linux box running =
iptables rules not being inline (but able to see the relevant traffic =
off of a span port). Essentially achieve what fwsnort/iptables does for =
IPS (not just IDS), but without being inline. Logging the "bad traffic" =
is only incidental.=20

Siva

-----Original Message-----
From: hareram [mailto:hareram@sol.net.in]=20
Sent: Wednesday, April 25, 2007 6:56 PM
To: Krishnamoorthy (Siva) Sivakumar
Subject: Re: Iptables rule on span traffic

Hi


i got your explanation

what is the object to achieve
only port mirror traffic and log to Linux box?

or you looking some IPS/IDS ? is the Linux box does only logging ?
or you looking to route the traffic ?

if you looking to statistics only to this box
look at NTOP, will give you better than this.

ram
----- Original Message -----=20
From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
To: "hareram" <hareram@sol.net.in>
Sent: Thursday, April 26, 2007 3:35 AM
Subject: RE: Iptables rule on span traffic



The switch is a DELL powerconnect 2708 switch with 8 ports. Ports 1-4 =
are=20
mirrored onto port 8 (where eth0 is connected). Port 1 is connected to a =

10.0.3.10 machine. Ports 2, 4 are connected to two 10.0.4.* machines. =
Rest=20
of the ports are unused.


Here is a little ASCII art of the connections.

---------------------------------
|                                                  |
|               eth0 (11.0.3.91)          |<------->  Span port
|                                                  |
|     Machine running IPtables       |
|                                                  |
|               eth1 (10.0.3.12)          |<------->  Regular switch =
port
|                                                  |
|                                                  |
---------------------------------

I enabled IP forwarding using:
echo 1 > /proc/sys/net/ipv4/ip_forward

Before doing that, I ran the following shell script to load the iptables =

rules.

#######################
$IPTABLES -A FWSNORT_FORWARD -p tcp --dport 80 -m string --string=20
".txt" --algo bm -m comment --comment "msg: test; FWS:0.9.0;" -j=20
LOG --log-ip-options --log-tcp-options --log-prefix "[1] REJ SID1000002 =
"

$IPTABLES -A FWSNORT_FORWARD -p tcp --dport 80 -m string --string=20
".txt" --algo bm -j REJECT --reject-with tcp-reset

$IPTABLES -A FWSNORT_INPUT -p tcp --dport 80 -m string --string=20
".txt" --algo bm -m comment --comment "msg: test; FWS:0.9.0;" -j=20
LOG --log-ip-options --log-tcp-options --log-prefix "[1] REJ SID1000002 =
"

$IPTABLES -A FWSNORT_INPUT -p tcp --dport 80 -m string --string=20
".txt" --algo bm -j REJECT --reject-with tcp-reset

$IPTABLES -A FWSNORT_FORWARD -p all -j DROP
######################

I added the last rule at the end so that any packet forwarded from the =
span=20
port and not caught (and rejected) by the earlier rules does not =
actually=20
make it out of the other interface, causing an infinite loop.

It still seems like the iptables rules have no effect on the traffic on =
eth0=20
(connected to span port) but only on eth1. There was no tcp reset sent =
in=20
response to accessing a .txt file nor was there a corresponding a log =
entry=20
when I checked using the dmesg command.

For traffic directed at the machine on eth1, there was both a log and a =
tcp=20
reset.

Anyone have any ideas to try, please let me know.

Siva

-----Original Message-----
From: hareram [mailto:hareram@sol.net.in]
Sent: Monday, April 23, 2007 3:35 AM
To: Krishnamoorthy (Siva) Sivakumar
Subject: Re: Iptables rule on span traffic

Its also need a proper config need at Cisco Switch Side

kindly post your Switch config

and how does the connections diagram, will be able to give you proper
deployement

ram
----- Original Message -----=20
From: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
To: "Martijn Lievaart" <m@rtij.nl>
Cc: <netfilter@lists.netfilter.org>; "Pascal Hambourg"
<pascal.mail@plouf.fr.eu.org>
Sent: Monday, April 23, 2007 11:11 AM
Subject: RE: Iptables rule on span traffic



-----Original Message-----
From: Martijn Lievaart [mailto:m@rtij.nl]
Sent: Sunday, April 22, 2007 10:25 PM
To: Krishnamoorthy (Siva) Sivakumar
Cc: Pascal Hambourg; netfilter@lists.netfilter.org
Subject: Re: Iptables rule on span traffic

Krishnamoorthy (Siva) Sivakumar wrote:
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pascal
> Hambourg
> Sent: Saturday, April 21, 2007 2:20 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Iptables rule on span traffic
>
> Hello,
>
> Krishnamoorthy (Siva) Sivakumar a =E9crit :
>
>> When I run this rule, and try to access a .txt file (with a web
>> browser on a different machine) on the machine running the iptables, =
I
>> get a log message and the file access is blocked. However, if I try =
to
>> do the same but for a .txt file residing on a third machine (machine
>> running iptables is able to see the related packets on its interface
>> connected to the span port), I see no log or blocking.
>>
>
> As C=E9dric said, packets which are not destined to the box do not go
> through the INPUT chains. And since the box is not forwarding traffic,
> these packets are dropped at the input routing decision stage and do =
not
> go through the FORWARD chains either.
>
> [Siva:]
> Then is it true that for iptables rules to be effective (fwsnort =
generated
> or otherwise), the machine must be "inline". Is there no way to =
implement
> iptables rules on "mirrored" traffic.
>
> Siva
>
>

You could try to turn on forwarding and block all traffic that makes it
through the snort rules.

HTH,
M4

[Siva:]
Can you explain in more detail (sorry I am a novice)? How do you turn on
forwarding? Does this require the iptables machine to be inline (in =
addition
to a regular firewall/router that does the actual forwarding)?

Thanks,
Siva








