From: gARetH baBB <hick.lkml@gink.org>
Subject: 2.4.23 ipchains/MASQ problems
Date: Thu, 4 Dec 2003 11:07:20 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0312041054500.532@stum.gink.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Has anyone else had serious problems with 2.4.23 death when using ipchains
and masquerading ?

I've had two boxes die with a panic as soon as they tried to do any form
of masq, going back to .22 results in happiness.

One box is essentially a Slackware 8.1 base, and the other 9.0.

Both have similar ipchains rules.

The 8.1 box is my test box and I upgraded to .23 on it and everything was
fine, it shifted over 4G of non-masq data during the day and showed no
problems.

I then upgraded the 9.0 box to .23, and it died within seconds of
networking going with a panic.

Whilst I investigated what was going on I shited the routing so the 8.1
box did masq for the internal network. Not immediately, but within minutes
that box too paniced. Rebooting the 8.1 box resulted in panic pretty much
in the same way as the 9.0 box.

I put both back to .22 and sanity was restored.

I notes lots of changes in the .23 patch to the masq code and network code
in general.

Anyone else seen these problems ? [though I presume most of you are using
iptables and this *could* be ipchains specific]

