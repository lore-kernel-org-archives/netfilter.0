From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: script firewall
Date: Wed, 14 Apr 2004 09:30:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404140930.32110.Antony@Soft-Solutions.co.uk>
References: <20040414025241.57105.qmail@web40509.mail.yahoo.com>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040414025241.57105.qmail@web40509.mail.yahoo.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Wednesday 14 April 2004 3:52 am, Luis GUSTAVO wrote:

> i want Turn off all conections and ports in my machine

iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP

will do that for you.

> and after i want turn on only what i need, do you understand me?

iptables -A INPUT -p tcp --dport xyz -j ACCEPT

will enable a service which is running on the machine with the rules, and

iptables -A FORWARD -d a.b.c.d -p tcp --dport xyz -j ACCEPT

will enable forwarding packets to some other machine

Obviously you will need to add the standard ESTABLISHED,RELATED rules for=
=20
connection tracking replies etc, however the above is a start.

> thank you

I also recommend that you read some of the documentation at=20
http://www.netfilter.org/documentation, and Oskar Andreasson's tutorial a=
t=20
http://iptables-tutorial.frozentux.net

Hope this helps,

Antony.

PS: Please don't top-post, and please reply to the list.

> Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
>
> On Tuesday 13 April 2004 10:28 pm, Luis GUSTAVO wrote:
> > Hi,
> >
> > i=B4m looking for a script for my adsl conection.
>
> Er, that's not a very helpful description, but anyway...
>
> > i found this
> >
> > iptables -F
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
> > iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> > iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
>
> Hmmm. Looks like one of mine :)
>
> > when i apllyed this rules, my machines clients, don=B4t know acces my
> > machine.
>
> I tell you what - you let us know what you'd like your firewall to do, =
and
> we might be able to help you.
>
> If you don't tell us what your network setup is, and what you want your
> firewall to do for you, we might not be able to suggest the perfect rul=
eset
> for your needs.
>
> I *did* say when I posted the above ruleset that it allowed me to acces=
s
> *from* the machine the rules were running on *to* other systems by SSH,=
 and
> blocked *all access in to my machine* (which is what I consider to be
> secure).
>
> Therefore that fact that after you've applied these rules to your machi=
ne,
> your clients can't access the system, suggests that the ruleset is work=
ing
> correctly.
>
> Tell us what you'd like to be different (and preferably tell us what yo=
u've
> tried yourself and had problems with) and we'll see what we can do to h=
elp.
>
> Regards,
>
> Antony

--=20
"Linux is going to be part of the future. It's going to be like Unix was.=
"

 - Peter Moore, Asia-Pacific general manager, Microsoft


