From: Jason Opperisano <opie@817west.com>
Subject: Re: duplicating packets to other interface
Date: Mon, 13 Dec 2004 21:49:50 -0500
Message-ID: <1102992590.3390.26.camel@hubcap.ljm.dom>
References: <1102900009.41bceb29f2fac@www.banda.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102900009.41bceb29f2fac@www.banda.lv>
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

On Sun, 2004-12-12 at 20:06, zhuupa@banda.lv wrote:
> hello,
> 
> maybe my question sounds stupid to you but i've tried googling around
> and couldn't find any valuable results. so, situation is here:
> 
> internet == [:eth0 router eth1:] == ids sensor (192.168.0.0/16)
>             [             eth2:] == clients (10.0.0.0/8) 
> 
> so far it's a router which routes (nat) packets between external network
> and clients. i added ids sensor to eth1 interface and would like incoming
> packets on eth0 interface to be duplicated to eth1 so that ids sees them.
> 
> the question is - how can i do that? i haven't messed with iptables much,
> and our network administraitor says it's not possible with iptables.
> i don't believe him, however ;>
> 
> on openbsd packet filter it would look like this:
> pass in on $ext_if dup-to $ids_if all

ah--the beautiful simplicity of OpenBSD's pf...alas--this is a different
list...

> i believe it's as simple on iptables.

heh--you'd think that.

one possible packet-filter-independent solution would be to plug eth0 of
iptables machine, the upstream router and the IDS into a switch and span
the port from the iptables machine to the port of the IDS' promiscuous
sniffing interface.  this could also be done with a dumb hub and no
spanning...

i know this isn't actually an answer to your question, but it sorta
accomplishes the task at hand.

-j

--
"To alcohol: the cause of, and solution to, all of life's problems."
	--The Simpsons


