From: Luca Bedogni <ml@lucabedogni.it>
Subject: ipq_set_verdict()
Date: Thu, 14 Dec 2006 18:12:18 +0100
Message-ID: <200612141812.18142.ml@lucabedogni.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all
	first message for me here.
I'm trying to study netfilter and the kernel, in particular for the part 
regarding MTU. I'm having a bit of trouble understanding a thing:
if i get a packet from the netfilter queue, adding 4 bit and exceeding the 
MTU, and then call ipq_set_verdict with parameter NF_ACCEPT, what happens? Is 
the packet dropped by the kernel, by iptables or he can goes freely?

Regards
-- 
Debian Powered GNU/Linux User #373118
Bedogni Luca - 	Blog | http://blog.lucabedogni.it
		Site | http://www.lucabedogni.it
Debianizzati - www.debianizzati.org | Founder Member

