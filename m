From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ICMP logging question
Date: Wed, 05 May 2004 06:35:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083753331.2129.450.camel@grendel>
References: <1083632597.2068.194.camel@grendel>
	 <40985AD6.8070101@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40985AD6.8070101@snapgear.com>
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-04 at 23:09, Philip Craig wrote:
>
> Given that there's only 56 bytes in the ICMP packet, and 40 bytes in the
> original TCP packet, all of which are headers, that packet by itself
> would be a very low bandwidth covert channel.  What makes you think it is?

Going off topic just a little here...
The pattern is nearly identical to what we documented here:
http://archives.neohapsis.com/archives/incidents/2000-01/0005.html

The major difference is these packets target an actual IP address rather
than x.x.x.0. This tells me it may be a variation off the original tool
adapted for a different OS (original zombie ran on SunOS). Just trying
to ID the tool.

> No, the feature is still there, but it only prints out the ports when
> it has a full TCP header.  While it would be possible to print the
> ports from just the first 8 bytes of the TCP header, iptables never
> has AFAIK. 

Think I figured it out. Check out the following:

Oct 30 22:36:53 gw2 kernel:  DROP  IN=eth0 OUT=eth0 SRC=207.88.240.101
DST=12.33.247.252 LEN=56 TOS=0x00 PREC=0x00 TTL=243 ID=0 PROTO=ICMP
TYPE=3 CODE=1 [SRC=12.33.247.252 DST=194.102.91.1 LEN=40 TOS=0x00
PREC=0x00 TTL=24 ID=41546 PROTO=TCP SPT=31632 DPT=4160 WINDOW=63498
RES=0x09 ACK RST SYN FIN URGP=0]

Port numbers decoded off a 56 byte packet but it has the "let's pretend
the sequence number field is the flag field" bug. I'm guessing when the
bug was fixed, the change was made so port numbers were no longer
translated when only 8 bytes of the TCP header are present.

Kind of a bummer to lose the additional info. May be able to fix this
with ulog.

Thanks for the re!
Chris



