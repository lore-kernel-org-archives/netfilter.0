From: <mlist@libero.it>
Subject: Logging source mac address
Date: Sat, 2 Oct 2004 23:24:05 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <5650.48701032556$1096752275@news.gmane.org>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi

I installed Fedora core 2 and configured iptables with Guarddog and all
works correctly (I know to configure iptables manually is better but I need
to study it before manually write a configuration file).
My problem is that I need to know if is possible or not always logging
source mac address. With guarddog I tried all log levels ("debug", "alert",
"critical") but the problem is that mac address is not always registered.
Is there a way to log in all conditions (not only with drop or reject) the
source mac address???

Thanks a lot
Marco
Italy

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.771 / Virus Database: 518 - Release Date: 28/09/2004
 



