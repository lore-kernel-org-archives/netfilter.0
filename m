From: Jason Opperisano <opie@817west.com>
Subject: Re: Reject all the interfaces
Date: Tue, 21 Dec 2004 23:05:41 -0500
Message-ID: <1103688341.7337.26.camel@hubcap.ljm.dom>
References: <1103685827.9049.23.camel@che>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103685827.9049.23.camel@che>
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

On Tue, 2004-12-21 at 22:23, Erico Augusto wrote:
> Hi,
> 
> I had the simple task to block the connection of 3 workstation(loopback
> and eth0) after a certain hour. So, I decided to put the single rule:
> 
> iptables -I OUTPUT -j REJECT --reject-with icmp-host-prohibited
> 
> After that, a friend of mine told me the following:
> 
> It's better to reject the eth0 only, because, with the rule above, I'm
> blocking the loopback also, and the services that depends on that
> "interface", 

remove the quotes--lo is a real interface just like eth0.  i agree with
your friend that blocking all packets on lo is a very bad idea if these
are workstations.  since unix windowing environments are network
client/server architecture, blocking packets on lo has interesting side
effects like not being able to use your keyboard anymore (yes--i did
this once).  also--if you're trying to block outbound network
connections, blocking lo isn't helping you achieve this result.

> such as all the unix sockets based applications.

unix domain sockets have nothing to do with the loopback interface.

> That is my doubt. I read a lot of documentation about the netfilter
> architecture, but there is that gap of knowledge. The documentation
> never speaks about the differences between unix and tcp sockets.

because netfilter doesn't deal with unix domain sockets.  the netfilter 
documentation never speaks about IPX/SPX or AppleTalk either, but i
don't consider that to be a short-coming.

> Instead of search directly in google,I decided to ask here in netfilter
> list: Where can I find that kind of information(nefilter x unix/tcp
> sockets)?

by searching google.  or reading stevens' vol. 3  

-j

--
"Me fail English? That's unpossible."
	--The Simpsons


