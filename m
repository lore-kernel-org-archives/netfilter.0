From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: OT: Visualisation of traffic going through different qdiscs
Date: Sun, 10 Apr 2005 15:11:26 +0200
Message-ID: <000d01c53dce$d4828cd0$4206a8c0@loki>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi everybody,

I have a setup of traffic shaping via tc/iptables for which I would like to 
display the bandwidth usage for each of the qdiscs the traffic is sorted 
into. But with the bandwidth monitors I have seen so far, this seems not so 
easily possible, since they either display traffic for whole interfaces, or 
need their own rules for creating seperate graphs.
I think I remember a tool that was able to generate diagrams from the tc 
show output (unfortunately I do not remember its name...), something like 
this would be perfectly fitting my needs. Does anybody know its name or an 
equivalent or even better program?

Thank you,

Marius 


