From: varun <varun_saa@rediffmail.com>
Subject: iptable & user net logging
Date: Tue, 29 Aug 2006 19:16:34 +0530
Message-ID: <1156859195.5048.6.camel@nirvana.aurokruti.in>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I sharing my internet using the following
rule :

-A FORWARD -i eth1 -o eth0 -s 192.168.15.xxx -j ACCEPT

I would like to log individual user internet activity 
based on his IP.

How to do this ?

What kind of rule to add ?

Is there any ready to use software that will
parse a file and generate user friendly report ?

Thanks

Varun


