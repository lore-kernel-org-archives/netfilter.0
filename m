From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to configure a router/firewall with no nat
Date: Sat, 13 Jan 2007 19:34:55 +0100
Message-ID: <45A9264F.8010907@plouf.fr.eu.org>
References: <45a9198a.5171c3c7.243e.ffff8458@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45a9198a.5171c3c7.243e.ffff8458@mx.google.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Carlos Rotenberg a =E9crit :
> I have to create a Firewall/Router with Iptables to protect our clients=
, but
> I can't do NAT, my clients have to have Public IPs on their servers.

Lucky you. :-) NAT is evil.

> I was trying to figure out how to do that, but I couldn't get any clue.

It is exactly the same as a firewall/routeur with NAT, except that it=20
has no NAT rules.

- Enable IP forwarding.
- Add filtering rules according to your specifications (what is accepted=20
from where to where, what is not).

PS : your lines are too long and were wrapped, so your diagram is hard=20
to read.

