From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 09:11:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401230911.08584.Antony@Soft-Solutions.co.uk>
References: <400FC047.4010208@objeng.ch> <1089.12.75.166.13.1074782849.squirrel@nmibwkrf1.nexusmgmt.com> <4010E263.1080902@objeng.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4010E263.1080902@objeng.ch>
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
To: netfilter@lists.netfilter.org

On Friday 23 January 2004 8:59 am, Sven Burgener wrote:

> Dear John
>
> John A. Sullivan III wrote:
> > Is there any point at which you could use DNAT/SNAT to change each
> > private address to a public address? Alternately, can you build a VPN
> > tunnel between the two and tunnel the private addresses through the
> > tunnel?
>
> Perhaps a VPN tunnel would be the best solution. How would such a thing
> be established though, given that both A and B have private addresses?
>
> The two connections between A <--> X and X <--> B need to somehow be
> interconnected. Can this be done with VPN?

You can connect anything you like with a VPN, because the whole point about 
the P part of a VPN is that you are in charge of what it will route and what 
it won't - it is your Private network, not part of the open public Internet.

The only reason you can't route private addresses across the Internet is that 
all ISP routers drop packets sent to these address ranges.

You would set up your VPN system to forward these packets, just the same as 
you can set up your own firewalls and routers to forward them if you want to.

A VPN with two RFC1918 ranges at each end is a very common setup.

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


