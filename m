From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: libnetfilter_conntrack
Date: Sat, 5 Jan 2008 11:44:27 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0801051139420.32055@mail3.jubileegroup.co.uk>
References: <1C795E2FCD154E46979DDDD5374B5ABE01C7CB18@TTMAIL2.teltone.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1C795E2FCD154E46979DDDD5374B5ABE01C7CB18@TTMAIL2.teltone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Fri, 4 Jan 2008, Hal Moroff wrote:

> I have a firewall application that creates/deletes iptable
> (netfilter) rules dynamically in response to client requests
> ... later my application closes that route by removing the rule.
> The problem is that TCP connections persist, so even though I remove
> the rule, the client (if already connected to the target device) can
> continue to use that connection.  I use 'cutter' to terminate the
> connection, and that works most of the time, however the connection
> remains listed in /proc/net/ip_conntrack ... I've set
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_{close,close_wait}
> to 0, and that doesn't seem to help.

Try setting 'ip_conntrack_tcp_timeout_established'?

See for example

http://lists.netfilter.org/pipermail/netfilter/2005-May/060160.html

--

73,
Ged.
