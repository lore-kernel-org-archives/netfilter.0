From: Rickard Eriksson <riceri@home.se>
Subject: PPTP conntrack
Date: Mon, 14 Oct 2002 10:50:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DAA853F.8070900@home.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

When i try to use pptp conntrack module and the proto gre module i get 
this in the log file, anyone know what can be wrong?


kernel: ip_conntrack_pptp.c: bad csum
kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
kernel: ASSERT ip_conntrack_core.c:1067 &ip_conntrack_lock not readlocked
kernel: ASSERT ip_conntrack_core.c:1076 &ip_conntrack_lock not readlocked
kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked
kernel: ASSERT ip_conntrack_core.c:94 &ip_conntrack_lock readlocked
kernel: ASSERT: ip_nat_core.c:839 &ip_conntrack_lock not readlocked



