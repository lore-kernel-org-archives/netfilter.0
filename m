From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with ppt_conntrack_nat
Date: Thu, 16 Sep 2004 08:37:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095338224.2045.17.camel@wolfpack.ljm.dom>
References: <020101c49b05$5dc59c70$0a00a8c0@admin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <020101c49b05$5dc59c70$0a00a8c0@admin>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="windows-1252"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-15 at 05:21, Pawe=C5=82 Filutowski wrote:
> Hello,
> I have just compiled a new kernel 2.4.27 with iptables 1.2.11 and patch=
-o-matic-ng-20040621
> First i tried to compile only kernel and iptables.
> Finally, everythings worked fine.
> But when I added the ppt_conntrack_nat (./runme pptp-conntrack-nat) and=
 I compiled kernel - I noticed that NAT(MASQUARADE) didn`t work (although=
 there wasn`t any errors during setting iptables).
> I use rc.firewall to setup iptables.
>=20
> Can anyone help me ?

this has got to go into a FAQ somewhere...oh wait--it already is...

http://netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.ht=
ml#ss2.3

after you patch with POM, you need to rebuild your userspace iptables
package.

-j

--=20
Jason Opperisano <opie@817west.com>


