From: boka <boka@sto-procent.art.pl>
Subject: How to upgrade iptables
Date: Tue, 29 Jun 2004 16:44:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E18057.5060807@sto-procent.art.pl>
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

Hi !

After sucessfully build of new version of iptables, i have checked if 
the rules are ok to new version. My previous version was 1.2.10.

root@qw:~/iptables/sources/iptables-1.2.11# ./iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
iptables: target `standard' v1.2.10 (I'm v1.2.11).

i dont know what to do next - there is no upgrade procedure in source docs.

greetz
boka

