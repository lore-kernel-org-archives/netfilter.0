From: "John Black" <black@arbbs.net>
Subject: Re: ip alias
Date: Tue, 28 Sep 2004 06:58:35 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <007f01c4a552$7c95a620$936ffea9@alpha>
References: <002a01c4a509$74f94b40$936ffea9@alpha>
	<1096351043.4158fd43638a8@webmail2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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




>
> Not quite sure what are you trying to do with above.  You don't need
iptables to
> set up an alias.  The ifconfig or ip commands will suffice.
>
> What do you want to achieve with iptables command?  What it will do is
that all
> packets addressed for 192.168.1.23 that arrive into box (not generated on
the
> box) on interface eth0 will be sent to 161.31.31.23 (with that IP address
as
> destination).  Is that what you wanted to do?
>
but the traffic from 192.168.1.23 that i need to go to the internet i would
like to
have addressed as 161.31.31.23

john


