From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: NAT and UDP
Date: Sun, 30 Mar 2003 12:33:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303301233.46424.netfilter@newkirk.us>
References: <000d01c2f55a$f4d13bd0$c00a7883@ad.nps.navy.mil>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c2f55a$f4d13bd0$c00a7883@ad.nps.navy.mil>
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
To: Jean Khosalim <jkhosali@nps.navy.mil>, netfilter@lists.netfilter.org
Cc: David Shifflett <shifflett@nps.navy.mil>

On Friday 28 March 2003 01:50 pm, Jean Khosalim wrote:
> We are trying to NAT some UDP traffic and can't get iptables
> configured correctly. We are using version 1.27 on familiar linux
> version 0.5.3

Interesting.  I assume this is embedded, not handheld, but won't ask for=20
details... :^)

> Here is our configuration:
> # iptables -t nat -L

the filter table is important here as well, at least the FORWARD chain. =20
It's also more helpful to list the actual commands creating the rules,=20
rather than the rule listing from iptables.

> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  anywhere             anywhere         =20
> to:192.168.0.31

I assume this rule also matches to a specific interface.  (that info is=20
not included when you list rules - one reason including actual script=20
snippets can be helpful)

> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> When a TFTP packet comes in on 192.168.1.1 it gets SNAT'd
> and sent out 192.168.0.31, but the reply is always dropped
> and an unreachable messages is sent out.

Have you applied the TFTP patch from Patch-O-Matic?  As with 'normal'=20
ftp, a special conntrack helper and NAT helper is available.  But unlike=20
FTP, they're not incuded in the normal distribution, but are available=20
as a patch to be applied to the source code.  You then rebuild the=20
kernel/modules.
http://netfilter.org/documentation/pomlist/pom-combined.html#tftp
is the info on it, and a link to a listing of the patch itself. (using=20
Patch-O-Matic itself is the correct way to apply it, however)  This=20
particular 'patch' is actually just two sourcecode files, for the =20
ip_conntrack_tftp, and ip_nat_tftp modules. =20

I've no idea the procedure for rebuilding a kernel/modules for Familiar,=20
I would presume you'd need to do it on an x86 machine with=20
cross-compiler.  (I'm awaiting a Zaurus 5600 right now, expected=20
delivery later this week - not running Familiar, but Embeddix/QTopia,=20
and I have Debian ready to install when it arrives)

> We have tried it with:
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> this configuration does the same thing.

No real surprise there - all MASQUERADE does is SNAT, but double-checks=20
the IP of the outbound interface each time.

> Does NAT work for UDP in general, and TFTP in particular?
> The man page has lots of UDP specific options
> do those only apply to filtering, and not NAT?

For UDP in general it works wonderfully.  For TFTP I've never tried it,=20
but with the conntrack and nat helpers it should be fine.  The=20
UDP-specific options I'm aware of are simply matching options, usable in=20
any table/chain to match the rule more precisely to specific traffic. =20
IE, with conntrack and nat helpers installed, and a rule for=20
ESTABLISHED,RELATED in the filter FORWARD chain (with a DROP policy),=20
you could narrow down the FORWARD rule to ACCEPT only "-p udp --dport=20
69", and the same for the SNAT rule, and the rest would be handled for=20
you.  Then (barring other ACCEPT rules in FORWARD) only TFTP would be=20
permitted through.  Port 69 being its initial connection, and any others=20
(data) being handled by the helpers as RELATED traffic.  Once you load=20
the conntrack and nat helpers, the data ports are RELATED in FORWARD,=20
and RELATED is automatically matched with its 'parent' connection in the=20
SNAT rule.

If you're trying to do this stateless, without conntrack, I don't think=20
you'll be successful SNATting a complex protocol like TFTP with your=20
apparent setup.  If only one client needs to connect with TFTP, you can=20
try SNATting its outbound connections, then DNATting any TFTP reply=20
traffic to that specific client.  I suspect this isn't the case, though.

> Thanks for any help.
> Jean Khosalim and David Shifflett

j


