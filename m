From: gabriel smolar <jarod125@ipipi.com>
Subject: unexplained conntrack entries
Date: Sat, 26 Jul 2003 12:14:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <24027487.1059246902125.JavaMail.operator_neoplanta1@neoplanta1>
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

when i do cat /proc/net/ip_conntrack i get o lot of entries like:
---------
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.184 sport=59975 dport=80 [UNREPLIED]
src=192.168.1.184 dst=192.168.1.1 sport=80 dport=59975 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.185 sport=59974 dport=80 [UNREPLIED]
src=192.168.1.185 dst=192.168.1.1 sport=80 dport=59974 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.185 sport=59975 dport=80 [UNREPLIED]
src=192.168.1.185 dst=192.168.1.1 sport=80 dport=59975 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.186 sport=59974 dport=80 [UNREPLIED]
src=192.168.1.186 dst=192.168.1.1 sport=80 dport=59974 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.186 sport=59975 dport=80 [UNREPLIED]
src=192.168.1.186 dst=192.168.1.1 sport=80 dport=59975 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.187 sport=59974 dport=80 [UNREPLIED]
src=192.168.1.187 dst=192.168.1.1 sport=80 dport=59974 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.187 sport=59975 dport=80 [UNREPLIED]
src=192.168.1.187 dst=192.168.1.1 sport=80 dport=59975 use=1
tcp 6 359867 ESTABLISHED src=192.168.1.1 dst=192.168.1.188 sport=59974 dport=80 [UNREPLIED]
src=192.168.1.188 dst=192.168.1.1 sport=80 dport=59974 use=1
---------
The sport is in the 56000 range and the dst is in the 192.168.1.* range. 192.168.1.1 is a slack 8.1 router with only sshd running, the rest of the lan are win boxes.
i can't figure it out what's generating these requests...
They don't show up when i monitor the traffic with iptraf.

