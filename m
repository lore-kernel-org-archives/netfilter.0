From: Mike Carlton <mikecarlton@gmail.com>
Subject: injecting packets from QUEUE handler
Date: Thu, 6 Jan 2005 21:39:29 -0800
Message-ID: <f663f6360501062139f283c00@mail.gmail.com>
Reply-To: Mike Carlton <mikecarlton@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I've got an application where I need to inspect up to the first 2 data
packets of a new HTTP connection before deciding whether to pass or
alter the connection data (in particular, I need to see the initial
HTML data and some servers will send HTTP headers in one packet and
data in the next).

I've setup a QUEUE target so that I can do this all in user space.  It
is easy enough to cache the contents of the first packet (if we need
to inspect the second for this particular connection) and return
NF_DROP.

The question is how to best handle the case when we inspect the second
packet and decide everything is fine so it is time to send the saved
first packet and the current second.

I'm planning on just NF_ACCEPTing the second packet, then using a
PF_PACKET socket to re-inject the contents of the first packet.

Is there a cleaner way to do this?  I'll have to take care of various
corner cases (ie. the packets get dropped or duplicated before
reaching us).  I'll let the clients deal with the out of order packet
arrivals that we cause.

thanks,
--mike

