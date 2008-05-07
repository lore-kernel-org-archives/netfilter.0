From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: viewing rules and traffic while inserting/removing rules
Date: Wed, 7 May 2008 20:25:48 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805072024570.30395@fbirervta.pbzchgretzou.qr>
References: <4821E655.4010504@roth.lu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4821E655.4010504@roth.lu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lists+netfilter@roth.lu
Cc: netfilter@vger.kernel.org


On Wednesday 2008-05-07 19:26, lists+netfilter@roth.lu wrote:
> Hi there,
> I have quite a large list of blacklisted networks in my iptables firewall,
> approx. 20,000.
> Now I have a script that updates this blacklist according to my needs every
> hour. My problem now is that during the update period (which consists of
> several iptables [-I|-D] $CHAIN -s ... -j ... commands) my traffic accounting
> is going haywire.
> I have narrowed it down to the problem that displaying the rules (from which I
> extract the traffic information via iptables -xvnL $CHAIN) intermittently shows
> 0s (zeroes) as paket and byte counters while the insert/delete commands are
> being issued.
> Is there a locking problem? Should I maybe report this to the devel list?

Each invocation of iptables retrieves and writes the rule table back
into the kernel, which is very antiperformant. You want to be using
iptables-restore here to minimize any delays.
