From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Log Problem
Date: Mon, 9 Aug 2004 17:58:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091758.59638.Antony@Soft-Solutions.co.uk>
References: <200408091241665.SM01376@Hope>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408091241665.SM01376@Hope>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

On Monday 09 August 2004 5:40 pm, 'Me' wrote:

>  Hi,
> I=92m having problems logging packets (IPTables: 1.2.8 Kernel: 2.4.8) w=
ith
> the following rule (from the  FAQ):
>
> iptables -N logdrop
> iptables -A logdrop -j LOG
> iptables -A logdrop -j DROP
>
> On the log line I get:
> iptables: No chain/target/match by that name
>
> I=92m a little lost =96 any pointers?

It seems unlikely, but has your kernel been compiled without support for =
the=20
LOG target (and by the way, why are you using a three year old kernel=20
anyway?)?

Test one thing at a time:

1. Can you use the LOG target?
iptables -A INPUT -j LOG

2. Can you put a rule into a user-defined chain?
iptables -N logdrop
iptables -A logdrop -j DROP

If both the above tests work, then there is no reason you shouldn't be ab=
le to=20
put a LOG target into your user-defined chain (so check very carefully th=
e=20
syntac of what you are typing when you get the error, etc).

If one of the above tests fails, you know where the problem is.

Just one last thing to check - you haven't compiled the userspace iptable=
s=20
tool without also recompiling the kernelspace netfilter part, have you?

If you do one of these, you should also do the other to match.

Regards,

Antony.

--=20
Microsoft may sell more software than any other company, but McDonald's s=
ell=20
more burgers than any other company, and I think the other similarities a=
re=20
obvious...

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


