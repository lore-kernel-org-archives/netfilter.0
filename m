From: Bruce Henshaw <salacious@redphive.org>
Subject: ROUTE extension for linux 2.6.3 HELP
Date: Sat, 06 Mar 2004 15:28:34 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078615714.12327.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hello,

 I have a need to direct certain traffic out certain WAN interfaces,
which have dynamic addresses.

 I'm unable to patch my 2.6.3 kernel with the ROUTE extension though. :(
is there another way to do that?

I tried the new patch-o-matic-ng CVS and it says ROUTE requires kernel <
2.6.0

 But I do see this file.

 patch-o-matic-ng/ROUTE/linux-2.6/net/ipv4/netfilter/ipt_ROUTE.c

 How I can add ROUTE in my 2.6.3 kernel?

 Thanks very much for reading about my problem.

Bruce Henshaw


