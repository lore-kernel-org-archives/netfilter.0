From: "Sarkis Gabriel" <sarky@raycon.net>
Subject: iptables is giving me probs
Date: Thu, 3 Oct 2002 19:03:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003801c26b07$2eb25f20$68287bd5@p4226>
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

Hi all
Well i am new to this list, and i have been trying to fix this problem for a
while but i dont know what is causing this problem in the first place.
i installed RH 7.2 and when i wanted to use iptables it gave me this error :
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: init_module:
Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, including
invalid IO or IRQ parameters
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: insmod
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: insmod
ip_tables failed
iptables v1.2.5: can't initialize iptables table `filter': iptables who? (do
you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

well it is driving me crazy i didnt do anything it is like that with a fresh
install even on 7.3
and i upgraded to that version to see if it will fix it but nope no luck..

Please advice thanx

Sarky


