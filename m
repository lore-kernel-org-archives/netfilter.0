From: "ss vincent" <w112318@hotmail.com>
Subject: linux-2.6.21 and iptables1.3.7 modprobe could not parse modules.dep
Date: Thu, 07 Jun 2007 11:13:51 -0400
Message-ID: <BAY142-F77D65DF43900A49CA787FB0260@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have a problem with the linux 2.6.21 and iptables 1.3.7, I've built 
ip_tables into the kernel with CONFIG_IP_NF_IPTABLES=y and build the 
iptables with NO_SHARED_LIBS=1, now when I start the iptables,  I got the 
error message, modprobe :could not parse modules.dep.

I have tried with CONFIG_IP_NF_IPTABLES=m, there are still some error.

when I build the itables without the "NO_SHARED_LIBS=1",  no modprobe error 
message, but the iptables couldn't get --dport work.

Some advice would be very welcome. Thanks very much.

Vincent

_________________________________________________________________
Fight Allergies With Live Search 
http://search.live.com/results.aspx?q=Remedies+For+Spring+Allergies&mkt=en-ca&FORM=SERNEP


