From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: script firewall
Date: Tue, 13 Apr 2004 23:02:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404132302.20098.Antony@Soft-Solutions.co.uk>
References: <20040413212810.35514.qmail@web40506.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040413212810.35514.qmail@web40506.mail.yahoo.com>
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

On Tuesday 13 April 2004 10:28 pm, Luis GUSTAVO wrote:

> Hi,
>
> i=B4m looking for a script for my adsl conection.

Er, that's not a very helpful description, but anyway...

> i found this
>
> iptables -F
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

Hmmm.   Looks like one of mine :)

> when i apllyed this rules, my machines clients, don=B4t know acces my
> machine.

I tell you what - you let us know what you'd like your firewall to do, an=
d we=20
might be able to help you.

If you don't tell us what your network setup is, and what you want your=20
firewall to do for you, we might not be able to suggest the perfect rules=
et=20
for your needs.

I *did* say when I posted the above ruleset that it allowed me to access=20
*from* the machine the rules were running on *to* other systems by SSH, a=
nd=20
blocked *all access in to my machine*  (which is what I consider to be=20
secure).

Therefore that fact that after you've applied these rules to your machine=
,=20
your clients can't access the system, suggests that the ruleset is workin=
g=20
correctly.

Tell us what you'd like to be different (and preferably tell us what you'=
ve=20
tried yourself and had problems with) and we'll see what we can do to hel=
p.

Regards,

Antony

--=20
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


