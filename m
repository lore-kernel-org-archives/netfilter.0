From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fedora Core 2. Port Forwarding Problems
Date: Sat, 24 Jul 2004 15:55:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241555.16611.Antony@Soft-Solutions.co.uk>
References: <4101D6BD.8040904@mail.ru>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4101D6BD.8040904@mail.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Saturday 24 July 2004 4:25 am, =D0=92=D0=B0=D1=81=D0=B8=D0=BB=D0=B8=D0=
=B9 =D0=A1=D0=B2=D0=B8=D1=80=D0=B8=D0=B4=D0=BE=D0=B2 wrote:

> I've installed fedora core 2 and tried to reuse my old settings i
> retained from redhat9 system.
>
> Masqeurading works fine, but when i try to do port forwarding like this
> iptables -t nat -A PREROUTING -p tcp -d <domainname.com> --dport 80 -j
> DNAT --to 192.168.20.40:80
> rule adds itself fine, but port 80 is not accessible from outside.

Are you sure about the resolving of domainname.com?   What does the rule =
get=20
added as?

> when i try to connect from outside it doesn't say connection refused, i=
t
> dies after a timeout.
> /proc/net/ip_conntrack doesn't show any presence of connection, I tried
> to send it to -j LOG & ULOG but both end up empty.

Please show us your ruleset.   We would like to see:
 - what IP address the above PREROUTING rule gets installed with
 - the corresponding FORWARD rule for the packets
 - an appropriate reply packet rule
 - how you have been LOGging packets for testing

I suggest the output of "iptables -L -nvx; iptables -L -t nat -nvx" and i=
f=20
appropriate also "iptables -L -t mangle -nvx" is a good format for us to=20
understand where you're starting from.

Regards,

Antony.

--=20
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


