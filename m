From: Peter Marshall <peter.marshall@caris.com>
Subject: pptp nat and fedora core3
Date: Thu, 17 Feb 2005 09:41:47 -0400
Message-ID: <42149F1B.1000504@caris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I am building a firewall that has to support the natting of pptp ... I 
was hoping fedora core 3 would have the necessary conntrack modules 
(like gre and pptp) built into the kernel ... but it does not ...

I would REALLY prefer to not have to re-compile the kernel ... Is there 
a "laodmodule" line I can use to add the stuff at runtime ?  What 
modules do I need ?

I am going to have windows xp boxes use the built in pptp client to 
connect out of my lan to an external site ....

Is there a difference between what you would do with rh9 and fed core3

Thanks for the advice,
Peter


