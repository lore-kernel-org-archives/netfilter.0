From: Daniel 'NebuchadnezzaR' Dehennin <nebuchadnezzar@nerim.net>
Subject: unapplied patch-o-matic patches
Date: Tue, 15 Jul 2003 18:46:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87k7aj7n7b.fsf@zion.matrix>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I test the patch-o-matic 20030714, some patch don't apply to my kernel
2.4.21, is there a way to know why a patch did not apply ?
I'm thinking about :
-  extra/tcp-window-tracking
-  pending/49_ip-conntrack-expect-drop-refcnt
-  pending/40_nf-log-ipv6
-  pending/40_nf-log
-  pending/28_mirror-fixes
-  submitted/24_conntrack-nosysctl

The list come from a pom in reverse mode, the
submitted/24_conntrack-nosysctl was apply cleanly in a ./runme base,
and with a ./runme extra (for a look ;-)) the pom doen't see this
applied patch, and then the patch fail.

Have you any recommendations for snapshot pom ?

Thanks.
-- 
Daniel 'NebuchadnezzaR' Dehennin


