From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: NAT tables and FILTER tables
Date: Wed, 14 Sep 2005 13:35:25 +0200 (CEST)
Message-ID: <52968.193.173.147.3.1126697725.squirrel@193.173.147.3>
References: <43280467.4050801@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43280467.4050801@india.tejasnetworks.com>
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

> Hi,
>
> I have a small query.
>
> I have read that whenever a packet requesting a connection is
> encountered, NAT table is used. My question is : Does it mean that for
> new connection request packets ONLY NAT table is considered and not
> default FILTER table?

Looking at http://www.faqs.org/docs/iptables/traversingoftables.html a
packet uses all tables, but not all chains.

What chain a packet traverses depends on the routing decision (i.e. if a
packet is for the local host or not), and/or if you DROP or REJECT a
packet (in the mangle or nat table) before it can enter the filter table.
Let's say you SNAT or DNAT a packet ; that packet is altered but will
continue to traverse the tables (filter/FORWARD).


Gr,
Rob



