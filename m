From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem with counting
Date: Sun, 6 Oct 2002 17:40:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210061640.g96GeUL13213@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210061816520.16254-100000@balthasar.nuitari.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210061816520.16254-100000@balthasar.nuitari.net>
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

On Sunday 06 October 2002 11:21 pm, Nuitari wrote:

> On Sat, 5 Oct 2002, Antony Stone wrote:

> > Show us the rest of your rules.

> extip=3D"`/sbin/ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | s=
ed -e
> 's/.*://'`"
> iptables -F FORWARD
> iptables -F INPUT
> iptables -F OUTPUT
>
> iptables -P FORWARD ACCEPT

Ugh :-(   Horrible.

> iptables -t nat -F POSTROUTING
> iptables -t nat -F PREROUTING
>
> EXTERNAL_INTERFACE=3D"eth0"
> IPTABLES=3D"/usr/sbin/iptables"
> INTERNAL_HOSTS=3D"10.0.0.2 10.0.0.3 10.0.0.4 10.0.0.5 10.0.0.6 10.0.0.7
> 10.0.0.8 10.0.0.9 10.0.0.10 10.0.1.2"

Okay, so you have a bunch of ten machines on private addresses inside you=
r=20
LAN.

> for HOST in $INTERNAL_HOSTS; do
>
>         $IPTABLES -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
>         $IPTABLES -A OUTPUT -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT

Why would a packet ever leave your external interface, with a destination=
=20
address of one of your internal machines ?

>         $IPTABLES -A FORWARD -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
>         $IPTABLES -A INPUT -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT

Why would a packet ever come in through your external interface with a so=
urce=20
address of one of your internal machines ?

What are these rules supposed to do ?

> done;
>
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

What ???   One of these I can understand - hide all your internal machine=
s=20
behind the external IP of the Firewall, but why are you also hiding the=20
entire Internet from your internal machines, behind the internal IP of yo=
ur=20
Firewall ?

And anyway, if eth0 is your external interface (defined above), what's pp=
p0 ?

> after that there is a bunch of rules following this pattern
>
> iptables -A FORWARD -i eth0 -o tr0 -p tcp --dport 873 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT

What is tr0 ?

> iptables -A PREROUTING -t nat -p tcp -d $extip --dport 873 -j DNAT --to
> 10.0.0.2:873
>
> I also tried having the following rules in the above for loop:
> $IPTABLES -N $HOST
> $IPTABLES -t -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j $HOST
> $IPTABLES -A $HOST -o $EXTERNAL_INTERFACE -d $HOST
> $IPTABLES -A $HOST -i $EXTERNAL_INTERFACE -s $HOST

I think you are confused about the interfaces which packets are expected =
to=20
arrive or leave on, and what source / destination addresses they should h=
ave.

Either that, or I've very much misunderstood what you're trying to do, an=
d=20
I'm confused....

Perhaps if you can answer the questions I've raised above we might both l=
earn=20
a bit more about what's going on :-)

Antony.

--=20

This email is intended for the use of the individual addressee(s) named a=
bove=20
and may contain information that is confidential, privileged or unsuitabl=
e=20
for overly sensitive persons with low self-esteem, no sense of humour, or=
=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar. =A0 Whisk until soft peaks form, then place in a warm oven =
for 40=20
minutes. =A0 Remove promptly and let stand for 2 hours before adding some=
=20
decorative kiwi fruit and cream. =A0 Then notify me immediately by return=
 email=20
and eat the original message.

