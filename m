From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Newbie request
Date: Tue, 12 Dec 2006 09:31:58 +0100 (CET)
Message-ID: <1153.193.173.119.247.1165912318.squirrel@webmail.sterenborg.info>
References: <457E5B99.7050005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457E5B99.7050005@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, December 12, 2006 08:34, Nandan Bhat wrote:
> Hi,
>
>
> I am trying to setup an old machine having two NICs with Fedora Core 5.
> I have two Class C networks (I hope I got that right).
> eth0 is assigned 192.168.1.6/255.255.255.0 . eth1 is set to DHCP and is=
 part of
> 192.168.0.0/24 .
>
>
> I need some machines on 192.168.1.0/24 network to be able to get/send
> mail using 192.168.0.10 . Mail is limited to these networks and does no=
t go to
> the outside world.
>
> I have gone through the Linux-IP-Masquerade HOWTO and feel that I don't
> need a very liberal ruleset. Only smtp,pop functionality, especially co=
nnecting
> with 192.168.0.10 is sufficient.
>
> My question is: Do I need a SNAT rule or should I try something with
> nat+FORWARD? I just went through iptables manual and am somewhat able t=
o
> understand the rules in the HOWTO - stronger firewall example.

No. You can just route from 192.168.0.0/24 to 192.168.1.0/24 and back wit=
hout
using NAT.
You can filter packets you don't want to be routed.

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -s 192.168.0.0/24 \
  -d 192.168.1.0/24 -m mport -p tcp --dports 25,110 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -s 192.168.1.0/24 \
  -d 192.168.0.0/24 -m mport -p tcp --dports 25,110 -j ACCEPT

The last 2 rules can also be split into 4 rules if you don't have the mpo=
rt
module :

$ipt -A FORWARD -m state --state NEW -s 192.168.0.0/24 \
  -d 192.168.1.0/24 -p tcp --dport 25 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -s 192.168.0.0/24 \
  -d 192.168.1.0/24 -p tcp --dport 110 -j ACCEPT

$ipt -A FORWARD -m state --state NEW -s 192.168.1.0/24 \
  -d 192.168.0.0/24 -p tcp --dport 25 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -s 192.168.1.0/24 \
  -d 192.168.0.0/24 -p tcp --dport 110 -j ACCEPT

Don't forget to:
echo 1 > /proc/sys/net/ipv4/ip_forward


Grts,
Rob



