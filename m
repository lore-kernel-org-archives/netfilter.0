From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Differentiating direct, and redirected access?
Date: Mon, 18 Oct 2004 10:24:28 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9C05820@asimail2.alphanumeric.com>
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

> Hello all,
>
> I'm running a squid at port 3128 as a transparent proxy.
>
> There are requests coming directly to 3128 port and
> those coming to 80 port and then redirected to 3128 by
> following rule:
>
> -t nat -A PREROUTING -i eth0 -p tcp -m tcp \
>    --dport 80 -j REDIRECT --to-ports 3128
>
> What I want is block direct requests to 3128, allowing
> redirected access (transparent proxy) only. How do I do it?
>
> If I just set up a rule in filter chain like:
>
> -t filter -A INPUT -i eth0 -p tcp -m tcp \\
>    --dport 3128 -j DROP
>
> Those requests redirected from port 80 to 3128 are also
> blocked by this rule. It seems that the redirected packets
> come in to this chain once again with the new port number.
>
> How can I differentiate these two different kinds of
> request? Any clue will be greatly appreciated.
>
> Jinsuk Kim

mark the packets that will get redirected, and only accept them if they
have the mark:

  # mark packets with dst port 80
  iptables -t mangle -A PREROUTING -i eth0 -p tcp --dport 80 \
    -j MARK --set-mark 1

  # redirect port 80 to 3128
  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 \
    -j REDIRECT --to-ports 3128

  # accept packets to 3128 that have the mark
  iptables -A INPUT -i eth0 -p tcp --dport 3128 -m mark --mark 1 \
    -j ACCEPT

-j

