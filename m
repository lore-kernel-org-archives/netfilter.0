From: "fxian_2003" <fxian_2003@mails1.hust.edu.cn>
Subject: Help!! network traffic limit function of iptables didn't work effectively to repel DoS attack.
Date: Fri, 1 Nov 2002 5:46:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7755C6A016B3.AAAE5B@mails1.hust.edu.cn>
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hi!
    To defend DoS attack,iptables implement rate-limit function. Today I used a DoS-type attack tool to syn-flood the targeted machine, the CPU load of the machine rised sharply to 90%. Then I add a iptables limit rule in which limit rate is 3/min, but the result was dissapointed for the load of CPU was still 90%. So I deduced that traffic limit function could't repel DoS attack effectively.  If somebody is interested in my experiment, I can mail him my hacker software.

B.T.W
   The DoS tool I used is run on Windows platform. 


cheers
Feng Xian
            fxian_2003@mails1.hust.edu.cn


