From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: Re: PPTP through iptables firewall
Date: Fri, 7 Feb 2003 20:20:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c2cedd$ec0d3ce0$0401000a@robbysan.org>
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

> NB> connections involving GRE has changed from UNKNOWN to GRE. But=20
> NB> with this patch it is not possible to connect, now the windows=20
> NB> client only reach "verifying username and password" and then
> NB> times out.
>=20
> I had the same problem. I also tried to connect from external IP
> located behind firewall without any rules. I couldnt connect to
> pptp server also [with timeout]. Then I recognized then unloading=20
> ip_nat_pptp module causes the connection could be achieved correct.=20
> [Other related modules ie. ip_conntrack_pptp,=20
> ip_conntrack_proto_gre doesn't influence connection].

Here too. I can compile the thing, but it won't work.
I get messages in syslog like :

Feb  1 16:21:01 router kernel: ip_conntrack_pptp.c: bad csum
Feb  1 16:21:50 router last message repeated 3 times

The ip_conntrack|nat_pptp patch downloaded from www.impsec.org for
kernel 2.4.17 worked for me, but I need to compile a newer kernel and I
can't get it done anymore.

Is there someone who has got this working ??


Besides, isn't there anyone that hasn't got problems when compiling
iptables-1.2.7a ? It complains about not having if_name and if_index
defined in ipt_ROUTE.h. (plain kernel-2.4.20, patched with
pom-20030107).
In ipt_ROUTE.h I don't see an if_index nor if_name, however there is an
ifname. So I created the ifindex myself (unsigned int ifindex, it was
somewhere in the past pom's). And in the libipt_ROUTE.c file (iptables
package) I changed all instances if_name and if_index to ifname and
ifindex.

I don't know if that was the right thing to do, but now iptables
compiles and so far I don't have any problems with it.


Gr,
Rob


