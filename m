From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: libipq: problems changing destination port
Date: Tue, 1 Nov 2005 01:24:38 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0511010117560.17023@filer.marasystems.com>
References: <20051031192724.16806.qmail@web52802.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051031192724.16806.qmail@web52802.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Lore <skizzo82@yahoo.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Mon, 31 Oct 2005, Lore wrote:

> I get every outgoing packet to userspace, get the ip
> and port, connect to server to check if it has the
> required services and daemon (the latter is part of my
> project) and if both are true I redirect every
> outgoing packet of that kind (port and IP) to a
> predefined port. (if only the former is true, packets
> are verdicted as NF_ACCEPT without any change)

Ok.

> As we ascertained, in the case service and daemon are
> available, I have to change the port of all incoming
> packet of that connection...

Yes.

> Do you think has better performance to add a new chain
> for every port used (via execv) or to use a chain that
> redirects every incoming packet to userspace, so that
> I have to do a clean NF_ACCEPT to every incoming
> connection that is not of my kind?

I would just set a mark or similar, and then use the iptables nat to 
change the port... In mangle, just QUEUE the NEW traffic on the relevan 
port(s), in the userspace queue handler do all the checks and return the 
status of the check as nfmark, and in the nat table look for that mark to 
decice if the port needs to be changed.

But if you really want to do the port translation in userspace, then 
packets in both directions MUST be sent to QUEUE in iptables and the 
userspace would need to figure out what to do with the traffic. And you 
also MUST make sure that ip_conntrack is not activated (loaded) on the 
server.

Regards
Henrik


