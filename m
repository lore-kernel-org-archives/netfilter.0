From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec passthrough with iptables
Date: Tue, 15 Oct 2002 14:00:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210151300.g9FD0vL23616@vulcan.rissington.net>
References: <B9D1A7D2.3DF9%george@mattandgeorge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B9D1A7D2.3DF9%george@mattandgeorge.com>
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

On Tuesday 15 October 2002 12:09 pm, George Agnelli wrote:

> I'm having a similar problem and am not very experienced yet with iptab=
les.
>
> > Make sure you are forwarding (both ways :-) protocol 50 (ESP), protoc=
ol
> > 51 (AH) and UDP sport 500 / dport 500 (IKE).
>
> Could you show me the best way to write this in iptables syntax?

iptables -A FORWARD -p esp -j ACCEPT
iptables -A FORWARD -p ah -j ACCEPT
iptables -A FORWARD -p udp --sport 500 --dport 500 -j ACCEPT

You may wish to add some -s and/or -d source & destination address=20
restrictions on the above rules, eg:

iptables -A FORWARD -p esp -s a.b.c.d -d w.x.y.z -j ACCEPT
iptables -A FORWARD -p esp -s w.x.y.z -d a.b.c.d -j ACCEPT

where a.b.c.d and w.x.y.z are the two IPsec gateways which need to=20
communicate.

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

