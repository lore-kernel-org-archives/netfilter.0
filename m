From: John Joseph <jjk_saji@yahoo.com>
Subject: RE: IPTABLES , help requested ,
	have problem in forwarding port 110 to 8110
Date: Sat, 29 Jul 2006 12:21:06 +0100 (BST)
Message-ID: <20060729112106.53683.qmail@web55511.mail.re4.yahoo.com>
References: <20060729060906.82661.qmail@web55508.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060729060906.82661.qmail@web55508.mail.re4.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org


--- John Joseph <jjk_saji@yahoo.com> wrote:

>=20
> --- Sietse van Zanen <sietse@wizdom.nu> wrote:
>=20
> > >> ACCEPT     all  --  anywhere           =20
> anywhere
> > >> This converts your DROP policy to an ACCEPT,
> > doesn't seem wise.
> >=20
> > >Remember that iptables -L hides some rule
> > parameters such as interfaces.
> > >I would not be surprised that this rule actually
> > contains "-i eth1".
> > >I strongly suggest John and anyone lists iptables
> > rules with>
> > >iptables-save instead of iptables -L.
> >=20
> > Or iptables -L -n -v would do fine too, I think.
> >=20
> >=20
> >=20
>=20
>=20
>=20
> Hi Thanks for the reply=20
>     in my gateway  =93iptables -L -n -v  =93 . results
> are
>               =20
>=20
> **************************
> [root@gateway ~]# iptables -L -n -v
> Chain INPUT (policy ACCEPT 256K packets, 29M bytes)
>  pkts bytes target     prot opt in     out   =20
> source=20
>              destination
>=20
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out   =20
> source=20
>              destination
>     8   472 ACCEPT     all  --  eth0   eth1  =20
> 0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
>    17   840 ACCEPT     all  --  eth1   eth0  =20
> 0.0.0.0/0            0.0.0.0/0
>     3   180 LOG        all  --  *      *     =20
> 0.0.0.0/0            0.0.0.0/0           LOG flags 0
> level 4
>     3   180 ACCEPT     tcp  --  eth0   *     =20
> 0.0.0.0/0            192.168.242.129     tcp
> dpt:8110
>=20
> Chain OUTPUT (policy ACCEPT 2885 packets, 430K
> bytes)
>  pkts bytes target     prot opt in     out   =20
> source=20
>              destination
>=20
> *******************************
>=20
>=20
> I am posting , some part of the previous mail , for
> continuity=20
>    I have a gateway (CentOS) with eth0 and eth1 as
> interfaces. =93eth0=94  is exposed to WAN and  =93eth1=94 to
> the LAN  network , I want all POP3 packets coming=20
> in
> through the gateway  wan interface (eth0) to be
> redirected  to the PS1(192.168.242.129 inside the
> lan)
> port 8110 .  I had done some iptables settings as =20
>=20
> iptables -t nat -A PREROUTING -i eth0 -p tcp =96dport
> pop3 -j DNAT =96to  192.168.242.129:8110
> iptables        -A FORWARD -i eth0 -p tcp --dport
> 8110
> -d 192.168.242.129 -j ACCEPT
>=20
>   In this setup POP3  packets were not redirected to
> PS1 (192.168.242.129)=20
>                      Thanks=20
>                          Joseph John=20
>=20
>=20


Hi=20
  In response to my previous mail ,   I am posting my
iptables-script which I had used , so that going
through the code can give me good response from the
list=20
**************   =20
#!/bin/sh
#
#  Unless specified, the defaults for INPUT and OUTPUT
is ACCEPT
#    The default for FORWARD is DROP (REJECT is not a
valid policy)
#   Isn't ACCEPT insecure?  To some degree, YES, but
this is our testing
#   phase.
#

echo "   Clearing any existing rules and setting
default policy.."
iptables -P INPUT ACCEPT
iptables -F INPUT
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -t nat -F

echo "   FWD: Allow all connections IN"
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -j LOG

echo "   Enabling SNAT (MASQUERADE) functionality on
$eth0"
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "Forwarding all the port 110 to
192.168.242.129:8110"

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport
110 -j DNAT --to 192.168.242.129:8110

iptables        -A FORWARD -i eth0 -p tcp --dport 8110
-d 192.168.242.129 -j ACCEPT
************************************
                Thanks=20
                    Joseph John=20



=09
=09
	=09
___________________________________________________________=20
All new Yahoo! Mail "The new Interface is stunning in its simplicity and ea=
se of use." - PC Magazine=20
http://uk.docs.yahoo.com/nowyoucan.html

