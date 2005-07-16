From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Zeroing chain counters
Date: Sat, 16 Jul 2005 23:40:05 +0200
Message-ID: <42D97EB5.30601@lopsch.com>
References: <Pine.LNX.4.61.0507162321100.22777@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507162321100.22777@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Jan Engelhardt schrieb:
> Hi,
> 
> 
> iptables -Z zeroes all rule counters, but how do I zero the chain counters
> Chain INPUT (policy DROP 68946 packets, 3380061 bytes)?
> 
> 
> Jan Engelhardt

iptables -t filter -Z INPUT

