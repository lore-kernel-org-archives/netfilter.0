From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT to ALL addresses in a range (at once)
Date: Sat, 3 Feb 2007 12:42:58 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702031241540.27840@yvahk01.tjqt.qr>
References: <da3a2a260702030027h36acac1bn423b26b0a1b7e28a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <da3a2a260702030027h36acac1bn423b26b0a1b7e28a@mail.gmail.com>
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
To: James Shewey <jdshewey@gmail.com>
Cc: netfilter@lists.netfilter.org


> is it possible in iptables to forward a port, range of ports or all
> ports (ideally all ports) to all addresses on a subnet (rather than
> select an ip address at random from the subnet as would be done with
> the "-to-destination 192.168.0.2 192.168.0.254" switch)?

Sort of "Broadcast DNAT"? Not that I know of. (But you could write a 
userspace replicator in conjunction with using tproxying.)


Jan
-- 
ft: http://freshmeat.net/p/chaostables/

