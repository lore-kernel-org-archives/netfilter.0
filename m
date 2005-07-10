From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Sun, 10 Jul 2005 19:06:41 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAKEFJBEAB.dleangen@canada.com>
References: <5d2f37910507091940101bfd5a@mail.gmail.com>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f37910507091940101bfd5a@mail.gmail.com>
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


Hi! Thanks for the follow-up.

> What is adsl-setup doing for you? Are you using an internal dsl modem,
> or is it external/usb or external/cat5?  Especially if you use a
> network cable to connect to an external DSL modem, you should be able
> to configure your network card directly using ifconfig or
> /etc/sysconfig thus getting rid of the need for adsl-setup at all.

Ok, thanks! Your suggestion to look directly at the config script allowed
the solution to jump out at me. I simply never thought to look at my ppp0
device.

I looked into this further and found that the adsl-* scripts, depending on
the configuration, actually add some junk to iptables.

The file /etc/sysconfig/network-scripts/ppp0 looks something like this:

USERCTL=no
BOOTPROTO=dialup
NAME=DSLppp0
DEVICE=ppp0
TYPE=xDSL
ONBOOT=yes
PIDFILE=/var/run/pppoe-adsl.pid
FIREWALL=MASQUERADE
PING=.
PPPOE_TIMEOUT=80
LCP_FAILURE=3
LCP_INTERVAL=20
CLAMPMSS=1412
CONNECT_POLL=6
CONNECT_TIMEOUT=60
DEFROUTE=yes
SYNCHRONOUS=no
ETH=eth0
PROVIDER=DSLppp0
USER=memyselfandi@somewhere
PEERDNS=no
DEMAND=no


If the entry "FIREWALL" is anything other than "NONE", then, when the
related script (don't know which one) is invoked at runtime, it "interferes"
with the firewall by adding some extra stuff. I didn't realise this before.

Once again, by loading with 'iptables-restore /etc/sysconfig/iptables', the
extra stuff is not added. That's essentially why my firewall at boot time
and the one I really wanted were different.

Problem solved!


Thank you all so much for your help through this. :-D



