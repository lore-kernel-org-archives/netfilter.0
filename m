From: Lore <skizzo82@yahoo.com>
Subject: Re: libipq: problems changing destination port
Date: Mon, 31 Oct 2005 16:37:05 +0100 (CET)
Message-ID: <20051031153705.42467.qmail@web52803.mail.yahoo.com>
References: <Pine.LNX.4.61.0510292351550.15219@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510292351550.15219@filer.marasystems.com>
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

First of all I have to apologize with Henrik because I
replied directly to him (I didn't noticed that Yahoo
replies only to the sender by default).

then it comes the repost:

Ok...
I do a new checksum... before changing the port I
checked that the checksum Algorithm was right by
comparing the system computed check with the one
computed by me.
Everything was right.

but in the moment I change the port the packet never
arrives.
Here's what comes out from TCPDump fetching on port
2026 the packets (originally for port 2022) that I
changed... from the first Ack on...:

root@morningmoon:/home/lore# tcpdump -i wlan0 dst port
2026 -vvv
tcpdump: listening on wlan0, link-type EN10MB
(Ethernet), capture size 96 bytes

16:27:50.094991 IP (tos 0x0, ttl  64, id 39743, offset
0, flags [DF], proto: TCP (6), length: 60)
192.168.0.4.32788 > geronte.cs.unibo.it.2026: S, cksum
0x5034 (correct), 2890202236:2890202236(0) win 5840
<mss 1460,sackOK,timestamp 14378819 0,nop,wscale 2>

16:27:50.119230 IP (tos 0x0, ttl  64, id 625, offset
0, flags [DF], proto: TCP (6), length: 40)
192.168.0.4.32788 > geronte.cs.unibo.it.2026: R, cksum
0x36fd (correct), 2890202237:2890202237(0) win 0

16:27:52.971108 IP (tos 0x0, ttl  64, id 39745, offset
0, flags [DF], proto: TCP (6), length: 60)
192.168.0.4.32788 > geronte.cs.unibo.it.2026: S, cksum
0x447b (correct), 2890202236:2890202236(0) win 5840
<mss 1460,sackOK,timestamp 14381820 0,nop,wscale 2>

16:27:52.995399 IP (tos 0x0, ttl  64, id 626, offset
0, flags [DF], proto: TCP (6), length: 40)
192.168.0.4.32788 > geronte.cs.unibo.it.2026: R, cksum
0x36fd (correct), 2890202237:2890202237(0) win 0

Any Idea?
Thanks a lot...
lore


--- Henrik Nordstrom <hno@marasystems.com> ha scritto:


> On Sat, 29 Oct 2005, Lore wrote:
> 
> > and in the code I change the tcphdr->dest to 2021,
> do
> > a new checksum and verdict it with NF_ACCEPT.
> >
> > The packet get's silently dropped and I don't know
> > why...
> 
> Should work.. but make sure you get the TCP header
> checksum correct...
> 
> What does tcpdump say?
> 
> Also beware that conntrack won't be too happy if you
> modify the 
> "connection details" like this. If you need
> conntrack loaded such mangling 
> of the packets is better left to NAT..
> 
> Regards
> Henrik
> 



	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

