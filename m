From: "Rob Sterenborg" <rob@sterenborg.xs4all.nl>
Subject: RE: connection track == stateful inspection(Check Point Firewall)???
Date: Sat, 22 Feb 2003 10:32:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c2da55$4da9bc80$0401000a@robbysan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

> connection track(Iptables) and stateful
> inspection(Check Point Firewall) is same???
> I think:
> connection track is only "track", can not filter.
> stateful inspection can filter according to the packet=20
> information. Is that correct? what is the difference between=20
> connection track and stateful inspection???

I think you misunderstood something ; iptables is the userspace program
for Netfilter.
As in NetFILTER. Which means it is able to filter.
That's why there are 3 tables with filter being the default table.

You can filter just fine using iptables. And you can make it stateful by
using the conntrack modules.


Gr,
Rob


