From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Accessing machine with public ip address.
Date: Tue, 24 Dec 2002 21:32:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212242132.01220.netfilter@newkirk.us>
References: <Pine.SOL.4.43.0212231312460.4174-100000@selene.nat.vu.nl> <01c001c2aa8e$486bd6a0$13fcc5cb@Housecall> <00ee01c2aa94$ef846c30$8c01a8c0@sundaram>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ee01c2aa94$ef846c30$8c01a8c0@sundaram>
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
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

On Monday 23 December 2002 10:06 am, Sundaram Ramasamy wrote:
{ liberally snipped }
> Here is my iptables rules

> EXT=3D"eth0"
> INT=3D"eth1"
> INT2=3D"eth2"

> $IPT -A FORWARD -i $INT -j ACCEPT
> $IPT -A FORWARD -o $INT -j ACCEPT

> $IPT -A FORWARD -i $INT2 -j ACCEPT
> $IPT -A FORWARD -o $INT2 -j ACCEPT

> $IPT -t nat -A POSTROUTING -o $EXT -j MASQUERADE
>
> $IPT -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -A FORWARD -i $EXT -m state --state NEW -j ACCEPT

> $IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
> DNAT --to $INT_IP1
> $IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT
> $IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1

> I have forwarded 216.205.140.8 to 192.168.1.130. I am accessing web
> page from 192.168.1.140 machine.

> > > I have NATed public 216.205.140.8 IP Address into local
> > > 192.168.1.130 Network address, from my LAN I was not able to
> > > access my machine using public IP Address.

Several problems here.  The source of your specific stated problem is=20
that you are not DNATting the packets.  You specify "-i $EXT" for your=20
prerouting DNAT, and requests from the LAN will NOT appear as input from=20
that interface, but from $INT or $INT2.  Remove the "-i $EXT" and it=20
will DNAT all packets going to $EXT_IP1 port 80, whether from the=20
internet or from the LAN.

If the clients are on the same subnet as the server at 192.168.1.130 (or=20
if the server has any valid route back to the LAN clients that does NOT=20
pass back through the firewall box) then you also need to SNAT packets=20
from LAN clients in POSTROUTING that go to the server, changing their=20
source IP to the IP of the interface they go out on to reach the server. =
=20
This way the server will always return traffic back through the firewall=20
to be unDNATted, and the client will recognize the response to its=20
request.  Something like:

$IPT -t nat -A POSTROUTING -d $INT_IP1 -j SNAT --to $192.168.1.x
using the firewall box's IP for the interface that it reaches=20
192.168.1.130 through.  To avoid the extra overhead of SNATting all=20
traffic from the internet as well, which isn't necessary, you can use=20
this rule twice, with "-i $INT" and "-i $INT2", or specifying source IPs=20
as a subnet matching all local client IPs.  (like "-s 192.168.1.0/24"=20
perhaps)

Forwarding needs an overhaul here.  First you accept anything coming in=20
$INT.  A little loose perhaps, but ok, as long as the LAN can be=20
trusted...  Then you accept anything directed out $INT.  Quite a bit=20
looser, and could be considered a problem.  Then you do the same two=20
things for $INT2.  Together these four rules accept absolutely=20
everything EXCEPT forwarding packets from $EXT (internet) right back to=20
$EXT.  Then you go on to accept ESTABLISHED & RELATED inbound at $EXT,=20
which is fine, but follow it up with accepting all NEW packets there as=20
well.  At this point the ONLY packets left that have not already been=20
accepted would be ones with state INVALID.  Your dport 80 ACCEPT rule=20
further down will never match, unless the packet is INVALID, meaning=20
either it is unidentifiable, or it's state cannot be determined.

I would NOT recommend using this ruleset in an environment where you want=
=20
a secure firewall.  Basically all this ruleset does is handle=20
forwarding.  The only thing that saves you from harm is probably the=20
fact that (at least as shown here) the only services you actually DNAT=20
are dport 80 requests targeting EXT_IP1.  This is essentially the only=20
filtering actually done, and you aren't doing it in the filter table,=20
but rather in the nat table's PREROUTING chain.  That is the purpose of=20
the filter table.  (INPUT, OUTPUT, and FORWARD chains)

You would probably be much better served if you remove both the -o=20
forward rules, remove the "-i $EXT" from the EST/REL forward rule, and=20
replace the -i $EXT state NEW rule with explicit rules for what dports=20
you wish to allow the unwashed masses on the internet to actually=20
access.  (basically --dport 80 in this case, it seems)  To get things a=20
little tighter, remove the FORWARD rules for input from the two local=20
interfaces, and replace them with specific destport rules as well. =20
There's no reason to make things easy for viruses, spyware, phone-homes,=20
and other usually quite undesirable communications 'clients'.

Finally, it appears that you have a static IP address for $EXT_IP1,=20
correct?  If so, you are incurring quite a bit of overhead by using=20
MASQUERADE, which won't even work without=20
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
to enable tracking of the dynamic IP of the interface MASQ is being=20
applied to.  You should probably be using this instead:
$IPT -t nat -A POSTROUTING -o $EXT -j SNAT --to $EXT_IP1

A very useful 'tool' for following this kind of thing is:
"cat /etc/init.d/firewall | grep FORWARD"
or whatever the path and filename are for your firewall script, and check=
=20
each chain.  Then you can examine the sequence of rules, and determine=20
what will be accepted at each stage.  Organizing the rules in groups the=20
way you have makes them more readable, perhaps, but can make it harder=20
(especially if you have 100+ rules, or even more than one screenful) to=20
really follow the overall effects. =20

It might be more useful if you define all your substitions at the very=20
start, then list the rules for each chain start to finish before the=20
rules for the next chain.  The variable names you use will still make it=20
clear what rules are related to which interface. (I'd suggest INT1=20
instead of INT, and HTTP_SVR or some such instead of INT1_IP, to make=20
them more meaningful)  The 'tool' suggested above can be invoked with=20
"grep INT2" for example, for the (probably rare) occasions when you=20
really need to see everything relating to that interface in an unbroken=20
group.

j


