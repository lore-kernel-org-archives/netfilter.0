From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: can't initialize iptables table `'
Date: Wed, 27 Nov 2002 15:09:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211271509.36759.netfilter@newkirk.us>
References: <6FB083FB72EFD21181D30004AC4CA18A01EABFB1@srv002>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6FB083FB72EFD21181D30004AC4CA18A01EABFB1@srv002>
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
To: Sam Pointer <sam.pointer@hpdsoftware.com>
Cc: netfilter@lists.netfilter.org

On Wednesday 27 November 2002 10:43 am, Sam Pointer wrote:
> yes, I'm using "iptables start" from /etc/rc.d/init.d/ directories.
>
> The contents of the /etc/sysconfig/iptables at the moment is just :
>
> -P INPUT DROP
>
> !!! which is why I can't understand why I'm having problems. I did have
> some more comprehensive rules in there ported from an old ipchains setu=
p,
> but whittled it down to that to diagnose this problem.
>
> With regards kernelness, to quote myself from my earlier post:
> > > Now, I issued `lsmod` and I have both "iptable_filter" and "ip_tabl=
es"
> > > modules loaded.
>
> ..and that's it, no other modules loaded; which is what I expect as I'm=
 not
> using the `nat', `masq' or other tables.
>
> I'll let you know on the iptables-save shortly.

I've a few suggestions.

First, with lsmod make sure not only that iptable_filter and ip_tables ar=
e=20
loaded, make sure ipchains ISN'T loaded.

Second, once that is confirmed, try some simple manual commands. (as root=
)
/sbin/iptables -P INPUT DROP
/sbin/iptables -A INPUT -s 10.11.12.13 -j DROP
/sbin/iptables -L INPUT -v -n
should change filter-INPUT policy to DROP, add a rule with a 'random' IP =
that=20
will also drop (effectively useless) then list the current rules for the=20
INPUT chain in the filter table.
If it gives no errors and produces something like:

Chain INPUT (policy DROP 8 packets, 444 bytes)
 pkts bytes target     prot opt in     out     source              destin=
ation
    0     0 DROP       all  --  *      *       10.11.12.13          0.0.0=
=2E0/0

then iptables/netfilter is working, and something in your restore process=
 is=20
causing the problem.  (have you modified the /etc/rc.d/init.d/iptables sc=
ript=20
in any way?)

I've never used save/restore, but instead have a custom script to build m=
y=20
firewall.  I need to react to a dynamic (well, it CAN change, but usually=
=20
stays static for several days) IP address in my rule construction, so=20
save/restore was never an option for me.  Personally I feel that an actua=
l=20
script that constructs the firewall is more effective and certainly more=20
flexible than the save/restore approach.  Changes to the firewall must be=
=20
made in the script, however, rather than just adding/changing a rule in a=
=20
shell and depending on the save to remember it.

I'm running RH7.3, so I created a script  /etc/rc.d/init.d/firewall and l=
inks=20
in /etc/rc.d/rc5.d and /rc3.d called S42firewall to run the script in=20
runlevel 3 and 5 startup. (S42 because that follows S41adsl, and I need t=
he=20
IP of a functional ppp0 for some rules)  These are also the places to rem=
ove=20
references to ipchains (S08ipchains originally on my system) which RedHat=
 7.x=20
uses by default, even though it includes and even tries to start iptables=
=2E

I'm probably going to post a link to my firewall script here in a few day=
s. =20
I'm adding useful comments to some parts of it first, but am interested i=
n=20
feedback comments/criticisms.  (old reliable peer-review process :^)

j


