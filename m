From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: Only MASQ/NAT, no FORWARDing?
Date: Tue, 28 Jan 2003 20:19:51 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301282016390.4136-100000@localhost.localdomain>
References: <E18bQfG-0007hN-00@trillium-hollow.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E18bQfG-0007hN-00@trillium-hollow.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: erich@uruk.org
Cc: netfilter@lists.samba.org


On Wed, 22 Jan 2003 erich@uruk.org wrote:

> I figured out how to keep masquerading only going one direction, but
> what I can't figure out is how to disable all normal packet forwarding
> other than the masqueraded connections with iptables.  I.e. someone on
> the other side who knows my internal IP addressing can still send
> crafted packets through my firewall.

What if you add rules to the filter table that prevent packets from
"entering" eth0 unless they have a destination address of eth0?

A similar suggestion applies to eth1.

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117

P.S. Thanks for GRUB :-)




