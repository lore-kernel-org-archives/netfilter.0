From: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Subject: RE: DNAT problem /  question
Date: Mon, 21 Jun 2004 00:24:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <519AD2BA94FC6E4DB5DE078B2E37CB10A76C99@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

thx already for the hints, but I am still in a strugle. I changed my
destination ip to 207, because 220 could cause problems. Forgive me that
I don't understand why.=20
Anyway, these rules give even a more confusing result.
I am still not able to access my 11.0.0.16 box through the
172.25.239.207 DNAT'ed alias. (not pingable, not nothing)
I also can not connect anymore to my netfilter box anymore after
executing this script, BUT my active ssh connection stays open ! ? I am
still on my machine remotly, but I can not ping it anymore ?? :(

Any more ideas ?

------------------------------------------------------------

echo "Activating firewall script generated Thu Jun 10 15:03:22 2004 CEST
by root"

$IPTABLES -t nat -A PREROUTING -d 172.25.239.207/27 -j DNAT
--to-destination 11.0.0.16

$IPTABLES -A INPUT   -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -N RULE_0
$IPTABLES -A OUTPUT -d 11.0.0.16  -m state --state NEW  -j RULE_0
$IPTABLES -A FORWARD -d 11.0.0.16  -m state --state NEW  -j RULE_0
$IPTABLES -A RULE_0  -j LOG  --log-level info --log-prefix "RULE 0 --
ACCEPT "
$IPTABLES -A RULE_0  -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward=20

execution of this script gives me this : (why is there 192 ? in stead of
207 ?)

[root@linuxrouter root]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
DNAT       all  --  anywhere             172.25.239.192/27  to:11.0.0.16


Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20
[root@linuxrouter root]#=20



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Friday, June 18, 2004 6:15 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT problem / question

On Friday 18 June 2004 5:06 pm, Patrick Leslie Polzer wrote:

> On Fri, 18 Jun 2004 17:45:20 +0200
>
> "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com> wrote:
> > Could you please check my config, if I execute this I can not ping=20
> > my internal lan ip of this host 172.25.239.208 any more. I think=20
> > this is really wierd.
>
> Why? These lines:
> > $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/27 -j DNAT=20
> > --to-destination 11.0.0.16 $IPTABLES -t nat -A OUTPUT -d
> > 172.25.239.220/27 -j DNAT --to-destination 11.0.0.16
>
> are doing everything to keep ALL packets away from you ;) All outgoing

> packets (statement 2) are redirected to 11.0.0.16 and all incoming are

> as well (statement 1)!
> How do you expect ping to work with that? :-O

Good point, but surely a ping packet sent to 172.25.239.220 (let's
overlook the netmask for the time being...) would get redirected to
11.0.0.16, and provided that machine responds to the ping (and the reply
goes back through netfilter's NAT table) the origianting client might
see the reply?

However, I am certainly highly confused by what Bert is trying achieve
here - perhaps the answers to a few questions would help:

1. How many interfaces does the netfilter machine have?   What are their
IP=20
addresses?

2. Where is machine 11.0.0.16?   How are packets routed to that frm the=20
netfiler machine?

3. What address are you sending the ping packets from (and to)?   How is
that=20
client routed to the netfilter box?

4. What, in simple terms, are you trying to achieve with the two rules
which Patrick has queried above?

Regards,

Antony.

--
"It would appear we have reached the limits of what it is possible to
achieve with computer technology, although one should be careful with
such statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the
list;
                                                           please don't
CC me.





