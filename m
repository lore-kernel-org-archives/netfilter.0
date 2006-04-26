From: Philip Westphal <philip@trans.net>
Subject: FORWARD-chain packets go through INPUT-chain ?
Date: Wed, 26 Apr 2006 10:43:15 +0200
Message-ID: <444F32A3.7050900@trans.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everybody,

i think my problem is quit simple, but i=C2=B4m a little bit under pressu=
re, and google didn=C2=B4t help.
i have a firewall machine, with ip6tables running on it, and behind this =
firewall there is a webserver with apache2 running.
the network looks like this:
_________________________________________________________________________=
_____________________
|                                   LAPTOP                               =
                    |
|   ipv6-addr: 2001:4100:1:1:204:dff:fe2b:4f1e/64 gw: 2001:4100:1:1:207:8=
dff:fef0:a900/64    |
-------------------------------------------------------------------------=
---------------------
                                       |     |
                                       |     |
                                       |     |
______________________________________|_____|____________________________=
___
|      fasteth0/0 ipv6-addr: 2001:4100:1:1:207:8dff:fef0:a900/64         =
   |
|                           CISCO                                        =
   |
|      fasteth1/0 ipv6-addr: 2001:4200:2:1:231:b5ff:fe67:8900/64         =
   |
-------------------------------------------------------------------------=
---
                                       |     |
                                       |     |
                                       |     |
______________________________________|_____|____________________________=
________________________
|      eth0 ipv6-addr: 2001:4200:2:1:20b:4eff:fe5e:c69d/64 gw: 2001:4200:=
2:1:231:b5ff:fe67:8900 |
|                                   FIREWALL                             =
                       |
|      eth1 ipv6-addr: 2001:4200:3:1:203:75ff:fee8:3275/64 + route 2001:4=
200:3:1::/48 -> eth1   |
-------------------------------------------------------------------------=
------------------------
                                       |     |
                                       |     |
                                       |     |
______________________________________|_____|____________________________=
_______________________
|    eth0 ipv6-addr: 2001:4200:3:1:204:b4ff:fec7:faa4/64  gw: 2001:4200:3=
:1:203:75ff:fee8:3275 |
|                                     APACHE                             =
                      |
-------------------------------------------------------------------------=
-----------------------

routing is fine, without ip6tables everything works.
my problem is, that packets from the LAPTOP to the APACHE (and vice-versa=
) go through all 3 chains INPUT, OUTPUT and FORWARD.
if i don=C2=B4t make any rules, i have to set all 3 chains to ACCEPT to g=
et packets through.
if i have INPUT and OUTPUT on drop (FORWARD is all the time on ACCEPT), i=
 need to allow especially packets to or from
port 80 or icmpv6 on the INPUT and OUTPUT chain. when i set one of these =
both chains to DROP, without any special rule,
nothing works, not the http-request or even the icmpv6. i thought all the=
 time that the INPUT and OUTPUT chains are just for packets
which are for or from the local machine. could it be that the firewall th=
reats packets like this, because the APACHE is in the same net
on a connected interface?
when i allow packets to the APACHE in the INPUT chain (lets assume the fi=
rewall routes packets through this chain because itself is in the same ne=
t)
(default policy is drop) and set the OUTPUT and FORWARD chains to ACCEPT,=
 it still doesn=C2=B4t work.

as i understand the http://netfilter.org/documentation/HOWTO/de/packet-fi=
ltering-HOWTO-6.html normaly packets,
which are not destinated to the machine itself just go through the FORWAR=
D-chain. it=C2=B4s also under point #3 in this howto:

If forwarding is enabled, and the packet is destined for another network =
interface (if you have another one),
then the packet goes rightwards on our diagram to the FORWARD chain. If i=
t is ACCEPTed, it will be sent out.

If you have ANY questions about the net, or the routingtables on special =
machines, please ask.
I don=C2=B4t get it, any idea, HOWTO-link, explanation, or solution *g* w=
ould be very nice. i=C2=B4m willing to RTFM, but i don=C2=B4t know where =
this man is.

Thanks in advance. Philip
















