From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: snat to multiple source ip
Date: Thu, 15 Sep 2005 11:59:19 +0200
Message-ID: <BAY103-DAV1334699C22EB479A7856C6B29E0@phx.gbl>
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
To: netfilter@lists.netfilter.org

Hello everybody.

I have a system with Slackware linux 2.4.30 and squid 2.5s10.
Squid is running as an http proxy to control internet access.
This system is connected to the internet with 1 hdsl and
2 adsl connections.
My firewall script mark all the squid packet and I route them
through the two adsl connections (I have patched the kernel
with the equalize patch).
The problem is that Squid set the packet source ip with the
hdsl ip, so I need to snat them to the ADSLs ip:

iptables -t nat -I POSTROUTING -s HDSL_ip
--protocol tcp -m multiport --dports SQUIDports
-j SNAT --to first_adsl_ip --to second_adsl_ip

As stated by man:

"You can add several --to-source option. If you specify
more than one source address, either via an address range
or multiple --to-source options, a simple round-robin  (one
after another in cycle) takes place between these addresses."

Everytime I connect to the internet the ip address is *always*
the first_adsl_ip and after few refresh it change to second_adsl_ip
(I know there are chaching issue with proxy/browser).
Usually I connect to http://www.dnsstuff.com/ to control which is
my ip address. My company has about 150 pc that connect through this
proxy. Is this behaviour fine or am I missing anything?


