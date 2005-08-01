From: "Frank Abel Cancio Bello" <FRANKABEL@tesla.cujae.edu.cu>
Subject: about NFQUEUE and nth match
Date: Mon, 01 Aug 2005 16:29:43 -0400
Message-ID: <WorldClient-F200508011629.AA29430066@tesla.cujae.edu.cu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all!

Some time ago I post a mail in this list 
("https://lists.netfilter.org/pipermail/netfilter/2005-April/059499.html") 
asking about how manage packets  that was captured with "libipq" and "QUEUE" 
target in different threads or process.

Now with the new "NFQUEUE" target I can have many process reading parckets 
in different queues numbers and using "nth match" to spread equitably over 
all process the captured packects. My questions are:

1-What libipq's functions change and how? I look in the manpage in the 
recent 1.3.3 iptables release and don't find anything.

2-Is possible in the future include "nth match" patch in the mainline of 
kernel or this patch never will be included?

3-I'm in the right way? some suggestions?

Thank in advance
Frank





