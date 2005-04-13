From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: -m state question
Date: Wed, 13 Apr 2005 09:54:54 -0500
Message-ID: <425D32BE.6020807@riverviewtech.net>
References: <08D2636915B90D4FADE116B548E5A516D6C4D4@s142-179-184-97.ab.hsia.telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <08D2636915B90D4FADE116B548E5A516D6C4D4@s142-179-184-97.ab.hsia.telus.net>
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
To: Jason Sigurdur <jason.sigurdur@ASPENVIEW.ORG>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

> Hi with the below rules I keep seeing (intermittently) packets that are
> dropped in the 'FORWARD_' chain such as
> 
> FORWARD_DROPPED: IN=eth1 OUT=eth0 SRC=172.16.x.x DST=209.204.233.88 LEN=40
> TOS=0x00 PREC=0x00 TTL=127 ID=53086 DF PROTO=TCP SPT=1595 DPT=80 WINDOW=0
> RES=0x00 RST URGP=0

If I am reading this output correctly this looks like it is a reset packet.  It would depend on if this packet is in response to errant packets inbound to one of your systems or if you have a system that is erroneously sending this.  If the later is the case this packet is not considered ESTABLISHED or RELATED and as it is not trying to synchronize a new connection it is not considered NEW either.  I would need to see more traffic dumps from shortly before and after (5 - 10 min) this packet to see if it is associated with any other on going connection.  I'm not seeing any indication that the ACK flag was set in this packet thus indicating to me that this packet is in response to another packet that came in bound to it, but I'm not sure that the LOG target would show the ACK flag or not, though I would expect it to.  Can you get a TCPDump / Etherial output of this traffic and post it to t
 he list?  (Scrub IPs if you need to.  Make a.b.c.d be your client systems and w.x.y.z be 
the destination system on the INet)

> Should'nt  the 3rd FORWARD_ rule allow any new forwarding entries in from
> any where except eth0?

No, not if the connection is erroneous.



Grant. . . .

