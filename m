From: Richard Hector <rhector@paradise.net.nz>
Subject: detect original chain after jump?
Date: Sun, 28 Mar 2004 01:38:01 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040327133801.GA5251@fake>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

Mostly, people seem to write their filter chains splitting first by
interface and/or address, then by protocol/port.

I'm experimenting with doing it the other way round: I want to process
all the ssh traffic in one chain, then all the smtp in another etc.

This means that early on, I have something like:

iptables -A INPUT -j protocol
iptables -A FORWARD -j protocol

iptables -A protocol -p tcp --dport 22 -j ssh

But then I get a bit stuck. I need to then do different things depending
on the source and destination - which includes whether this packet is
arriving locally or being forwarded. Therefore it would be useful to
know whether this packet started out in the INPUT or FORWARD chain - but
that info seems to have been lost with the jump.

Is there any way to regain that?

Many thanks,

Richard


