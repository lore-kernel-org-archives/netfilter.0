From: "Frank Abel Cancio Bello" <FRANKABEL@tesla.cujae.edu.cu>
Subject: libipq and threads
Date: Fri, 01 Apr 2005 23:35:54 -0400
Message-ID: <WorldClient-F200504012335.AA35541031@tesla.cujae.edu.cu>
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

Using QUEUE target I pretend mangle some type of packet(the first packets 
for each flow), but for modify each packet I need a lot of processing. If I 
make all in a single thread in some situation(burst of packet to mangle) the 
delay of packets might up.

Then I think raise one thread for mangle each packet and in this thread call 
the function 
"ipq_set_verdict" with the new payload. I look and find 
"https://lists.netfilter.org/pipermail/netfilter/2003-October/047422.html"

Due to libipq isn't thread-safe I must copy the payload of each packet and 
pass it to the new 
thread in order to avoid rewrite it when arrive a new packet while I'm 
changing the previous 
packet payload. See 
http://www.experts-exchange.com/Programming/Programming_Platforms/Linux_Programming/Q_20766491.html

My question is:
Exist other precaution that I must take?

Thank in advance

Frank





