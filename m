From: James Strickland <jstic04@cp.centennialcollege.ca>
Subject: Clearing conntrack? Extending size of conntrack?
Date: Thu, 29 Sep 2005 18:16:52 -0400
Message-ID: <433C67D4.9070907@cp.centennialcollege.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello, usually after about a day up uptime on my router, the ppp 
connection to my isp stays alive, but packets are not forwarded and 
nated through wan/lan interfaces.  My guess is that the conntrack is 
getting too large over this time (my brothers node uses nonsense like 
kazaa and bear share).  Is there a way to increase the conntrack size, 
or to clear it via /proc?

thanks.


