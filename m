From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: NAT to one net, bridge to another
Date: Thu, 14 Sep 2006 08:51:33 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609140849530.8740@yvahk01.tjqt.qr>
References: <200609081250.32329.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200609081250.32329.mike@v6.gaima.co.uk>
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
To: Mike Williams <mike@v6.gaima.co.uk>
Cc: netfilter@lists.netfilter.org


>Can you DNAT packets to IPs X, and Y, Z assigned to a bridge, while bridging 
>those IPs not assigned to it?

I don't get it from your description, but DNATing packets that will 
be bridged after DNAT rather than routed will not work.

>(There is probably going to be a small amount of firewalling on the bridged 
>IPs)


Jan Engelhardt
-- 

