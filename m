From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 08:56:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407240856.03201.Antony@Soft-Solutions.co.uk>
References: <01be01c4710c$440a79e0$5100a8c0@egp>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01be01c4710c$440a79e0$5100a8c0@egp>
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

On Saturday 24 July 2004 12:24 am, Bruno Negr=E3o wrote:

> Hi guys, I didn't understand the following question and answer on
> netfilter's faq:
>
> "3.18 Why isn't the 'iptables -C' (--check) option implemented?
>
> Well, first of all, we're lazy ;). To be honest, implementing a check
> option is almost impossible as soon as you start to do stateful
> firewalling. Traditional stateless firewalling bases it's decision just=
 on
> information present in the packets header. But with connection tracking
> (and '-m state' based rules), the outcome of the filtering decision dep=
ends
> on header+payload, as well as header+payload of previous packets within
> this connection."
>
> First of all, what does they mean about "--check"? What would they chec=
k?

I understand it to mean "check what would happen to a packet of this type=
 if=20
it went through the ruleset"

ie: iptables -C INPUT -p tcp --dport 22

Would tell you whether your firewall would accept (to itself) an SSH pack=
et or=20
not.

> What is "packet payload"? How does it make the "--check" option impossi=
ble
> to be implemented?

Payload is the data inside the packet (the useful bit beyond the IP / TCP=
 /=20
UDP etc headers).

It makes it impossible to implement --check because there's no way to pro=
vide=20
the payload on the command line.

Regards,

Antony.

--=20
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


