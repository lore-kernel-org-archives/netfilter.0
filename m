From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Newbie question
Date: Sun, 16 Feb 2003 02:57:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302160257.48195.netfilter@newkirk.us>
References: <Pine.GSO.4.10.10302151813260.17251-100000@tick.ece.utexas.edu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.10.10302151813260.17251-100000@tick.ece.utexas.edu>
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
To: "Shankar; Hari" <hari@ece.utexas.edu>, netfilter@lists.netfilter.org

On Sunday 16 February 2003 02:04 am, Shankar; Hari wrote:
> Hello,
>
> I'm trying to use IPTables in User Mode Linux. I've configured UML to
> use IPTables replacing IPChains. But when I start up UML, and try to
> play around with IPTables, I get the message,
>
> iptables v1.2.4: can't initialize iptables table `filter': Table does
> not exist (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>
> The UML version that I'm running is 2.4.19.
>
> What could I be doing wrong? I'd very much appreciate any help!

Sorry to sound like a smartass, but did you try insmod?  :^)

"/sbin/insmod ip_tables" or "/sbin/modprobe ip_tables" will load the=20
iptables module, including the default table - filter.  (insmod inserts=20
the module into the running kernel, modprobe looks for it already=20
loaded, and calls insmod if it's not found)  If you get a message that=20
insmod or modprobe can't be found, try "whereis insmod" to find the=20
correct path on your distro.  (I'm not familiar with how UML is laid=20
out)  I'll assume that with a 2.4.19 kernel that the ip_tables module is=20
available. =20

The module has to be loaded (or compiled into the kernel) in order for=20
the iptables userland command to function, so you really want it started=20
when the system starts.  You can try "serviceconf", which is usually=20
available, or "ksysv" if you have KDE installed, which gives you a=20
nicer, more detailed interface.  If it runs, check to see if "iptables"=20
is listed, probably not selected to run.  Select it to start during=20
startup, and next time the module will be inserted automatically, and=20
basic rules will be set.  (Very basic, like no rules at all and ACCEPT=20
policy on all chains...!)

Serviceconf will let you control startup for the runlevel you are=20
currently in.  Ksysv lets you control ALL runlevels in a single view: 3=20
is a console startup (you have text interface for login, whether or not=20
you load xwindows later) and 5 is xwindows startup, where you have=20
graphical interface for login.  Best bet is to start it in both anyway. =20
Don't muck with other runlevels until you know what they do, and know=20
what SysV-Init accomplishes in them.

The nice thing with ksysv is it lets you control the sequence of=20
startups, IE to ensure that a custom firewall script is started AFTER=20
the iptables startup takes place - serviceconf doesn't offer this, IIRC,=20
you have to manually change the link names in /etc/rc.d/rc5.d for=20
example.

Finally (but actually first and foremost) you should get iptables v1.2.7a=
=20
installed, but you'll need to be comfortable with compiling and=20
installing to do so.  If you're not, then just work with what you have=20
for now and get familiar and comfortable first - but be aware that the=20
answer to a support question will sometimes be "install 1.2.7a then=20
ask".

j



