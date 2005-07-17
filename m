From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Zeroing chain counters
Date: Sun, 17 Jul 2005 12:31:36 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507171230490.7874@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0507162321100.22777@yvahk01.tjqt.qr>
	<42D97EB5.30601@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D97EB5.30601@lopsch.com>
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
To: Daniel Lopes <lopsch@lopsch.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

>> iptables -Z zeroes all rule counters, but how do I zero the chain counters
>> Chain INPUT (policy DROP 68946 packets, 3380061 bytes)?
>
> iptables -t filter -Z INPUT

No...



Jan Engelhardt
-- 

