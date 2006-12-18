From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: ipsec on 2.6.16+ question
Date: Mon, 18 Dec 2006 10:23:38 +0100
Message-ID: <BAY103-DAV2730F1927552670E0B615B2C90@phx.gbl>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024EEDD@pxtbenexd01.pxt.primeexalia.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org

Gary W. Smith wrote:

>Hello,
>
>I've upgraded one of our old firewalls from RHEL4 to RPATH 1.0.5
>(2.6.16).  We moved the firewall script directly from the old firewall
>to the new one and everything appeared to work except IPSEC, which
>failed.  It appears that it's no longer honoring the -p ! esp portion
of
>the postrouting.  I'm not sure if this is or is not standard behavior
or
>not or if there is a better way of doing what I'm doing below.  We have
>additional IP's beyond what's listed below (some public, some not)
which
>would require multiple lines for this.
>
>Original:
>
>-A POSTROUTING -o eth1 -p ! esp -j MASQUERADE
>
>Current working:
>-A POSTROUTING -s 10.0.16.0/255.255.248.0 -d 10.0.32.0/255.255.255.0 -o
>eth1 -j ACCEPT
>-A POSTROUTING -o eth1 -j MASQUERADE

I havent't understood your message.
Since 2.6.16 outgoing ipsec packets are seeing twice:
clear & encrypted on the outgoing interface (which if
I correctly understand is eth1 for you).
You must upgrade to iptables >=1.3.5 and take a look
for the new 'policy' match.
Something like this should do the trick (linux will
not snat packets which will be sent through the (any)
ipsec tunnel(s)):

$IPTABLES -t nat -I POSTROUTING -m policy --dir out --pol ipsec -j
ACCEPT




