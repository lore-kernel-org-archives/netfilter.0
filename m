From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: allowing traffic through an iptables ruleset to a machine on a 
 VM
Date: Thu, 24 Aug 2006 11:02:46 +0200 (CEST)
Message-ID: <49311.193.173.147.3.1156410166.squirrel@webmail.sterenborg.info>
References: <44ED4E82.5050800@vivitec.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44ED4E82.5050800@vivitec.com.au>
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

On Thu, August 24, 2006 09:00, Carl Brewer wrote:
>

> Hello,
> I'm used to IPFilter, not much experience with iptables, so please
> bear with me.
>
> I have a Redhat ES server, (RHES 4), and it has a VM on it with a host =
on
> the VM.  I need to allow traffic to & from the VM host with no restrict=
ions,
> but filter traffic to the main host. The VM is running cPanel (yeah ...=
 I
> know ...) on RHES 4, and it can look after itself, but I need to protec=
t the
> main host.
>
> It's complicated a little by needing to do some NAT to
> get the VM host to be able to see the outside world.
>
> The iptables ruleset is below (this is just a modified RH default
> ruleset).  I don't really understand enough about how IPtables does its=
 naming
> of things to really get what the RH-Firewall-1-INPUT thing means.

This is typical RH. The policy of the INPUT chain is set to ACCEPT, so
basically, when something is not explicitly dropped or rejected, everythi=
ng is
accepted.

The first (and only) rule in the INPUT chain says:
-A INPUT -j RH-Firewall-1-INPUT

So, it does no matching of any kind and just passes everything to the use=
r
defined chain RH-Firewall-1-INPUT, which does the actual matching.

> Is there some way I can tell it to "just let everything to and from
> [ip.address] through" ?

$ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A INPUT -m state --state NEW -s <source_ip> -j ACCEPT

> On IPF I know how to do it, but all the netfilter howto's I've found
> deal with either just very simple case of IPTables looking after the ho=
st it's
> on, or seem overly complex what I'm trying to do.

Did you take a look at Oskar Andreason's IPTables Tutorial?
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

> My ruleset below doesn't seem to let DNS zone transfers, FTP
> etc out from the VM box, which we need to be able to do so it can manag=
e
> itself.
>
>
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :RH-Firewall-1-INPUT - [0:0]
> -A INPUT -j RH-Firewall-1-INPUT
> -A FORWARD -j RH-Firewall-1-INPUT

Hmm. See below.

> -A RH-Firewall-1-INPUT -i lo -j ACCEPT
> # I don't think we trust everying inbound on eth0 eh? :)
> #-A RH-Firewall-1-INPUT -i eth0 -j ACCEPT
> -A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
> -A RH-Firewall-1-INPUT -p 50 -j ACCEPT
> -A RH-Firewall-1-INPUT -p 51 -j ACCEPT
> -A RH-Firewall-1-INPUT -p 53 -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 10080
> -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 9080
> -j ACCEPT
> # Tor (private internet access for David)
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 9001
> -j ACCEPT
> # ice cPanel
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2083
> -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2087
> -j ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2089
> -j LOG
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2089
> -j ACCEPT
> # ssh etc ...
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j
> ACCEPT
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 110 -=
j
> ACCEPT
> # this only lets passive FTP through
> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j
> ACCEPT
>
>
> # DNS from vmnet8 VM host
> -A RH-Firewall-1-INPUT -m state --state NEW  -s 72.3.205.160/32 -m udp
> -p udp --dport 53 -j ACCEPT

So here you accept port 53/udp. This should allow dns queries.

> -A RH-Firewall-1-INPUT -j LOG
> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
> COMMIT
>
>
> the routing table on the main server :
>
> /sbin/ip route
> 72.3.205.160 via 192.168.239.2 dev vmnet1
> 72.3.230.0/26 dev eth0  proto kernel  scope link  src 72.3.230.30
> 192.168.0.0/24 dev vmnet8  proto kernel  scope link  src 192.168.0.1
> 192.168.239.0/24 dev vmnet1  proto kernel  scope link  src 192.168.239.=
1
> 10.241.0.0/19 dev eth1  proto kernel  scope link  src 10.241.6.177
> 169.254.0.0/16 dev eth1  scope link
> 10.251.0.0/16 via 10.241.0.1 dev eth1
> default via 72.3.230.1 dev eth0
>
> I have conntrack enabled :
> in /etc/sysconfig/iptables-config :
>
> IPTABLES_MODULES=3D"ip_conntrack_ftp"
>
>
> And we can FTP into the main server accordingly.
>
>
> The logs show traffic like this :
>
>
> Aug 24 16:55:36 blah kernel: IN=3Deth0 OUT=3Dvmnet1 SRC=3D203.89.199.15=
5
> DST=3D72.3.205.160 LEN=3D63 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D14154 =
DF PROTO=3DUDP
> SPT=3D41932 DPT=3D53 LEN=3D43
>
>
> Where 72.3.205.160 is the external IP address of the VM host that
> we're mapping to its RFC1918 address.  I think the above means it was d=
ropped?

The only rule I see that has a LOG target is:
-A RH-Firewall-1-INPUT -j LOG
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited COMMI=
T
So this packet would have been rejected, but not dropped (use -j DROP for=
 that).

> Thanks for any suggestions!  It's kinda urgent, I need to
> get it going pronto, but the only way I've been able to get the VM box =
to be
> able to connect out is if I've disabled the REJECT rule (suboptimal, yo=
u might
> say!)

Yes, because then everything is accepted according to this ruleset (there=
's
only 1 REJECT rule, no DROP, and it's at the end of your ruleset).

You say that currently you are using NAT to have network connectivity on =
the
VM.  When using NAT, packets travel the FORWARD chain, *NOT* (never) the =
INPUT
chain, so any rules should be put there.

The INPUT and FORWARD chain are both linked to RH-Firewall-1-INPUT so the=
y
share the same rules. When something is logged, you won't know whether it=
 came
from the INPUT or FORWARD chain.
I think you'd better have separate rules for each chain, not combining th=
em
into 1 user defined chain. You could put all rules you need right into th=
e
INPUT or FORWARD chain, or create a separate RH-Firewall-1-FORWARD and li=
nk
the FORWARD chain to that one.
Also, modify the LOG rule in each chain so it tells you what chain is log=
ging.
It would look something like this:
... -j LOG --log-prefix "<some_text_here>"

What VM software are you using and how is networking for the VM's configu=
red?
When using VMware, I thought you'd be able to configure it in such way th=
at
you don't need NAT.

> I need a rule that will let DNS queries and zone transfers in and out o=
f the
> VM, but am stumped as to how to do it.  The box is far away (different
> country!) and I can't just fiddle with it for risk of locking myself ou=
t, so
> I seek the advice of the list.

See above. If this about allowing DNS queries and zone transfers, allow b=
oth
ports 53/udp and 53/tcp.

-A RH-Firewall-1-INPUT -m state --state NEW  -s 72.3.205.160/32 -m tcp
-p tcp --dport 53 -j ACCEPT

Hope this helps.


Gr,
Rob



