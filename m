From: "Greg Scott" <GregScott@InfraSupportEtc.com>
Subject: Problems building ip_conntrack_pptp with kernel 2.6.12.5;
	and what does nfnetlink do?
Date: Sun, 28 Aug 2005 18:06:47 -0500
Message-ID: <365871C49598504A9481DDBEC3EB49551231DF@MAIL.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi all -=20

I am trying to build a 2.6.12.5 kernel with the patch-o-matic-20050825
pptp patches.  Make modules dies with this problem:

WARNING:
/lib/modules/2.6.12.5fw20/kernel/net/ipv4/netfilter/ip_conntrack_pptp.ko
needs unknown symbol __ip_conntrack_expect_find

I edited the EXTRAVERSION line in Makefile and I started with the
.config file that came with RedHat fc4 and 2.6.11-1.  I updated my copy
of .config with make oldconfig. =20

This is how I put in the PPTP and other patch-o-matic patches:

cd /usr/src/patch-o-matic-ng-20050825

./runme --batch connlimit
##./runme --ip_contrack_count (Not in the .tar file)
./runme --batch iprange
./runme --batch mport (multiport match - deprecated soon)
./runme --batch psd

./runme --batch comment
./runme --batch h323-conntrack-nat
##./runme --batch ipp2p (Not in the .tar file)
./runme --batch pptp-conntrack-nat

I did some more detective work.  A google search led me to a suggestion
that the ip_conntrack__pptp patch now depends on another patch called
nfnetlink.  So I went to my copy of the expanded POM tree and looked.
Here is what I found:

[root@gsgv-fw nfnetlink]# pwd
/usr/src/patch-o-matic-ng-20050825/patchlets/nfnetlink
[root@gsgv-fw nfnetlink]# cd ..
[root@gsgv-fw patchlets]# grep -R ip_conntrack_expect_find *
ctnetlink/linux-2.6.patch:+__ip_conntrack_expect_find(const struct
ip_conntrack_tuple *tuple)
ctnetlink/linux-2.6.patch:+ip_conntrack_expect_find_get(const struct
ip_conntrack_tuple *tuple)
ctnetlink/linux-2.6.patch:+     i =3D __ip_conntrack_expect_find(tuple);
ctnetlink/linux-2.6.patch:+EXPORT_SYMBOL(__ip_conntrack_expect_find);
ctnetlink/linux-2.6.patch:+EXPORT_SYMBOL(ip_conntrack_expect_find_get);
ctnetlink/linux-2.6.patch:+__ip_conntrack_expect_find(const struct
ip_conntrack_tuple *tuple);
ctnetlink/linux-2.6.patch:+ip_conntrack_expect_find_get(const struct
ip_conntrack_tuple *tuple);
ctnetlink/linux-2.6.11/net/ipv4/netfilter/ip_conntrack_netlink.c:
exp =3D ip_conntrack_expect_find_get(tuple);
ctnetlink/linux-2.6.11/net/ipv4/netfilter/ip_conntrack_netlink.c:
exp =3D ip_conntrack_expect_find_get(tuple);
ctnetlink/linux-2.6.11/net/ipv4/netfilter/ip_conntrack_netlink.c:
exp =3D __ip_conntrack_expect_find(tuple);
netfilter-docbook/linux-2.4.patch: ip_conntrack_expect_find_get(const
struct ip_conntrack_tuple *tuple)
netfilter-docbook/linux-2.6.patch: ip_conntrack_expect_find_get(const
struct ip_conntrack_tuple *tuple)
nfnetlink-ctnetlink-0.13/linux-2.6.patch:+      exp =3D
ip_conntrack_expect_find_get(tuple);
nfnetlink-ctnetlink-0.13/linux-2.6.patch:+      exp =3D
ip_conntrack_expect_find_get(tuple);
nfnetlink-ctnetlink-0.13/linux.patch: ip_conntrack_expect_find_get(const
struct ip_conntrack_tuple *tuple)
nfnetlink-ctnetlink-0.13/linux.patch:
EXPORT_SYMBOL_GPL(ip_conntrack_expect_find_get);
nfnetlink-ctnetlink-0.13/linux/net/ipv4/netfilter/nfnetlink_conntrack.c:
exp =3D ip_conntrack_expect_find_get(tuple);
nfnetlink-ctnetlink-0.13/linux/net/ipv4/netfilter/nfnetlink_conntrack.c:
exp =3D ip_conntrack_expect_find_get(tuple);
pptp-conntrack-nat/linux-2.6.11/net/ipv4/netfilter/ip_conntrack_pptp.c:
exp =3D __ip_conntrack_expect_find(t);
[root@gsgv-fw patchlets]#=20

Based on the above, it looks like ctnetlink defines and exports the
missing symbol.  A look at the info for ctnetlink tells me it depends on
nfnetlink.  I see two, maybe three choices for nfnetlink:  These are,
nfnetlink, nfnetlink-ctnetlink-0.13, and nfnetlink_queue.

The info for nfnetliink-ctnetlink-0.13 says this one is deprecated.
Although recursive grep above shows that nfnetlink-ctnetlink mentions
the missing symbol, its deffinitions may be obsolete. =20

The info for nfnetlink_queue says it depends on nfnetlink.=20

The info for nfnetlink only says it depends on a kernel >=3D 2.6.0.  And
the info for all these modules is maddening because it  does not tell me
what they do!

I decided to add nfnetlink and ctnetlink to the list of POM patches I
use and try another kernel build. =20

The nfnetlink patch went in with no problems.  But ctnetlink gave me
this:

Testing ctnetlink... not applied
The ctnetlink patch:
   Author: Jay Schulist, Harald Welte, Patrick McHardy, et.al.
   Status: Stable

newfile: 4 files in our way, unable to apply
ERROR (6 rejects out of 48 hunks)
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] n


I said no - the last thing I want is to put in a messed up patch!

So now I am stuck again. =20

Is there some order in which I should apply these patches?  Am I
applying the correct patches?  How do we add the pptp patches these
days???

Thanks

- Greg Scott
  GregScott@InfraSupportEtc.com
  USA cell phone 1-651-260-1051




