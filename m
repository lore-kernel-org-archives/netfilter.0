From: "P.Italiaander" <pc-secure@home.nl>
Subject: Re: SuSEfirewall2 and NAT help : i am so lost!
Date: Fri, 16 May 2003 19:54:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305161954.18096.pc-secure@home.nl>
References: <20030515203925.GA48230@justpickone.org> <200305161449.29544.faide@alphacent.com> <20030516151617.GC53289@justpickone.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030516151617.GC53289@justpickone.org>
Content-Disposition: inline
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

>Op vrijdag 16 mei 2003 17:16, schreef David T-G:
> Florent, et al --
>
> ...and then Aide Florent said...
> %
> % Le Vendredi 16 Mai 2003 00:45, David T-G a =E9crit :
> % > Hi again, all --
> ...
> % > I've attached `iptables -L` so that you can see if anything looks
> wrong. %
> % you should try
> %
> % iptables -t nat -nvL
> %
> % if you want to see what is "NATed" by your machine.
>
> Ah.  Oops!  Now *that* is attached.
>
>
> %
> % Hope it helps.
>
> I don't really know what I'm reading, but I admit that it looks somewhat
> sparse.  I hope someone can tell me what pieces I'm missing!
>
>
> %
> % Florent AIDE
>
>
> Thanks again & HAND
>
> :-D


At first I thought somebody would notice ,but you have a hugh hole in your=
=20
firewall :
so you do:

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state=20
RELATED,ESTABLISHED
ACCEPT     udp  --  anywhere             255.255.255.255    udp spt:bootps=
=20
dpt:bootpc
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reque=
st
ACCEPT     udp  --  dns1.rcsntx.sbcglobal.net  anywhere           state NEW=
=20
udp spt:domain dpts:1024:65535
ACCEPT     udp  --  dns1.snfcca.sbcglobal.net  anywhere           state NEW=
=20
udp spt:domain dpts:1024:65535
LOG        tcp  --  anywhere             anywhere           tcp=20
flags:SYN,RST,ACK/SYN LOG level warning tcp-options ip-options prefix=20
`SuSE-FW-DROP-NEW-CONNECT '
ACCEPT     udp  --  anywhere             anywhere           state ESTABLISH=
ED=20
udp dpts:61000:65095
input_ext  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Iptables behaviour is , the first match counts !!
so if you set the first rule  INPUT chain : ACCEPT all -- anywhere   anywhe=
re=20
it means that all traffic both ways may pass.This behaviour is not acceptab=
le.
Actualy ALL the other rules 2,3,4 enz. of the INPUT chain are not matched.
You could be more filtering by interface.
=20
Then the FORWARD chain:=20

Chain FORWARD (policy DROP)
target     prot opt source               destination
TCPMSS     tcp  --  anywhere             anywhere           tcp=20
flags:SYN,RST/SYN TCPMSS clamp to PMTU
reject_func  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

it seems you have an ppp adapter , but only a clamp to PMTU is not enough t=
o=20
get it working.it only corrects the PMTU value .
Your Policy says DROP , but your reject_func , rejects furder traffic , so =
the=20
ACCEPT   all -- anywhere   anywhere is not matched , you override your own=
=20
POLICY  if it did.=20

So you have to make a rule with an state NEW , before the reject_func, and =
let=20
everything pass from=20
intern network to WWW .

example:     =20
iptables -A FORWARD -m state --state NEW -i $int_if -o $ext_if -j ACCEPT

Now the firewall knows how to forward between interfaces.

this should do the job , let us know !!

Pascal



