From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Purely NAT
Date: Mon, 28 Oct 2002 14:44:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281444.g9SEime08636@vulcan.rissington.net>
References: <005401c27e43$73946990$0bc8c80a@dolphin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005401c27e43$73946990$0bc8c80a@dolphin>
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
To: "netfilter@lists" <netfilter@lists.netfilter.org>

On Monday 28 October 2002 5:32 am, yenjet.chan@eglobal.com.my wrote:

> Hi all,
>
> This is my first post to the list, so please bare with me.
> I have a requirement here. Is there possible to create a purely NAT
> iptables rules for certain IP addresses?

No.   You can turn off stateful inspection by not loading or compiling the 
connection tracking support, but you cannot use it for some addresses but not 
others.

> What I means here is I want to enable stateful filtering for most of the
> all of the users except certain IP address/subnet. Stateful filtering is
> good sometime, bu not all the time, when you really want to do portscaning
> activities from a machine that sit behind the firewall.

How much memory is in the netfilter machine / what size is your conntrack 
table / how many connections are you generating with your portscans for this 
to be a problem ?

Maybe it would help if you compile conntrack as a module and then you can 
unload it when you want to empty the connection tracking table ?   (This will 
unload *all* the entries at the same time, though).

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

