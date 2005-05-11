From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: no Tarpit for debian kernel
Date: Wed, 11 May 2005 09:29:24 +0200
Message-ID: <4281B454.7070800@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hi All

I seem to have a problem with the debian 2.6.11 kernel, in that there is 
no TARPIT module (unless I completely missed it).

Im running iptables v1.2.11.

I downloaded the patchomatic from 
(http://www.netfilter.org/files/patch-o-matic-ng-20040621.tar.bz2).

on running the runme script, its asking for the iptables src.

So my question is, it there a way to patch the kernel, without having to 
get the iptables source.

I see that I do have the libipt_TARPIT.so.

Any tips and advice would greatfully be appreciated.

Kind Regards
Brent Clark

