From: Mike <1100100@gmail.com>
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 1 Sep 2004 14:12:56 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca4228204090111127401567b@mail.gmail.com>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<200409011044.27158.Alistair@nerdnet.ca>
	<8ca4228204090109202271a1da@mail.gmail.com>
	<200409011253.52931.Alistair@nerdnet.ca>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409011253.52931.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Alistair Tonner <alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

> Better to let things through the mangle and nat tables, and do filtering in
> the filter table.  There have been folks who like to drop things in the
> mangle and nat tables, but setting actual DROP policies makes life very
> difficult.

This seems like sound advice after what I've been through.  Maybe the
folks in The Matrix can bend the laws of physics with relative ease,
but for myself, I can barely achieve 'dude' status.  I think I'll
ACCEPT mangle and nat, and get some sleep tonight.  :-)

>         There is no definition of the SOURCE that you want to drop ICMP echorequests
> from.  Thus this rule drops all ping echorequests.
>         iptables -t filter -A INPUT -p icmp -i [internet pipe device] -icmp-type \
> echo-request -j DROP
>         will allow your LAN users to ping the box, but prevent pings from the
> internet from getting in.

Oh I see.  By stating specifically the internet-facing device, you
make it possible for LAN clients to ping the box through the gateway
NIC - eth1, while the rule blocks all the other echo requests.

>         Really and truely -- Oskar's tutorials are great and easy to read... and even
> the sample firewalls there are decent enough to start with for a newbie.
> 
I definitely feel more secure about working on my firewall knowing
that this reference material is around.  It's packed.

Thanks again, Alistair.
It's great to have your assistance.

Mike

