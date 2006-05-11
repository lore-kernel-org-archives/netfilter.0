From: Valerio Bruno <valerio.bruno@torlug.org>
Subject: queue order and conntrack callback
Date: Thu, 11 May 2006 22:56:02 +0200 (CEST)
Message-ID: <20060511205602.22041.qmail@web86909.mail.ukl.yahoo.com>
Reply-To: valerio.bruno@torlug.org
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

Hi all,
i need to capture tcp packets so i'm using
libnetfilter_queue to get them; with 
an iptables rule i send packets in a queue and then
accept/drop them from my application code.

Now the question is: can i suppose that packets are
correctly sorted ? 
I mean sorted by data order, for example:

tcp packet 1
from A to B
seq. number 412
data: 111

tcp packet 2
from A to B
seq number 415
data: 222

Can i always suppose that packet number 2 is processed
AFTER number 1 ? Or is it an incorrect assumption?
if netfilter sort packages before puts them on queue,
i avoid to write code that re-sort packages. 

Moreover i need connection tracking: i thought about
libnetfilter_conntrack, but

where i can find informations about
nfct_register_callback function and parameters passed
to the callback? (utils/ctnl_test.c and source code
apart)

does libnetfilter_conntrack detect connection not
issued/received by local host (eg connection throught
netfilter machine not from/to it)? 

Sorry for the length of the message and my poor
english. 

Any help will be appreciated!

Valerio

PS
It's very hard finding netfilter libs
documentation.Why don't create a wiki ? if every one
adds a line of text we add a lot of docs..


