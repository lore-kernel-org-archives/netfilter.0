From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Apply rules to 1 UDP port but port used as a socket: possible?
Date: Wed, 11 Feb 2004 00:25:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402110025.48644.Antony@Soft-Solutions.co.uk>
References: <D4EF10CCEB2CE742BEEA9838C590B0E80113FA41@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D4EF10CCEB2CE742BEEA9838C590B0E80113FA41@ftrdmel2.rd.francetelecom.fr>
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

On Tuesday 10 February 2004 1:16 pm, zze-Proxy GRALL O ext FTRD/SVA/LAN wrote:

> Hello to IPTables users,
>
> I'm trying to use a socket (on port 1727) to decode some proprietary UDP
> packets. When I've decoded them I want to apply a DNAT rule (and then a
> SNAT  too) to this port using a filter on @IP:port source for all
> following packets...

I *think* what you're saying is that you want to receive packets on a socket 
bound to port 1727, and *then* you want to NAT the packets (which happens in 
the kernel, around about the routing stage, before they're handed over to a 
listening socket....).

If this interpretation is correct, then the very least reason why you can't do 
what you want is because once the packets have been accepted by a socket, 
they're no longer available to netfilter to be NATted, because they've 
already been delivered.

Have I misunderstood what you're trying to do?   Or are you really trying to 
redirect packets after they've arrived at their destination?

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


