From: <smalik@vistawiz.com>
Subject: ip_conntrack_lock not readlocked ? anyone ....
Date: Tue, 15 Oct 2002 12:38:09 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1822.192.168.200.200.1034699889.squirrel@w3.vistawiz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

hello everyone -

I was wondering if someone has seen this error message before.  Prt what
does is mean? I am running iptables 1.2.7.

Oct 13 11:50:18 fire kernel: ASSERT ip_nat_core.c:739
&ip_conntrack_lock_Rsmp_4193d6ac readlocked
Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:91
&ip_conntrack_lock_Rsmp_4193d6ac readlocked
Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:743 &ip_conntrack_lock
not readlocked
Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:977
&ip_conntrack_lock not readlocked
Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:840 &ip_conntrack_lock
not readlocked
Oct 13 11:50:18 fire kernel: ASSERT ip_nat_core.c:739
&ip_conntrack_lock_Rsmp_4193d6ac readlocked
Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:91
&ip_conntrack_lock_Rsmp_4193d6ac readlocked
Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:743 &ip_conntrack_lock
not readlocked
Oct 13 11:50:18 firekernel: ASSERT: ip_nat_core.c:840 &ip_conntrack_lock
not readlocked

thanks
hallian



