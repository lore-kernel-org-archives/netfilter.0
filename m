From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: will --cmd-owner ever return?
Date: Wed, 28 Mar 2007 04:07:47 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0703280407340.26461@yvahk01.tjqt.qr>
References: <20070327184526.GA5168@trane.vulkor.net>
	<460967CB.7020608@shorewall.net> <46096FAE.6060202@t0mb.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46096FAE.6060202@t0mb.net>
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
To: tom <tom@t0mb.net>
Cc: netfilter@lists.netfilter.org, Tom Eastep <teastep@shorewall.net>, vwf <vwf@vulkor.net>


On Mar 27 2007 20:25, tom wrote:
>
> If a connection is established, then you can find the owner by comparing the
> inode in /proc/net/tcp with the /proc/<PID> tree [all the numbered folders].

That's not really atomic.


Jan
-- 

