From: Twum.K.Djin@Dartmouth.EDU (Twum K. Djin)
Subject: can't initialize nat Table problem
Date: 25 Mar 2005 02:01:00 EST
Message-ID: <125952852@newdonner.Dartmouth.EDU>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/enriched; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,


I'm sure this problem has been handled before. I'm new to iptables and I will
like to use the nat table.


I tried to do "iptables -t nat -L"

and got the error:

iptables v1.3.1: can't initialize iptables table 'nat': Table does not exist (do
you need to insmod?).


I did insmod iptable_nat and got a lot of errors about unresolved symbols:

iptable_nat.o, ip_ct_find_helper_R2e1adde3,... etc.


What am I doing wrong?


Thanks

