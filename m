From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Question; what is this netfilter logfile entry ?
Date: Sun, 14 Nov 2004 05:51:03 -0500
Message-ID: <1100429463.5934.420.camel@grendel>
References: <1100392955.4894.25.camel@localhost.localdomain>
	<000c01c4c9f0$4807a0d0$de0aa8c0@comp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c4c9f0$4807a0d0$de0aa8c0@comp>
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
To: Bo Jacobsen <subs@systemhouse.dk>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-11-13 at 21:18, Bo Jacobsen wrote:
>
> Nov 14 02:24:48 WF1-HOME kernel: DENY-OUT:.IN= OUT=eth0 SRC=192.168.1.2 DST=198.41.0.4 LEN=560 TOS=0x00 PREC=0xC0 TTL=64 ID=3123 PROTO=ICMP TYPE=3 CODE=3 [SRC=198.41.0.4 DST=192.168.1.2 LEN=532 TOS=0x00 PREC=0x00 TTL=49 ID=41159 PROTO=UDP SPT=53 DPT=51981 LEN=512 ]
> 
> It looks like ICMP with an embedded DNS call  ?.

It's an ICMP port unreachable. Looks like 198.41.0.4 tried to send a
reply to one of your DNS queries, took too long to respond, and by the
time they did the port was closed. What's kind of interesting is that it
was a full size answer so I'm guessing the truncation bit was set. This
means that if this packet had been returned in time your system would
have had to switch to TCP to get a full answer.

The UDP info is embedded in the payload so the remote system knows which
port was unreachable. This is in case multiple session were running at
the same time. Perfectly normal for an ICMP error packet.

> What is it exactly, and how would a rule to allow this look like ?

This would be permitted if you are letting "RELATED" traffic through.
This ensures that only legit ICMP errors are passed. While you could
define an accept rule for the ICMP type code, this would let all
matching traffic through opening up the possibilities of a covert
communication channel. 

HTH,
Chris



