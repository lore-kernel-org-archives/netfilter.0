From: "Tarek W." <ticallion@hotpop.com>
Subject: Re: Re[2]: efficient source address filtering and logging?
Date: Tue, 04 Nov 2003 05:55:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067873921.1456.4.camel@carve.localdomain>
References: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
 <191594195858.20031102122904@lf.lv> <1067773514.1562.26.camel@valhalla>
 <200311020848.23739.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200311020848.23739.Alistair@nerdnet.ca>
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

don't forget that throughput is affected by how many rules a packet is
inspected against... and in FORWARD all packets part of a stream r
seen... a flat structure is wrong by any standards, performance and
maintenance also... dunno if nf-hipac at netfilter.org has the relevant
lit, but on the original nf-hipac site, u have extensive data on how the
number of rules affects throughput.


