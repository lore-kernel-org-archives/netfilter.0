From: "Andrew Cant" <acant@logisense.com>
Subject: TPROXY vs REDIRECT
Date: Mon, 17 Oct 2005 10:08:33 -0400
Message-ID: <9651.82474251396$1129558256@news.gmane.org>
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

I have done some quick searches, and reviewed the TPROXY documentation but I
have not found an answer to the question of whether I should be using the
TPROXY target for a simple transparent proxy. (i.e., not listening on a
foreign address and not reporting a foreign address as a source)

Currently, the system that I am working on is using the REDIRECT targets to
transparently catch port 80 traffic and redirect it locally for either
caching or authentication. Is there any benefit to using the TPROXY target
in this case? I have not been able to find anything that explains what the
differences between the two targets would be in this simple case.

Thanks

Andrew

-----------------------------------
Andrew Cant
Developer
LogiSense Corporation
"IP Billing and Traffic Management"
  
e: acant@logisense.com
p: 1-519-249-0508 x4108
w: www.logisense.com
weblog: http://blog.logisense.com
forum: https://ssl.logisense.com/support/forum 


