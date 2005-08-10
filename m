From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: What is ACK PSH FIN and why is it blocked?
Date: Wed, 10 Aug 2005 17:26:06 -0400
Message-ID: <1123709165.2241.162.camel@grendel>
References: <1123600895.17896.40.camel@ws50.darkcore.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123600895.17896.40.camel@ws50.darkcore.net>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tue, 2005-08-09 at 11:21, John Lange wrote:
>
> I get quite a number of packets dropped as follows; This is packet from
> my web server to a given host:
> 
> Aug  8 01:20:12 venus kernel: IN= OUT=eth0 SRC=<myServerIP>
> DST=<someHost> LEN=471 TOS=0x00 PREC=0x00 TTL=64 ID=13332 DF PROTO=TCP
> SPT=80 DPT=10067 WINDOW=1716 RES=0x00 ACK PSH FIN URGP=0

<snip>

> So what is a packet with "ACK PSH FIN" set? I assume they are being
> blocked because they are neither "SYN" nor part of an established
> connection? But what are they and should they be allowed?

Here's what's happening:
TCP 3 packet handshake takes place
Client issues a data request
Client issues a FIN/ACK since its done transmitting info
Netfilter drops the state time out to 60 seconds
Server starts transmitting data back to the client
More than 60 seconds goes by
Netfilter removes the state entry
Server can never complete the data transfer and continually tries to
issue a FIN/ACK to close the connection
Netfilter drops all FIN/ACK's because the state table entry is gone

I reported this problem back in 2000 and the time out was increased to
120 seconds. At some point a few years back the time out was dropped
back down again causing the problem you are seeing.

So its not a malicious packet, just a bug/feature in the code.

HTH,
Chris



