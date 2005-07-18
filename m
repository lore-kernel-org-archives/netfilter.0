From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNATing Windows File Sharing
Date: Mon, 18 Jul 2005 23:41:48 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507182338060.4094@yvahk01.tjqt.qr>
References: <1121674536.1554.16.camel@sadusbox.hostname>
	<Pine.LNX.4.61.0507181120001.14336@yvahk01.tjqt.qr>
	<42DB7B5D.1090506@rfgt.net>
	<Pine.LNX.4.61.0507181308200.15608@yvahk01.tjqt.qr>
	<20050718211235.GA11303@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050718211235.GA11303@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


>quoting a services file like it's an RFC is not a great way to write
>firewall rules.  just because a port has been reserved for a service,
>doesn't mean it's actually used.  the obvious example here would be

So it looks like Win98 does not use 135.
If you are not happy with the results, use -m layer7 and go from there. 
_That's_ safe, across udp, tcp and the whole port range. :)

>that being said, i've also noticed that NAT-ing a windows file server
>doesn't always work--depending on your network topology.

No, I think because it uses broadcasts which ... are normally not propagated 
across networks unless you utilize userspace proxies. I have recently turned a 
friend's network(s) into a bridged one to overcome this problem. (Or to evade, 
depending on the viewpoint.)




