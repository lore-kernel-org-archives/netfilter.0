From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Letting out port 80 traffic
Date: Fri, 25 Nov 2005 13:52:25 +0100 (CET)
Message-ID: <59375.193.173.147.3.1132923145.squirrel@webmail.sterenborg.info>
References: <08ABA55F2AFD764F93022E0FEBD4DB8D2EF428@server.cambridge.brahler-ics.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <08ABA55F2AFD764F93022E0FEBD4DB8D2EF428@server.cambridge.brahler-ics.c
	o.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, November 25, 2005 12:53, Paul Collen wrote:
> Hello,
>
> It's the noobie again. I've broke my squid proxy this morning so I
> thought no problem, I'll just let port 80 traffic out from our
> network.
> I've added port 80 rules in several places but can't get it to work.
> Can someone tell me where I have to put the rules to gurantee I can
> get port 80 traffic out of my network please? :o)

And like... What have you tried ? What doesn't work ?
Maybe there's something in your current ruleset that prevents this
from working and if that's the case : since we're not psychic we can't
give advice.

> DNS and other traffic is flowing fine.

I'll take a guess..

You used Squid. Squid is a proxy and does the http requests for you.
Since it (probably) runs on the firewall, it uses the OUTPUT chain.
If you accept outgoing http requests (--dport 80) in the OUTPUT chain,
it'll work (if your Squid does it's job and yes, you also need DNS for
it to work).

Now, you probably don't want to use squid, just forward http[s].
This traffic is not originated from the firewall, thus travels the
FORWARD chain so you need to allow http[s] traffic there.
Something along the lines of :

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
$ipt -A FORWARD -m state --state NEW -p tcp --dport 80 \
  -j ACCEPT
$ipt -A FORWARD -m state --state NEW -p tcp --dport 443 \
  -j ACCEPT

You say DNS (and other) works fine.
Is that from the firewall or from the client ? Do you use a DNS server
on/behind the firewall that forwards lookups for you ?
If the clients cannot perform/complete DNS requests, you also need to
forward DNS traffic (remember to reconfigure your clients to use
another DNS server) :

$ipt -A FORWARD -m state --state NEW -d <ip_isp_dns> \
  -p udp --dport 53 -j ACCEPT
$ipt -A FORWARD -m state --state NEW -d <ip_isp_dns> \
  -p tdp --dport 53 -j ACCEPT

Make sure you enable IP forwarding :

echo 1 > /proc/sys/net/ipv4/ip_forward

You can find a tutorial where you can read all this (and more) on :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Gr,
Rob



