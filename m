From: Jason Opperisano <opie@817west.com>
Subject: Re: snooping port 25 packets
Date: Mon, 04 Oct 2004 21:21:48 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096939308.1787.20.camel@wolfpack.ljm.dom>
References: <4161C991.1070705@mortonfarms.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4161C991.1070705@mortonfarms.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-10-04 at 18:07, Doug Yeager wrote:
> i would like to use netfilter to snoop SMTP packets on my firewall.
> has anybody done this?  is it possible?
> i was leaning in the direction of trying to use the QUEUE target for 
> user space processing.....but i'm not sure if that is the way to go.

the QUEUE target is the way to go if you need to do custom processing to
make the accept/drop decision; or if you want to modify & reinsert the
packet into the stream.

> once i send the packet to the QUEUE target, how do i put it back on the 
> wire?
> what i really want is a copy of each packet to port 25 sent to a user 
> space program.

if you just need to capture packets, you can use any bpf reader to do it
(tcpdump, snort, ethereal).

not 100% sure what you looking to do, but snort inline
(http://snort-inline.sourceforge.net/) may be of some use to you as
well.

-j

-- 
Jason Opperisano <opie@817west.com>


