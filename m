From: Lore <skizzo82@yahoo.com>
Subject: Re: libipq: problems changing destination port
Date: Mon, 31 Oct 2005 20:27:24 +0100 (CET)
Message-ID: <20051031192724.16806.qmail@web52802.mail.yahoo.com>
References: <Pine.LNX.4.61.0510311732330.16659@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510311732330.16659@filer.marasystems.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrik Nordstrom <hno@marasystems.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

This makes a lot of sense... and I think this will
save a lot of time to those who'll try to change the
port to an outgoing packet using LibIPQ.

the only way to make it work is another chain on
netfilters that passes every incoming packet to
userspace so that the port can be reverted to the
original one... so the sender is fooled and behaves
like it is directly connected to the server.

Thanks alot.

One more question:
I get every outgoing packet to userspace, get the ip
and port, connect to server to check if it has the
required services and daemon (the latter is part of my
project) and if both are true I redirect every
outgoing packet of that kind (port and IP) to a
predefined port. (if only the former is true, packets
are verdicted as NF_ACCEPT without any change)
As we ascertained, in the case service and daemon are
available, I have to change the port of all incoming
packet of that connection...
Do you think has better performance to add a new chain
for every port used (via execv) or to use a chain that
redirects every incoming packet to userspace, so that
I have to do a clean NF_ACCEPT to every incoming
connection that is not of my kind?

Thanks again and again...
Byez
lore

--- Henrik Nordstrom <hno@marasystems.com> ha scritto:


> On Mon, 31 Oct 2005, Lore wrote:
> 
> > 16:27:50.094991 IP (tos 0x0, ttl  64, id 39743,
> offset
> > 0, flags [DF], proto: TCP (6), length: 60)
> > 192.168.0.4.32788 > geronte.cs.unibo.it.2026: S,
> cksum
> > 0x5034 (correct), 2890202236:2890202236(0) win
> 5840
> > <mss 1460,sackOK,timestamp 14378819 0,nop,wscale
> 2>
> >
> > 16:27:50.119230 IP (tos 0x0, ttl  64, id 625,
> offset
> > 0, flags [DF], proto: TCP (6), length: 40)
> > 192.168.0.4.32788 > geronte.cs.unibo.it.2026: R,
> cksum
> > 0x36fd (correct), 2890202237:2890202237(0) win 0
> 
> Looks like you suceeded just fine, but failed to
> undo your rewrite on 
> return traffic...
> 
> in the above return traffic seems missing. The
> picture I see is
> 
> 
> 192.168.0.4.32788 -> geronte.cs.unibo.it.2026 (2022)
> SYN
> 
> [not shown]
> geronte.cs.unibo.it.2026 -> 192.168.0.4.32788
> SYN+ACK
> 
> 192.168.0.4.32788 -> geronte.cs.unibo.it.2026 RESET
> 
> Where I suspect the RESET is actually "I have no
> interest in talking to 
> geronte.cs.unibo.it:2026, go agay please! I want to
> talk to 
> geronte.cs.unibo.it:2022".
> 
> 
> Does this make any sense to you?
> 
> Regards
> Henrik
> 



	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da
10MB 
http://mail.yahoo.it


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

