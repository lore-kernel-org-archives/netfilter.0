From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Thu, 24 Jun 2004 09:36:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088084177.2029.8.camel@grendel>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org>
	 <1087990356.2064.47.camel@grendel> <200406241037.01994.gdh@acentral.co.uk>
	 <200406241144.10450.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406241144.10450.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-06-24 at 06:44, Antony Stone wrote:
> 
> The other thing you see logged quite often for similar reasons is FIN-ACK 
> packets - the reply FIN-ACK is regarded as optional by many systems, so 
> netfilter often ends up logging (and dropping) the second one to come along.

IMHO this is completely non-RFC. It is clearly defined (RFC 793 page 22)
that both sides must issue a FIN/ACK and receive an ACK before the
connection is closed.

What OS does not issue the reciprocating FIN/ACK? 

> No harm done though, because the first one has done the job.

Actually not quite true as both sides will enter a fin-wait state (RFC
793 page 20) till the second FIN/ACK-ACK exchange takes place. This
chews up a session on both ends till their timers expire. Add up enough
of them and it can kill a busy server (seen it happen and have had to
stop state tracking to fix it).

The "problem" is that there is no requirement for the second FIN to be
immediately issued. The remote host is free to continue to send data
till it is finished. Sometimes this exceeds iptables's timer for the FIN
portion of the session, thus causing the problem many of us are seeing. 

Also, if you check the log entry that was posted:

> Jun 23 16:42:43 javagreen kernel: New not syn:IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
> DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=51601 DF 
> PROTO=TCP SPT=80 DPT=2162 WINDOW=64574 RES=0x00 ACK URGP=0

Its a 1500 byte ACK packet. So iptables is not just blocking the FIN/ACK
exchange, it can sometimes end up blocking data transfer as well. :(

I reported this "bug" back when iptables was still alpha code. At the
time iptables would expire the session 60 seconds after the first FIN
has been passed. I think Rusty bumped the timer up to 2 minutes. Perhaps
its been tweaked back down again or needs to be increased to 3 minutes?

HTH,
Chris



