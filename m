From: "IZEM Farid" <Farid.IZEM@abxlogistics.fr>
Subject: RE: (no subject)
Date: Thu, 1 Jul 2004 18:45:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B732FD42D68974438C1451C73C1D030FD1EFEB@FR92EX02.eu.abxlogistics.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Thanks Anthony for you help,

Don't worry about the rule in my firewall, in each one,
Source and destination are checked both in FORWARD and PREROUTING chain.
Everything is clear for me and I will terminate the customisation=20
Of my firewall next week because I'm in my holidays for three days.

Thanks for all,

Best regards,

Farid IZEM
Ing=E9nieur Syst=E8me Unix
Soci=E9t=E9 ABX Logistics France
48-50, route principale du port
92232 Gennevilliers
T=E9l. : 01-41-47-61-78
Email : farid.izem@abxlogistics.fr


> Anthony,
>
> Ok, I understand what you explain and I will test as soon as possible.
> I always setup netfilter by adding rules to INPUT, OUTPUT, DNAT, .. =
chain.
> But in this way, netfilter is very difficult to maintain.
> In fact, my firewall has 2 networks interfaces and it's doing SNAT and
> DNAT. SNAT and DNAT is properly working but difficult to administrate.
> As it is already in production environnement, I have to plan when =
modificat
>
> In your opinion, which solution is better:
>
> 	Create DNAT rules like
> 		Iptables -A PREROUTING -d 192.19.93.100 -j DNAT
> 				--to-destination 92.92.1.100
> 		Iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 172.19.92.100
> 				-d 92.92.1.100 --dport 23 -j ACCEPT
>
> 	Or
> 		Iptables -A PREROUTING -s 172.19.92.100 -d 192.19.93.100
> 				--dport 23 - j DNAT --to-destination 92.92.1.100:23

You have omitted to list the FORWARDing rule which is needed with the =
second=20
example of the PREROUTING rule:

iptables -A FORWARD -i eth0 -o eth1 -d 92.92.1.100 -j ACCEPT

(Following the style you have outlined with the differences between the =
two=20
PREROUTING rules).

In other words, you always need a PREROUTING rule, and a FORWARD rule, =
for=20
packets to get through the firewall and reach the intended machine.

As for my opinion as to which is better - I prefer the one which is =
easier=20
(for you) to understand.   Firewall maintenance is more important in =
almost=20
all cases than ultimate efficiency of a ruleset, achieved by shaving a =
test=20
here and there off the rules in case it takes up another CPU cycle or =
two.

In general that means I favour fully explicit rules - both for clarity =
and=20
security.   If you only intend to allow packets to TCP, port 23 =
(although I=20
cannot imagine why you want to allow anything at all to that particular=20
port....) and you want those packets to be allowed only from a specific =
IP=20
address, going through the firewall in one particular direction, then =
make=20
this clear in both the rules which are needed:

iptables -A PREROUTING -t nat -p tcp --dport 23 -i eth0 -s 172.19.92.100 =
-d=20
192.19.93.100 -j DNAT --to 92.92.1.100
iptables -A FORWARD -p tcp --dport 23 -i eth0 -o eth1 -s 172.19.92.100 =
-d=20
92.92.1.100 -j ACCEPT

If you find the duplication of information less clear, then simply it so =
that=20
you are happy with the rules (and they still provide the security you=20
require).   So long as you don't completely omit the source address (for =

example), so that packets get accepted from anywhere, then you should =
use the=20
rules you will find easiest to understand in three months' time....

Regards,

Antony.

--=20
"Reports that say that something hasn't happened are always interesting =
to me,=20
because as we know, there are known knowns; there are things we know we =
know.=20
We also know there are known unknowns; that is to say we know there are =
some=20
things we do not know. But there are also unknown unknowns - the ones we =

don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the =
list;
                                                           please don't =
CC me.




