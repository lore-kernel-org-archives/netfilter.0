From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bind 9 and iptables
Date: Fri, 27 Aug 2004 17:00:18 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512F8@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> OK i will try again.
>
> I have a internal dns server with a forwarder to my isp.The
> internal dns server is on the iptables box.The clients use
> the internal dns server to resolve names on the local
> network.When the internal dns cannot resolve a name it
> forwards to my isp's dns.
>
> So my problem is with the forwarding.To get that to work i
> have to uncomment:

from an iptables persepctive--you're problem is with the INPUT, not the =
FORWARD-ing

> iptables -P INPUT DROP and iptables -P OUTPUT DROP.
>
> When i uncomment those two rules the clients can browse the
> internet.
>
> what rules can i use instead of uncommenting those two
> rules because thats not secure?

you need to allow your internal hosts to contact the dns server/firewall =
on UDP port 53.

see previous post by me, and a much more thorough one by Aleksandar =
Milivojevic.

-j

