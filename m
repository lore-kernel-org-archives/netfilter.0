From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: HUP
Date: Thu, 17 Mar 2005 14:24:53 +0200
Message-ID: <42397715.1030309@eccotours.dyndns.org>
References: <200503171203.j2HC3ENW024507@smtp26.wxs.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503171203.j2HC3ENW024507@smtp26.wxs.nl>
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
To: iptables <netfilter@lists.netfilter.org>

Sietse van Zanen wrote:
> Then indeed ip_conntrack must have a faulty connection in a bucket
> somewhere. You might be able to get rid of it by flushing your tables
> (reloading the firewall). Or rmmod the iptables modules.
> 
> I wouldn't worry too much about it though. It's probably the M$ client
> behaving badly, not sending FINs correctly, or something like that. Many M$
> clients are known to not close their connections correctly. It could
> ofcourse also be a network hick-up, causing the client to forcably
> disconnect but never closing the connection on TCP/IP level.
> 
> A reboot or reloading of the ip_conntrack module should fix it. Again, don't
> worry too much about it. Better make sure your Terminal Services are
> configured with idle session time-out limits etc.

HI Sietse

A big thanks for this. Suppose im been a bit looney about this.

Suppose I should wait for the TTL to kick in (Wonder why its so high though)
192.168.10.100,3389                            tcp     ESTABLISHED 
70:09:29

Thanks again.

Brent Clark



