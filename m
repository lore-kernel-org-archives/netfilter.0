From: =?iso-8859-2?Q?Pawe=B3_Filutowski?= <pfilutowski@koperfam.pl>
Subject: Problem with ppt_conntrack_nat
Date: Wed, 15 Sep 2004 11:21:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <020101c49b05$5dc59c70$0a00a8c0@admin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello,
I have just compiled a new kernel 2.4.27 with iptables 1.2.11 and =
patch-o-matic-ng-20040621
First i tried to compile only kernel and iptables.
Finally, everythings worked fine.
But when I added the ppt_conntrack_nat (./runme pptp-conntrack-nat) and =
I compiled kernel - I noticed that NAT(MASQUARADE) didn`t work (although =
there wasn`t any errors during setting iptables).
I use rc.firewall to setup iptables.

Can anyone help me ?







