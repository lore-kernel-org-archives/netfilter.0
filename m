From: "Bill Jameson" <bjameson1@qwest.net>
Subject: ip_nat_ftp on debian 2.4.20
Date: Sun, 13 Jul 2003 20:54:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00f901c349bb$a8722230$1304a8c0@morggin>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Im using Kernel-Souce 2.4.20.deb ... have loaded modules ip_tables
ip_conntrack iptable_nat ip_conntrack_ftp ... when i try to insmod
ip_nat_ftp i get kernel error ASSERT ip_conntrack_core.c:625
&ip_conntrack_lock not readlocked ... any idea how i can fix this ?


