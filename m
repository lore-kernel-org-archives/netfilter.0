From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Automatic forwarding to own interfaces
Date: Tue, 23 Sep 2003 11:25:21 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0309231123500.15001@tux.rsn.bth.se>
References: <200309230823.AA53674022@mirrormind.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309230823.AA53674022@mirrormind.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Lodal <simonl@mirrormind.com>
Cc: netfilter@lists.netfilter.org

On Tue, 23 Sep 2003, Simon Lodal wrote:

> >That's a "normal" Linux behaviour. Linux answers packets destined to any
> >of its own IPs own any interface, as long as your INPUT filtering rules
> >allows it. You can set something like :
> >
> >	iptables -A INPUT -d 192.168.1.5 -i ! eth1 -j DROP
> >	iptables -A OUTPUT -s 192.168.1.5 -o ! eth1 -j DROP
>
> Hmm... I was afraid this was the case.
>
> So in the common small scale setup with one box acting as router, firewall and internal web and smtp server, this is an absolute must. Or your "internal" web and smtp services will in fact be open to anyone.
>
> So what is the point in configuring daemons to listen only on specific addresses?
>
> This is probably a surprise to some, as it is to me. Quite a few firewall packages and setups miss this point.

Usually you don't even care about to which ip on the local machine someone
connects, only the sourceip/interface they are connecting from. So just
take out the -d part in INPUT rules.

/Martin

