From: "Simon Lodal" <simonl@mirrormind.com>
Subject: Re: Automatic forwarding to own interfaces
Date: Tue, 23 Sep 2003 08:23:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309230823.AA53674022@mirrormind.com>
Reply-To: <simonl@mirrormind.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>That's a "normal" Linux behaviour. Linux answers packets destined to any
>of its own IPs own any interface, as long as your INPUT filtering rules
>allows it. You can set something like :
>
>	iptables -A INPUT -d 192.168.1.5 -i ! eth1 -j DROP
>	iptables -A OUTPUT -s 192.168.1.5 -o ! eth1 -j DROP

Hmm... I was afraid this was the case.

So in the common small scale setup with one box acting as router, firewall and internal web and smtp server, this is an absolute must. Or your "internal" web and smtp services will in fact be open to anyone.

So what is the point in configuring daemons to listen only on specific addresses?

This is probably a surprise to some, as it is to me. Quite a few firewall packages and setups miss this point.

Simon


