From: "Stanislav Puffler DiS." <stanislav.puffler@seznam.cz>
Subject: RE: ping to internet hosta through NameServer of provider
Date: Tue, 9 Mar 2004 14:00:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B0gpe-0004V7-9P@vishnu.netfilter.org>
References: <200403091040.28256.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403091040.28256.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

It seems like anything you=B4ve described. Here is the ruleset :

iptables -L -nv

Chain INPUT (policy ACCEPT 66 packets, 2754 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
 1332  179K RH-Lokkit-0-50-INPUT  all  --  *      *       0.0.0.0/0
0.0.0.0/0         =20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 85 packets, 5151 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain RH-Lokkit-0-50-INPUT (1 references)
 pkts bytes target     prot opt in     out     source
destination        =20
    0     0 ACCEPT     udp  --  *      *       80.95.96.7
0.0.0.0/0          udp spt:53 dpts:1025:65535=20
   10   700 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0         =20
    0     0 ACCEPT     udp  --  *      *       192.168.0.11
0.0.0.0/0          udp spt:53=20
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp flags:0x16/0x02 reject-with icmp-port-unreachable =

 1256  175K REJECT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp reject-with icmp-port-unreachable

iptables -L -t nat -nv

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

As for tutorials - I have read some czech one, I=B4ll read those from
netfilter.org too of course... Thanks in advance,
Stanley.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Tuesday, March 09, 2004 11:40 AM
To: netfilter@lists.netfilter.org
Subject: Re: ping to internet hosts through NameServer of provider

On Tuesday 09 March 2004 9:29 am, Stanislav Puffler DiS. wrote:

> Hi all,
> i=B4m newbie to fw, have just installed iptables and configured. Have =
3
> interfaces, eth0 - internet, eth1 - DMZ (squid, postfix), eth2 - LAN. =
My
> provider has connected my firewall to the Internet via 1 public IP (on
> eth0). Internet hosts are resolved via provider=B4s Name Server (this =
IP
> is in /etc/resolv.conf). If I tried ping to (for example) www.rb.cz
> before installing iptables, there was no problem. Now, after =
installing
> iptables, I can=B4t ping to internet hosts correctly (only on IP - it =
is
> without need of contacting providers NS) - it is working like this :
>
> [user@machine]$ ping www.rb.cz
> IN=3Deth0 OUT=3D MAC=3D.............. =
SRC=3D"my_providers_nameserver_ip"
> DST=3D"ip_on_my_eth0" LEN=3D127 TOS=3D0x00 PREC=3D0x00 TTL=3D61 =
ID=3D3268 DF
> PROTO=3DUDP SPT=3D53 DPT=3D32792 LEN=3D107

So you have a LOGging rule (presumably some time before a DROP rule - =
not
many=20
people LOG ACCEPTed packets), which shows that you are blocking DNS =
replies=20
from your ISP.   Hence you cannot resolve IP addresses.

> Ping to resolved IP of www.rb.cz is no problem (ping 193.86.103.40 -
> returns a normal replay). Could anyone help me please how to set up
> carefully and secure rule to maintain this problem - to permit my
> provider=B4s NS to resolv internet hosts ?

Please tell us your ruleset (either the iptables commands you use to set =
up=20
the rules, or the output of "iptables -L -nv; iptables -L -t nat -nv") =
and
we=20
can suggest what might be wrong.

If you are new to networking as well as netfilter, please read one of =
the=20
excellent tutorials accessible from http://www.netfilter.org and this =
will=20
help you get a basic setup working.   I can recommend Oskar Andreasson's =

tutorial at http://iptables-tutorial.frozentux.net

Regards,

Antony.

--=20
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




